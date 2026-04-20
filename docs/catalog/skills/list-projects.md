# List Projects

- **Type:** Command (slash command)
- **Command:** `/list-projects`
- **Source:** Custom (hq project)
- **Scope:** hq project
- **Status:** Active

## What It Does
Displays the project registry as a table with status information. Shows all active and archived projects with their metadata, configured agents/skills/MCPs, and flags stale configs.

## Usage
```
/list-projects
```
No arguments needed.

## Triggers
- "What projects do I have?"
- Reviewing project portfolio
- Explicit `/list-projects` invocation

## Tips & Gotchas
- Active projects shown first, then archived.
- Extracts name, status, template, created date, and last activity from each registry entry.
- Flags projects with configs not updated in 30+ days.
- Shows which agents, skills, and MCPs are configured per project.

## Installed In
| Location | Path |
|----------|------|
| hq project command | `~/hq/.claude/commands/list-projects.md` |
