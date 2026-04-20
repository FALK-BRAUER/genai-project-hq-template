# Today

- **Type:** Command (slash command)
- **Command:** `/today`
- **Source:** Custom (global)
- **Scope:** Global
- **Status:** Active

## What It Does
Sets up daily context at the start of a work session. Shows date, recent git activity, uncommitted changes, TODO/FIXME items in recently changed files, current focus from CLAUDE.md, and any handoff documents.

## Usage
```
/today
```
No arguments needed. Run at the start of each session.

## Triggers
- Beginning of a work session
- "Where did we leave off?"
- Explicit `/today` invocation

## Tips & Gotchas
- Shows git activity from the last 24 hours.
- Scans TODO/FIXME comments in the last 5 changed files.
- Reads the "Current Focus" section from CLAUDE.md if it exists.
- Reads any `HANDOFF-*.md` files in the project root for session continuity.

## Installed In
| Location | Path |
|----------|------|
| Global commands | `~/.claude/commands/today.md` |
