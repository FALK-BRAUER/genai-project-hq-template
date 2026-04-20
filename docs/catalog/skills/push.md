# Push

- **Type:** Command (slash command)
- **Command:** `/push`
- **Source:** Custom (global)
- **Scope:** Global
- **Status:** Active

## What It Does
Stages all changes, generates a Conventional Commit message from the diff, commits, and pushes to the current branch in one step. Warns about `.env` or credential files and excludes them from staging.

## Usage
```
/push
```
No arguments needed. Stages, commits, and pushes in one operation.

## Triggers
- Quick save-and-push workflow
- Explicit `/push` invocation

## Tips & Gotchas
- Never force pushes. If push is rejected, reports the issue instead of forcing.
- If no upstream is set, pushes with `-u origin {branch}`.
- Warns if `.env` or credential files are detected -- does not stage them.
- Uses `git add -A` for staging (with the security exclusions above).

## Installed In
| Location | Path |
|----------|------|
| Global commands | `~/.claude/commands/push.md` |
