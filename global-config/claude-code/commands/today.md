---
description: Set up daily context — date, git activity, TODOs
allowed-tools: Bash(date), Bash(git log:*), Bash(git diff:*), Read, Bash(grep:*)
---

Start of day context setup.

1. Show today's date and day of week.
2. Show git activity from the last 24 hours: `git log --oneline --since="24 hours ago"`.
3. Show any uncommitted changes: `git status --short`.
4. Check for TODO/FIXME comments in recently changed files: `git diff --name-only HEAD~5 | xargs grep -n "TODO\|FIXME" 2>/dev/null`.
5. Read the project's CLAUDE.md "Current Focus" section if it exists.
6. Read any HANDOFF-*.md files in the project root.
7. Summarize: "Here's where we left off and what's on deck today."
