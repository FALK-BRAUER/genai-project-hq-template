---
description: Create a PR with auto-generated title and description
allowed-tools: Bash(git *), Bash(gh *)
---

Create a pull request for the current branch.

1. Push current branch if not already pushed: `git push -u origin HEAD`.
2. Analyze the commits on this branch vs main: `git log main..HEAD --oneline`.
3. Generate a PR title in conventional commit style (under 70 chars).
4. Generate a PR description with:
   - **Summary** — What changed and why (2-3 bullets)
   - **Test plan** — How to verify the changes
5. Create the PR: `gh pr create --title "..." --body "..."`.
6. Report the PR URL.

Target branch is `main` unless the user specifies otherwise.
