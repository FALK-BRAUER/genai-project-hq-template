# Commit

- **Type:** Command (slash command)
- **Command:** `/commit`
- **Source:** Custom (global)
- **Scope:** Global
- **Status:** Active

## What It Does
Creates a git commit with a Conventional Commits message. If no message is provided, analyzes the diff and generates one. Checks recent commit history to match the project's style. Uses the Haiku model for speed.

## Usage
```
/commit [message]
```
- With argument: uses the provided message (ensures Conventional Commits format).
- Without argument: auto-generates a message from the diff.

## Triggers
- Ready to commit staged or unstaged changes
- Explicit `/commit` invocation

## Tips & Gotchas
- Looks at `git log --oneline -5` to match existing commit style.
- Message should explain WHY, not just WHAT.
- Subject line kept under 72 characters.
- Will not stage `.env` or secret files.
- Uses the `haiku` model for fast execution.

## Installed In
| Location | Path |
|----------|------|
| Global commands | `~/.claude/commands/commit.md` |
