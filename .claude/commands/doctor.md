---
description: Full setup health check
allowed-tools: Read, Bash(which:*), Bash(node:*), Bash(git:*), Bash(gh:*), Bash(claude:*), Bash(npx:*), Bash(ls:*), Glob
---

Run a full health check on the vibe coding setup.

1. **Tools installed:** Check for node, npm, git, gh, claude, npx, docker
2. **Global configs:** Verify ~/.claude/CLAUDE.md, settings.json, agents/, commands/, skills/ exist
3. **MCP servers:** Check ~/.claude.json has expected servers (memory, context7, github, etc.)
4. **MCP health:** Run `claude mcp` or check server connectivity
5. **Repo state:** Verify ~/vibe-hq/ is clean, on main, up to date with remote
6. **Registry:** Check registry/active/ for entries, verify project directories exist
7. **Library:** Check library/ has agents, skills, hooks, mcps, commands
8. **Templates:** Verify templates/*/manifest.json exists for all templates
9. **Scripts:** Check scripts/ has install-global.sh, sync-learnings.sh, audit-all.sh

Report as checklist: ✅ pass, ⚠️ warning, ❌ fail

Use the setup-doctor skill for detailed checks.
