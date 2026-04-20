---
name: scaffold-project
description: Bootstrap new projects from vibe-hq templates with full Claude Code configuration including CLAUDE.md, agents, skills, hooks, and MCP setup. Use when starting a new project, running /new-project, or when the user says "create a new project" or "scaffold".
---

## Inputs
- Project name (required)
- Template: nextjs-app | fastapi-service | consulting-report (default: nextjs-app)

## Workflow

### 1. Validate
- Check template exists in `~/vibe-hq/templates/<template>/`
- Check `manifest.json` exists in the template
- Check project name doesn't already exist in `~/projects/` or `registry/active/`

### 2. Create Project Directory
```bash
mkdir -p ~/projects/<name>
cd ~/projects/<name>
git init
```

### 3. Read Manifest
Read `~/vibe-hq/templates/<template>/manifest.json` to get the list of components.

### 4. Copy Agents
For each agent in `manifest.agents`:
- Copy from `~/vibe-hq/library/agents/<path>` to `~/projects/<name>/.claude/agents/<filename>`

### 5. Copy Skills
For each skill in `manifest.skills`:
- Copy from `~/vibe-hq/library/skills/<path>` to `~/projects/<name>/.claude/skills/<dirname>/SKILL.md`

### 6. Copy Commands
For each command in `manifest.commands`:
- Copy from `~/vibe-hq/library/commands/<path>` to `~/projects/<name>/.claude/commands/<filename>`

### 7. Install Hooks
For each hook in `manifest.hooks`:
- Read JSON from `~/vibe-hq/library/hooks/<path>`
- Merge into `~/projects/<name>/.claude/settings.json`

### 8. Install MCPs
For each recipe in `manifest.mcps`:
- Run the shell script from `~/vibe-hq/library/mcps/<path>` in the project directory

### 9. Generate CLAUDE.md
- Read `~/vibe-hq/templates/<template>/CLAUDE.md.template`
- Replace `{{PROJECT_NAME}}` with project name
- Replace `{{CREATED_DATE}}` with today's date
- Write to `~/projects/<name>/CLAUDE.md`

### 10. Initialize Scaffold Files
- Create empty `ARCHITECTURE.md`
- Create empty `LEARNINGS.md`
- Create `.gitignore` with standard entries

### 11. Register Project
- Create `~/vibe-hq/registry/active/<name>.md` with project metadata

### 12. Initial Commit
```bash
cd ~/projects/<name>
git add -A
git commit -m "feat: scaffold <name> from <template> template"
```

### 13. Report
List everything that was installed: agents, skills, commands, hooks, MCPs.
