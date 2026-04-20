# Setup Doctor

- **Type:** Skill + Command
- **Command:** `/doctor`
- **Source:** Custom (hq project)
- **Scope:** hq project
- **Status:** Active

## What It Does
Verifies all tools are installed, configs are valid, MCPs are running, and the hq repo is healthy. Runs a comprehensive health check covering core tools, global Claude config, MCP servers, repo state, library contents, templates, and scripts.

## Usage
```
/doctor
```
No arguments needed. Runs the full health check.

### Checks Performed
1. **Core Tools** -- node (v22+), npm, git, gh, claude CLI, docker
2. **Global Config** -- CLAUDE.md, settings.json, agents, commands, skills
3. **MCP Servers** -- memory, sequential-thinking, context7, chrome-devtools, filesystem, github
4. **Vibe HQ Repo** -- clean working tree, on main, up to date with remote
5. **Library** -- agents, skills, hooks, mcps, commands populated
6. **Templates** -- manifest.json valid for all templates (nextjs-app, fastapi-service, consulting-report)
7. **Scripts** -- install-global.sh, sync-learnings.sh, audit-all.sh exist and are executable

## Triggers
- After initial setup
- After making config changes
- Periodic health check
- Something seems broken
- Explicit `/doctor` invocation

## Tips & Gotchas
- Output uses a checklist format with pass/warning/fail indicators.
- The `/doctor` command delegates to the setup-doctor skill for detailed checks.
- Verifies MCP servers have valid command and args configuration.
- Checks that all manifest references point to existing library files.

## Installed In
| Location | Path |
|----------|------|
| hq project skill | `~/hq/.claude/skills/setup-doctor/SKILL.md` |
| hq project command | `~/hq/.claude/commands/doctor.md` |
