# Review Security

- **Type:** Skill
- **Command:** `/review-security`
- **Source:** Custom (global)
- **Scope:** Global + hq project
- **Status:** Active

## What It Does
Runs a security-focused code review against the OWASP Top 10. Checks input validation, auth boundaries, secret exposure, injection, XSS, CSRF, dependency vulnerabilities, error leakage, rate limiting, and logging hygiene. Reports findings as Pass, Warning, or Critical.

## Usage
```
/review-security [scope — file, directory, or PR]
```
Can target a specific file, directory, or the current PR diff. Runs automated checks including `npm audit` and `npx trufflehog`.

## Triggers
- Reviewing PRs
- Before deployment
- Working with authentication, payments, or user data
- Explicit `/review-security` invocation

## Tips & Gotchas
- This is security only -- style issues are not reported.
- If a critical issue is found, it stops and reports immediately.
- Runs `npm audit` and `npx trufflehog filesystem . --no-update --fail` as automated checks.
- Output format: summary counts (pass/warning/critical) followed by detailed findings with file:line references.
- Also available as a hq project-level skill (identical behavior).

## Installed In
| Location | Path |
|----------|------|
| Global skills | `~/.claude/skills/review-security/SKILL.md` |
| hq project skills | `~/hq/.claude/skills/` (inherits global) |
