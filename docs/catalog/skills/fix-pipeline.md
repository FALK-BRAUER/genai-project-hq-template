# Fix Pipeline

- **Type:** Command (slash command)
- **Command:** `/fix-pipeline`
- **Source:** Custom (global)
- **Scope:** Global
- **Status:** Active

## What It Does
Fetches the latest CI failure logs from GitHub Actions and diagnoses/fixes the root cause. Handles test failures, lint errors, build errors, and timeouts. Runs the relevant check locally to verify the fix before reporting.

## Usage
```
/fix-pipeline
```
No arguments needed -- automatically finds the latest failed CI run.

## Triggers
- CI pipeline has failed
- Explicit `/fix-pipeline` invocation

## Tips & Gotchas
- Uses `gh run list --limit 1` to find the latest run, then `gh run view {id} --log-failed` for details.
- Fixes the root cause -- does not suppress errors.
- Common causes it handles: test failures, lint errors, build/type errors, timeouts from infinite loops or missing async/await.
- Runs the fix locally before reporting.

## Installed In
| Location | Path |
|----------|------|
| Global commands | `~/.claude/commands/fix-pipeline.md` |
