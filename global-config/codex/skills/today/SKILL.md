---
name: today
description: Start-of-day context setup. Shows today's date, last 24h git activity, uncommitted changes, and TODO/FIXME items. Use at the start of any session to reorient quickly.
---

Start of day context setup.

1. Show today's date and day of week.
2. Show git activity from the last 24 hours: `git log --oneline --since="24 hours ago"`.
3. Show any uncommitted changes: `git status --short`.
4. Check for TODO/FIXME comments in recently changed files: `git diff --name-only HEAD~5 | xargs grep -n "TODO\|FIXME" 2>/dev/null`.
5. Read the project's AGENTS.md or CLAUDE.md "Current Focus" section if it exists.
6. Read any zz_handoffs/*.md files modified in the last 48 hours.
7. Summarize: "Here's where we left off and what's on deck today."
