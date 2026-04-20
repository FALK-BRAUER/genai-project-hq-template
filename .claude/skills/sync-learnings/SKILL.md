---
name: sync-learnings
description: Pull learnings from active projects into vibe-hq, detect config drift, and propose library additions. Use with /sync command.
---

## Workflow

### 1. Enumerate Active Projects
Read `registry/active/*.md` to get project list and paths.

### 2. Pull Learnings
For each active project:
- Check if `~/projects/<name>/LEARNINGS.md` exists
- If exists and newer than `learnings/per-project/<name>.md`, copy it
- Extract key patterns and add to consolidated learnings

### 3. Detect Config Drift
For each active project:
- Read project's `.claude/agents/` and compare against template manifest
- Read project's `.claude/settings.json` hooks and compare against library hooks
- Report: agents added, agents removed, hooks changed, skills added

### 4. Discover New Components
For each active project:
- Check for agents in `.claude/agents/` not present in `library/agents/`
- Check for skills in `.claude/skills/` not present in `library/skills/`
- Check for hooks in `.claude/settings.json` not present in `library/hooks/`
- For each new component found:
  - Create an evaluation file in `library/skills/_candidates/` using EVALUATION-TEMPLATE.md
  - Pre-fill origin, discovered date, and discovery method
- Update `library/skills/CATALOG.md` candidates table

### 5. Check Pending Candidates
- Read `library/skills/_candidates/` for existing evaluation files
- Report candidates by status:
  - **Pending evaluation** — no scores filled in yet
  - **Evaluated, awaiting promotion** — scored but not yet promoted
  - **Evaluated, skipped** — scored below threshold
- If any candidates have been pending >14 days, flag them for attention
- Suggest running `/manage-skills evaluate {name}` for pending candidates

### 6. Check Skill Freshness
- Read `library/skills/CATALOG.md` external registries section
- If any registry hasn't been scanned in >30 days, suggest `/manage-skills discover community`
- Check if deployed skills in projects are outdated vs library versions

### 7. Report
Summarize:
- Learnings synced: N projects updated
- Config drift: list of drifted projects and what changed
- New components: list of candidates for library addition
- Skill candidates: N pending evaluation, M awaiting promotion
- Stale items: registries needing rescan, outdated deployments
