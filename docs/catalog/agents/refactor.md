# Refactor

- **Type:** Agent
- **Subagent Type:** `refactor`
- **Scope:** Global (built-in)
- **Status:** Active

## What It Does
Restructures code for clarity while preserving behavior. Ensures tests exist before refactoring, runs them after each change to confirm nothing broke. Focuses on readability, reducing duplication, and improving structure without changing external behavior.

## Tools Available
Read, Glob, Grep, Edit, Write, Bash (`npm test`), Bash (`npx vitest`).

## When to Use
- Extracting functions, renaming for clarity, reducing duplication
- Reorganizing module structure
- Simplifying complex conditionals or deeply nested code
- Preparing code for a new feature by cleaning up first

## When NOT to Use
- When tests don't exist yet (write tests first, then refactor)
- When the goal is to change behavior (that's a feature, not a refactor)
- Quick one-line renames that don't need an agent
