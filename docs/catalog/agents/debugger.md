# Debugger

- **Type:** Agent
- **Subagent Type:** `debugger`
- **Scope:** Global (built-in)
- **Status:** Active

## What It Does
Systematic root-cause analysis agent. Reads error messages, traces execution paths, forms hypotheses, and fixes the root cause. Follows a structured workflow: reproduce, isolate, diagnose, fix, verify.

## Tools Available
Read, Glob, Grep, Edit, Bash, Write.

## When to Use
- Stack traces or error messages that need investigation
- Tests failing for unclear reasons
- Runtime bugs that require tracing through multiple files
- Performance regressions that need profiling and analysis

## When NOT to Use
- When the fix is already known (just edit directly)
- Code style or architecture issues (use refactor or reviewer)
- When the problem is in configuration, not code
