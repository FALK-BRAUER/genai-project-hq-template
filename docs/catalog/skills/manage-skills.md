# Manage Skills

- **Type:** Skill
- **Command:** `/manage-skills`
- **Source:** Custom (hq project)
- **Scope:** hq project
- **Status:** Active

## What It Does
Full skill lifecycle management -- discover, evaluate, promote, deploy, and list skills across the hq library. Handles internal discovery from projects, community discovery from external registries, and session pattern discovery.

## Usage
```
/manage-skills discover [internal|community|patterns]
/manage-skills evaluate <candidate-name>
/manage-skills promote <candidate-name>
/manage-skills deploy <skill-name> [project-name|all]
/manage-skills list [category]
```

### Subcommands
- **discover** -- Scan for skill candidates from projects, community repos, or session patterns.
- **evaluate** -- Run evaluation checklist (relevance, quality, overlap, maintenance, license, adaptability, SG-specific). Score 1-5, verdict at 20+ promote, 15-19 adapt, <15 skip.
- **promote** -- Move evaluated candidate into the library. Apply adaptations if needed. Update CATALOG.md.
- **deploy** -- Push a library skill to one or more active projects. For business-ops projects, stores references in registry rather than copying files.
- **list** -- Show skills by category and status with deployment counts.

## Triggers
- Found a useful pattern that should become a skill
- Reviewing available skills
- Deploying skills to new projects
- Explicit `/manage-skills` invocation

## Tips & Gotchas
- Candidates are stored in `library/skills/_candidates/` with evaluation files.
- Promoted skills include a provenance comment noting source and date.
- Business-ops projects (iCloud/Google Drive) get registry references, not file copies.
- External registries flagged if not scanned in 30+ days.

## Installed In
| Location | Path |
|----------|------|
| hq project skill | `~/hq/.claude/skills/manage-skills/SKILL.md` |
