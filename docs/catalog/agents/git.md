# Git

- **Type:** Agent
- **Subagent Type:** `git`
- **Scope:** Global (built-in)
- **Status:** Active

## What It Does
Git workflow agent. Handles branching, conventional commits, rebasing, pull requests, and other git/GitHub operations. Understands conventional commit format and repository hygiene.

## Tools Available
Bash (`git`), Bash (`gh`), Read.

## When to Use
- Creating branches and commits following conventions
- Interactive rebasing or history cleanup
- Opening, updating, or merging pull requests via `gh`
- Resolving merge conflicts
- Reviewing git log or diff output

## When NOT to Use
- When you need to edit code (use debugger, refactor, or general-purpose)
- Simple `git status` checks that don't need an agent
- When the task is primarily about code, not version control
