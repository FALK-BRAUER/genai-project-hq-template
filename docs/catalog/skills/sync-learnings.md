# Sync Learnings

- **Type:** Skill + Command
- **Command:** `/sync`
- **Source:** Custom (hq project)
- **Scope:** hq project
- **Status:** Active

## What It Does
Pulls learnings from active projects into hq, detects config drift, discovers new components (agents, skills, hooks), checks pending skill candidates, and monitors skill freshness. Comprehensive sync across the entire project portfolio.

## Usage
```
/sync
```
No arguments needed. Syncs all active projects.

### Workflow
1. **Enumerate** -- Read `registry/active/*.md` for project list.
2. **Pull Learnings** -- Copy LEARNINGS.md from each project if newer than last sync.
3. **Detect Config Drift** -- Compare project agents, hooks, skills against template manifests.
4. **Discover New Components** -- Find agents/skills/hooks in projects not present in library. Create evaluation candidates.
5. **Check Pending Candidates** -- Report candidates by status (pending, awaiting promotion, skipped). Flag items pending >14 days.
6. **Check Skill Freshness** -- Flag external registries not scanned in 30+ days. Check if deployed skills are outdated vs library.
7. **Report** -- Summary of learnings synced, drift detected, new components found, candidate status, stale items.

## Triggers
- Periodic sync (weekly recommended)
- After finishing work in a project
- Explicit `/sync` invocation

## Tips & Gotchas
- Consolidated learnings are extracted from per-project LEARNINGS.md files.
- Suggests running `/manage-skills evaluate {name}` for pending candidates.
- Suggests `/manage-skills discover community` if external registries are stale.
- Checks if deployed skills in projects are outdated vs library versions.

## Installed In
| Location | Path |
|----------|------|
| hq project skill | `~/hq/.claude/skills/sync-learnings/SKILL.md` |
| hq project command | `~/hq/.claude/commands/sync.md` |
