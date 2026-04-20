# Task: Weekly Toolkit Scout

You are scouting for new tools, skills, MCPs, and Claude Code features that could benefit the vibe-hq ecosystem.

## Instructions

1. **Read current state** — scan these to know what we already have:
   - `library/mcps/catalog.md` — current MCP inventory
   - `library/skills/` — current skills
   - `library/agents/` — current agents
   - `library/references/registry.yaml` — tracked repos

2. **Search for new discoveries** in these categories:

   **Claude Code ecosystem:**
   - Search web for "Claude Code" new features, releases, changelog (last 7 days)
   - Search for new Claude Code MCP servers, skills, or hooks people have shared
   - Check github.com/anthropics/claude-code for recent releases

   **MCP servers:**
   - Search for trending MCP servers (GitHub "mcp-server" topic, recent stars)
   - Look for MCPs relevant to our stack: Next.js, Prisma, PostgreSQL, Vercel, trading/finance

   **AI coding tools:**
   - Search for new AI coding tools, CLI agents, or frameworks (last 7 days)
   - Check Hacker News, Product Hunt for relevant launches

3. **Filter for relevance** — only report items that:
   - We don't already have in the library
   - Are relevant to our stack (TypeScript, Next.js, Python, trading, content)
   - Have meaningful traction (>50 stars if repo, or notable author/org)
   - Are actually useful, not just interesting

4. **Write findings** to `tools/logs/scout-{today's date}.md`:

```markdown
# Toolkit Scout — {date}

## Notable Finds

### {Tool Name}
- **What:** one-line description
- **Why it matters:** how it helps our setup
- **URL:** link
- **Action:** add to registry / add to library / evaluate / skip

## Nothing New
(if nothing worth reporting, just write this section)
```

5. **If any finds have Action: "add to registry"**, append them to `library/references/registry.yaml` under the appropriate section.

6. Commit if changes were made:
   ```
   git add tools/logs/scout-*.md library/references/
   git commit -m "chore: weekly toolkit scout"
   git push
   ```

7. Print a one-line summary of what was found (or "nothing notable this week").

## Important
- Quality over quantity — 2 great finds beats 10 mediocre ones
- Don't add tools we can't use with our current setup
- If Claude Code had a major release, always flag it even if we already use it
- Do NOT run `git pull`, `git fetch`, or `git rebase` — this repo is local-only, there is no upstream to sync from
