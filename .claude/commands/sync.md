---
description: Pull learnings and detect config drift across projects
allowed-tools: Read, Write, Bash(git:*), Glob
---

Sync learnings and detect config drift across all active projects.

1. Read `registry/active/` to get list of active projects
2. For each project:
   a. Check if `~/projects/<name>/LEARNINGS.md` exists — if so, copy to `learnings/per-project/<name>.md`
   b. Compare project's `.claude/agents/` against the template manifest — report added/removed agents
   c. Compare project's `.claude/settings.json` hooks against library hooks — report drift
   d. Check if project has custom agents/skills not in the library — propose adding them
3. Summarize: what was synced, what drifted, what's new

Use the sync-learnings skill for detailed logic.
