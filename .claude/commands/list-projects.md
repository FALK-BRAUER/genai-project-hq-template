---
description: Show project registry with status
allowed-tools: Read, Glob, Bash(ls:*)
---

List all projects in the vibe-hq registry.

1. Read all files in `registry/active/` and `registry/archived/`
2. For each project, extract: name, status, template, created date, last activity
3. Display as a table:
   - Active projects first, then archived
   - Show which agents/skills/MCPs are configured
   - Flag any projects with stale configs (not updated in 30+ days)
