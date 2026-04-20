# Tailscale Brief Server — Planning Doc

**Date:** 2026-03-30
**Status:** Not started
**Owner:** hq (cross-project infrastructure)
**Consumer:** your-project Telegram notifications (immediate), other projects later

---

## Problem

Your-project generates daily briefs (.md) and dashboards (.html) that get pushed to GitHub. Telegram notifications include links, but:
- Repo is private (and must stay private — financial data)
- GitHub Pages requires public repo or paid plan
- Need mobile access from phone via Telegram links

## Solution

Lightweight static HTTP server on the Mac, accessible only via Tailscale mesh. Telegram links point to `http://<tailscale-hostname>:<port>/briefs/dashboard-2026-03-30.html`.

Fully private — only devices on YOUR_USER's Tailscale network can reach it.

---

## What Exists

- Tailscale is installed and running
- Your-project briefs at `~/projects/your-project/briefs/` (both .md and .html)
- Telegram bot sends notifications with placeholder GitHub Pages links (currently dead)

---

## Design Decisions Needed

### 1. Server choice

| Option | Pros | Cons |
|--------|------|------|
| `caddy` | Auto-directory listing, markdown rendering plugin, zero config TLS | Extra install (`brew install caddy`) |
| `python3 -m http.server` | Already installed, zero deps | No markdown rendering, no directory listing styling, fragile |
| `darkhttpd` | Tiny, fast, single binary | No markdown rendering, needs brew install |
| `nginx` | Battle-tested | Overkill for serving a folder |

**Leaning:** caddy — it can render markdown to HTML natively with the `markdown` directive, so briefs look good on mobile without any build step.

### 2. What to serve

| Approach | Description |
|----------|-------------|
| **A: Serve your-project/briefs/ only** | Simplest. One project, one folder. |
| **B: Serve a root with per-project mounts** | `/<project>/briefs/` — e.g., `/your-project/briefs/`, `/your-project-2/reports/`. Extensible. |

**Leaning:** B — minimal extra effort, future-proof.

### 3. Port

Pick a fixed port that doesn't conflict. Suggest `8800` (memorable, unlikely to conflict).

### 4. Tailscale hostname

Check with `tailscale status` — the Mac's Tailscale hostname becomes the base URL. E.g., `http://your-mac:8800/your-project/briefs/`.

### 5. Markdown rendering

- Caddy has a `templates` + `markdown` middleware that can render .md → HTML on the fly
- Alternative: add a post-pipeline step that converts .md → .html with `pandoc` or `marked`
- Or: just serve raw .md and rely on mobile browser rendering (ugly but functional)

**Leaning:** Caddy markdown middleware — zero build step, just works.

---

## Implementation Plan

### Phase 1: Basic static server (30 min)

1. `brew install caddy`
2. Write `~/hq/tools/caddy/Caddyfile`:
   ```
   :8800 {
     root * $HOME
     file_server browse

     handle /your-project/* {
       root * $HOME/projects/your-project
       uri strip_prefix /your-project
       file_server browse
     }
   }
   ```
3. Create launchd plist `com.hq.brief-server` to run caddy
4. Verify from phone: `http://<tailscale-host>:8800/your-project/briefs/`

### Phase 2: Fix Telegram links (10 min)

1. Get Tailscale hostname: `tailscale status --self`
2. Update your-project notification `SUMMARY_BUILDER` sections in all `.env` files — replace `https://YOUR_GITHUB_USER.github.io/your-project/` with `http://<tailscale-host>:8800/your-project/`
3. Test with a manual pipeline run

### Phase 3: Markdown rendering (optional, 15 min)

1. Add Caddy `templates` and `markdown` directives for .md files
2. Or: add a simple CSS wrapper so raw .md at least has readable typography

---

## Security Considerations

- Server binds to all interfaces but only Tailscale network can reach it (Mac firewall + Tailscale ACLs)
- No authentication beyond Tailscale mesh membership
- No TLS needed (Tailscale already encrypts traffic between nodes via WireGuard)
- If Mac is off/sleeping, server is unreachable — acceptable since briefs are also in git

---

## Open Questions

1. **Should caddy serve on Tailscale interface only?** Can bind to `100.x.x.x:8800` instead of `0.0.0.0:8800` for defense in depth.
2. **Do we need auth?** Tailscale mesh membership is probably sufficient for a single-user setup.
3. **Markdown CSS** — should we invest in a nice stylesheet for rendered briefs, or is raw text fine on phone?
4. **Other projects** — does your-project-2 or any other project have files worth serving this way?
