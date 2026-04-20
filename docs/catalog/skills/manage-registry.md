# Manage Registry

- **Type:** Skill
- **Command:** `/manage-registry`
- **Source:** Custom (hq project)
- **Scope:** hq project
- **Status:** Active

## What It Does
Manages the hq project registry -- add, update, list, and archive project entries. Each project is a markdown file in `registry/active/` or `registry/archived/` with standardized metadata.

## Usage
```
/manage-registry add <project-name>
/manage-registry update <project-name> --status <status>
/manage-registry list
/manage-registry archive <project-name>
```

### Operations
- **add** -- Create `registry/active/<name>.md` from template with metadata.
- **update** -- Update specified fields (status, last activity, notes).
- **list** -- Display all projects as a table sorted by last activity.
- **archive** -- Move from `registry/active/` to `registry/archived/`, set status to archived with date.

## Triggers
- Adding a new project to tracking
- Updating project status
- Reviewing all projects
- Archiving completed projects

## Tips & Gotchas
- Registry entries follow a strict markdown format with Status, Template, Created, Last Activity, Path, Repo fields.
- Active projects live in `registry/active/`, archived in `registry/archived/`.
- List operation shows active projects first, then archived, with agent/skill/MCP info.

## Installed In
| Location | Path |
|----------|------|
| hq project skill | `~/hq/.claude/skills/manage-registry/SKILL.md` |
