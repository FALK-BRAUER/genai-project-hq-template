---
description: Generate client-facing status report
allowed-tools: Read, Write, Bash(git log:*)
argument-hint: <project-name>
---

Generate a professional client status report for $ARGUMENTS.

1. Read recent git activity: `git log --oneline --since="1 week ago"`
2. Read CLAUDE.md for project context
3. Read any HANDOFF-*.md for session summaries

Write a report with:
## Project Status Report — [Date]

### Summary
[One paragraph: what was accomplished this period]

### Completed
[Bulleted list of deliverables]

### In Progress
[What's being worked on now]

### Upcoming
[Next steps and timeline]

### Blockers / Risks
[Anything that needs client attention]

### Metrics
[Lines of code, test coverage, open issues — whatever's relevant]

Keep it professional, concise, and focused on outcomes (not technical details).
