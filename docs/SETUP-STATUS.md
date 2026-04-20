# Setup Status — YOUR_USER account (YOUR_HARDWARE)

*Living document. Updated after every install/config session.*
*Last updated: 2026-03-28 (OpenCode setup: commands, MCPs, skills)*

---

## Machine

| Item | Value |
|------|-------|
| Hardware | YOUR_HARDWARE |
| OS | macOS Sequoia |
| Account | `YOUR_USER` (standard user, not admin — use `su admin` for elevated) |
| Remote access | Chrome Remote Desktop, Tailscale (running under admin account) |

---

## Core Tools

| Tool | Status | Version | Notes |
|------|--------|---------|-------|
| Node.js | Installed | v22.22.2 | via nvm v0.40.4 |
| Claude Code | Installed | v2.1.81 | via Claude Desktop symlink to `~/.local/bin/claude` |
| Claude Desktop | Installed | — | Source of Claude Code binary |
| Git | Installed | — | user.name=YOUR_NAME, user.email=YOUR_EMAIL |
| gh (GitHub CLI) | Installed | — | Authenticated as YOUR_GITHUB_USER |
| Docker | Installed | v29.3.0 | via `su admin -c "brew install --cask docker"` |
| Ollama | Installed | v0.18.2 | Local inference |

---

## Global Claude Code Config (~/.claude/)

| Component | Status | Details |
|-----------|--------|---------|
| CLAUDE.md | Configured | Identity, coding standards, behavior rules, preferred stack |
| CLAUDE.local.md | Configured | Machine-specific: paths, local services, hardware |
| settings.json | Configured | Permissions, model, hooks |
| `clp` alias | Configured | In ~/.zshrc — launches Claude Code with plan mode |

---

## MCP Servers

### Claude Code (~/.claude.json)

| MCP | Status | Notes |
|-----|--------|-------|
| Memory | Installed | Knowledge graph persistence |
| Sequential Thinking | Installed | Step-by-step reasoning |
| Context7 | Installed | Library documentation lookup |
| Playwright | Installed | Browser automation + testing |
| Chrome DevTools | Installed | Browser debugging |
| Filesystem | Installed | File access for Claude Code |
| GitHub | Installed | In ~/.claude.json |
| PAL | Installed | Personal assistant |
| Jina Reader | Installed | Web page reading |
| Markitdown | Installed | Doc to markdown conversion |
| Brave Search | Not installed | Backlog — Claude Code has built-in WebSearch |
| Magic MCP | Not installed | Backlog — evaluate when needed |

### OpenCode (~/.config/opencode/opencode.json)

| MCP | Status | Notes |
|-----|--------|-------|
| Perplexity | Active | Key in AWS secrets (PERPLEXITY_API_KEY) |
| ArXiv | Active | No key. Storage: ~/.config/opencode/mcp-storage/arxiv |
| OSP Marketing Tools | Active | No key. Installed via uvx from GitHub |
| PAL | Active | Keys from AWS secrets (ALIBABA_CODING_PLAN_KEY, GEMINI). challenge + consensus tools ideal for blog fact-checking |

---

## Plugins

| Plugin | Status | Priority |
|--------|--------|----------|
| Ralph Wiggum | Installed | High — autonomous iteration loops. stop-hook permission fixed |
| claude-reflect | Installed | Self-improving — captures corrections, writes to CLAUDE.md. Use `/reflect` to review queued learnings |
| GSD | Installed | High — spec-driven development. 19 agents, 50+ commands |
| Superpowers | Skipped | Redundant — GSD + plan skill + debugger agent + claude-reflect cover the same ground |
| Frontend Design | Installed | Medium — UI/UX generation |
| Playground | Installed | Medium — rapid prototyping |
| Code Review | Not installed | Low — review automation |
| Context7 | Not installed | Low — may overlap with MCP |

---

## Global Skills

### Claude Code (~/.claude/skills/)

| Skill | Status | Notes |
|-------|--------|-------|
| plan | Installed | Understand → Plan → Execute → Verify |
| explain-code | Installed | Analogies + ASCII diagrams |
| architecture | Installed | ARCHITECTURE.md maintenance |
| handoff | Installed | Structured handoff documents |
| review-security | Installed | Security review checklist |
| scaffold-project | Installed | New project from template |
| ui-ux-pro-max | Installed | Design system generation |
| self-improving-agent | Skipped | Use claude-reflect plugin instead |

### OpenCode (~/.config/opencode/skills/)

| Skill | Status | Notes |
|-------|--------|-------|
| explain-code | Installed | Mirrors Claude Code global |
| handoff | Installed | Mirrors Claude Code global |
| pdf-screenshot | Installed | Render PDF pages as PNG for analysis |
| plan | Installed | Mirrors Claude Code global |
| review-security | Installed | Mirrors Claude Code global |
| scaffold-project | Installed | Mirrors Claude Code global |
| ui-ux-pro-max | Installed | Mirrors Claude Code global |

## OpenCode Commands (~/.config/opencode/commands/)

### Global Commands

| Command | Status | Notes |
|---------|--------|-------|
| /handoff | Installed | Invokes handoff skill |
| /architecture | Installed | Regenerate/update/check ARCHITECTURE.md |
| /branch | Installed | Create feature branch from main |
| /commit | Installed | Conventional commit with auto message |
| /fix-pipeline | Installed | Fetch CI logs and fix |
| /pr | Installed | Create PR with auto title/description |
| /push | Installed | Stage + commit + push |
| /today | Installed | Daily context setup |

### GSD Commands (~/.config/opencode/commands/gsd/)

| Status | Count | Notes |
|--------|-------|-------|
| Installed | 57 | Full GSD suite copied from ~/.claude/commands/gsd/ |

---

## Hooks

| Hook | Status | Trigger |
|------|--------|---------|
| Date injection | Active | SessionStart — injects current date |
| Format-on-save | Active | PostToolUse — Prettier/Black on file write |
| Semgrep scan | Not installed | Planned — PostToolUse security scan |
| Context rot warning | Not installed | Planned — warn at 70% context |

---

## Repos

| Repo | Status | Location |
|------|--------|----------|
| hq | Active | ~/hq/ → github.com/YOUR_USER/hq |

---

## Vibe HQ Library

Populated 2026-03-25 via Phase 3 execution (003_populate_library.md).

| Component | Count | Location |
|-----------|-------|----------|
| Global agents (copied from ~/.claude/) | 5 core + 19 GSD | global-config/claude-code/agents/ |
| Global commands (copied from ~/.claude/) | 8 core + GSD suite | global-config/claude-code/commands/ |
| Global skills (copied from ~/.claude/) | 5 | global-config/claude-code/skills/ |
| Library agents | 13 across 6 domains | library/agents/ |
| Library skills | 7 | library/skills/ |
| Library hooks | 11 | library/hooks/claude-code/ |
| Library MCP recipes | 5 | library/mcps/recipes/ |
| Library commands | 7 | library/commands/claude-code/ |
| Template manifests | 3 | templates/*/manifest.json |
| Scripts | 3 | scripts/ |
| HQ commands | 5 | .claude/commands/ |
| HQ skills | 5 | .claude/skills/ |

---

## Pending Actions

1. **content-pipeline skill** — build for blogs project (blog workflow: research → draft → OSP edit → Ghost meta)
2. **Google Search Console MCP** — add to blogs project once it has traffic data

### Backlog (no rush)
- **Brave Search MCP** — not needed (Claude Code has built-in WebSearch, OpenCode has Perplexity)
- **Code Review plugin** — evaluate when doing more PR workflows
- **Context7 plugin** — may overlap with Context7 MCP
- **Magic MCP** — evaluate for frontend-heavy projects
