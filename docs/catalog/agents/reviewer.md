# Reviewer

- **Type:** Agent
- **Subagent Type:** `reviewer`
- **Scope:** Global (built-in)
- **Status:** Active

## What It Does
Code review agent. Examines code for correctness, security vulnerabilities, and performance issues. Reports findings by severity level:

- **Critical** -- security holes, data loss risks, broken logic
- **Bug** -- incorrect behavior, edge cases, race conditions
- **Suggestion** -- style, readability, minor performance improvements

## Tools Available
Read, Glob, Grep, Bash (`git diff`), Bash (`npm audit`).

## When to Use
- Reviewing a PR or set of changes before merge
- Security audit of new code
- Checking for regressions after a refactor
- Pre-commit sanity check on staged changes

## When NOT to Use
- When you need to fix the issues (use debugger or refactor)
- Reviewing non-code files (docs, configs) where correctness criteria don't apply
- When the diff is trivial (single-line typo fix)
