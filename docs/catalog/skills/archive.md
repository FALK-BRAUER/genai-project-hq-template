# Archive

- **Type:** Command (slash command)
- **Command:** `/archive`
- **Source:** Custom (hq project)
- **Scope:** hq project
- **Status:** Active

## What It Does
Moves a project from active to archived status. Relocates the registry entry, updates it with archive date and reason, and pulls any final learnings before archiving.

## Usage
```
/archive <project-name>
```

## Triggers
- Project is complete or no longer active
- Explicit `/archive` invocation

## Tips & Gotchas
- Verifies the project exists in `registry/active/` before proceeding.
- Moves the file from `registry/active/` to `registry/archived/`.
- Pulls final learnings from the project before archiving.
- Updates the registry entry with the archive date.

## Installed In
| Location | Path |
|----------|------|
| hq project command | `~/hq/.claude/commands/archive.md` |
