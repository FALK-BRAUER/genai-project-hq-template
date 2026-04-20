# Audit Configs

- **Type:** Skill
- **Command:** `/audit-configs`
- **Source:** Custom (hq project)
- **Scope:** hq project
- **Status:** Active

## What It Does
Compares project configs against hq templates and library, reporting drift and staleness. Audits each active project for agent drift, hook drift, skill drift, MCP drift, and staleness (no activity in 30+ days).

## Usage
```
/audit-configs
```
No arguments needed. Audits all active projects in the registry.

## Triggers
- Running `/sync` (can be used standalone or as part of sync)
- Suspecting config drift across projects
- Explicit `/audit-configs` invocation

## Tips & Gotchas
- Loads baseline from `templates/*/manifest.json` and `library/` components.
- Reports per project: in sync, drifted (with details), missing critical components, or stale.
- Checks agents, hooks, skills, and MCPs against expected manifests.
- Flags projects with no git activity in 30+ days as stale.

## Installed In
| Location | Path |
|----------|------|
| hq project skill | `~/hq/.claude/skills/audit-configs/SKILL.md` |
