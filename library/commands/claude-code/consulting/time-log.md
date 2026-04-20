---
description: Log time against project
allowed-tools: Read, Write, Bash(date:*)
argument-hint: <hours> <description>
---

Log time entry for the current project.

1. Parse $ARGUMENTS: first word is hours (e.g., "2.5"), rest is description
2. Get today's date
3. Append to TIME-LOG.md in project root:

```
| Date | Hours | Description |
|------|-------|-------------|
| YYYY-MM-DD | X.X | description |
```

4. Show running total for the week and month
