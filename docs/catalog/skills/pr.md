# PR

- **Type:** Command (slash command)
- **Command:** `/pr`
- **Source:** Custom (global)
- **Scope:** Global
- **Status:** Active

## What It Does
Creates a pull request for the current branch with an auto-generated title and description. Pushes the branch if needed, analyzes commits vs main, generates a conventional commit-style title, and creates the PR via `gh`.

## Usage
```
/pr
```
No arguments needed. Targets `main` unless specified otherwise.

## Triggers
- Branch is ready for review
- Explicit `/pr` invocation

## Tips & Gotchas
- Automatically pushes the branch if not already pushed.
- PR title follows conventional commit style, kept under 70 characters.
- PR description includes Summary (2-3 bullets) and Test Plan sections.
- Uses `git log main..HEAD --oneline` to understand what changed.

## Installed In
| Location | Path |
|----------|------|
| Global commands | `~/.claude/commands/pr.md` |
