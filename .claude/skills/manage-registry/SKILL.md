---
name: manage-registry
description: Add, update, list, and archive project registry entries in vibe-hq. Use when managing the project registry.
---

## Registry Format

Each project is a markdown file in `registry/active/` or `registry/archived/`:

```markdown
# <Project Name>

- **Status:** active | paused | archived
- **Template:** nextjs-app | fastapi-service | consulting-report
- **Created:** YYYY-MM-DD
- **Last Activity:** YYYY-MM-DD
- **Path:** ~/projects/<name>
- **Repo:** github.com/YOUR_USER/<name>

## Stack
[Template defaults or overrides]

## Agents
[List of installed agents]

## Notes
[Any project-specific notes]
```

## Operations

### Add
1. Create `registry/active/<name>.md` from template above
2. Fill in metadata from scaffold or manual input

### Update
1. Read existing entry
2. Update specified fields (status, last activity, notes)
3. Write back

### List
1. Read all files in `registry/active/` and `registry/archived/`
2. Display as table sorted by last activity

### Archive
1. Move from `registry/active/` to `registry/archived/`
2. Set status to "archived" with date
