---
description: Create a git commit with a conventional message
allowed-tools: Bash(git add:*), Bash(git commit:*), Bash(git diff:*), Bash(git status:*)
argument-hint: [message]
model: haiku
---

Create a conventional commit from the current staged or unstaged changes.

1. Run `git diff --cached` to see staged changes. If nothing staged, run `git diff` for unstaged changes.
2. If $ARGUMENTS is provided, use it as the commit message (ensure it follows Conventional Commits format).
3. If no argument, analyze the diff and generate a Conventional Commits message: `feat:`, `fix:`, `chore:`, `docs:`, `refactor:`, `test:`, `style:`, `perf:`.
4. Look at `git log --oneline -5` to match the project's commit style.
5. Stage relevant files (not `.env` or secrets) and commit.

The message should explain WHY, not just WHAT. Keep it under 72 characters for the subject line.
