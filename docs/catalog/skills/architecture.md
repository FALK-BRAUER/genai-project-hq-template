# Architecture

- **Type:** Command (slash command)
- **Command:** `/architecture`
- **Source:** Custom (global)
- **Scope:** Global
- **Status:** Active

## What It Does
Regenerates or updates ARCHITECTURE.md from the current codebase. Scans directory structure, package.json, database schemas, route definitions, and component files to produce comprehensive architecture documentation with Mermaid diagrams.

## Usage
```
/architecture [full|update|check]
```

- **full** (or no argument) -- Regenerate ARCHITECTURE.md completely by scanning the codebase. Uses the architect agent. Generates all Mermaid diagrams from scratch.
- **update** -- Read existing ARCHITECTURE.md, compare with current code, update only stale sections.
- **check** -- Compare ARCHITECTURE.md against current code and report what is out of sync without making changes.

## Triggers
- After significant code changes
- When onboarding onto a project
- Explicit `/architecture` invocation

## Tips & Gotchas
- Delegates to the architect agent for full regeneration.
- Uses `find` and `grep` to scan the codebase for structure.
- The `check` mode is non-destructive -- useful for CI or audits.

## Installed In
| Location | Path |
|----------|------|
| Global commands | `~/.claude/commands/architecture.md` |
