---
description: Stage all changes, commit with conventional message, and push
allowed-tools: Bash(git *)
---

Stage, commit, and push in one step.

1. Run `git status` to see what's changed.
2. Stage all changes with `git add -A` (but warn if `.env` or credential files are present — don't stage those).
3. Analyze the diff and generate a Conventional Commit message.
4. Commit.
5. Push to the current branch. If no upstream, push with `-u origin {branch}`.

Never force push. If push is rejected, report the issue instead of forcing.
