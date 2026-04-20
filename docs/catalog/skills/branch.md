# Branch

- **Type:** Command (slash command)
- **Command:** `/branch`
- **Source:** Custom (global)
- **Scope:** Global
- **Status:** Active

## What It Does
Creates a new feature branch from the latest main. Automatically stashes uncommitted changes, pulls latest main, creates a properly prefixed branch, and restores the stash.

## Usage
```
/branch <feature description>
```
The description is converted to kebab-case and prefixed based on intent:
- Default: `feat/{description}`
- Starts with "fix": `fix/{description}`
- Starts with "chore": `chore/{description}`

## Triggers
- Starting work on a new feature or fix
- Explicit `/branch` invocation

## Tips & Gotchas
- Automatically stashes uncommitted changes before switching to main.
- Pulls latest main before branching to avoid stale base.
- Restores stash after creating the branch.

## Installed In
| Location | Path |
|----------|------|
| Global commands | `~/.claude/commands/branch.md` |
