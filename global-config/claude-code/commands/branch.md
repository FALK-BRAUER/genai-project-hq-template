---
description: Create a new feature branch from latest main
allowed-tools: Bash(git *)
argument-hint: feature description
---

Create a feature branch from the latest main.

1. Run `git stash` if there are uncommitted changes (inform the user).
2. Checkout main and pull latest: `git checkout main && git pull`.
3. Create a branch named `feat/{description}` from $ARGUMENTS, converted to kebab-case.
   - If description starts with "fix", use `fix/` prefix instead.
   - If description starts with "chore", use `chore/` prefix instead.
4. Switch to the new branch.
5. Pop stash if we stashed earlier.

Report the new branch name when done.
