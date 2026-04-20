---
name: audit-configs
description: Compare project configs against templates and library, report drift and staleness. Use with /sync or standalone audit.
---

## Workflow

### 1. Load Baseline
- Read template manifests from `templates/*/manifest.json`
- Read library components from `library/`

### 2. Audit Each Active Project
For each project in `registry/active/`:

#### Agent Drift
- List agents in project `.claude/agents/`
- Compare against template manifest expected agents
- Flag: missing (should have but doesn't), extra (has but not in manifest), modified (content differs from library)

#### Hook Drift
- Read project `.claude/settings.json`
- Compare hooks against library hook definitions
- Flag: missing hooks, modified hooks, extra hooks

#### Skill Drift
- List skills in project `.claude/skills/`
- Compare against template manifest expected skills
- Flag: missing, extra, modified

#### MCP Drift
- Check project-scoped MCPs against manifest expectations

#### Staleness
- Check last git commit date for the project
- Flag if no activity in 30+ days

### 3. Report
For each project, report as:
- ✅ In sync
- ⚠️ Drifted (with details)
- ❌ Missing critical components
- 🕐 Stale (no recent activity)
