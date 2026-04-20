# Explore

- **Type:** Agent
- **Subagent Type:** `explore`
- **Scope:** Global (built-in)
- **Status:** Active

## What It Does
Fast codebase exploration agent. Finds files by patterns, searches code for keywords, and maps out project structure. Read-only by design -- it cannot edit or write files.

Accepts a thoroughness parameter:
- `"quick"` -- surface-level scan, first matches only
- `"medium"` -- balanced depth, follows a few levels of references
- `"very thorough"` -- exhaustive search, checks all matches and related files

## Tools Available
Read, Glob, Grep, Bash (read-only commands).

Explicitly excluded: Agent, ExitPlanMode, Edit, Write, NotebookEdit.

## When to Use
- "Where is X defined?"
- "Which files import this module?"
- Mapping unfamiliar codebases before making changes
- Quick fact-finding that feeds into a follow-up task

## When NOT to Use
- When you need to make edits (use general-purpose or refactor)
- When a full implementation plan is needed (use plan)
- When you already know the exact file path (just use Read directly)
