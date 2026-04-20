# CLAUDE.md — GenAI Project HQ

## Overview
This is a meta-project that manages all your GenAI-assisted development infrastructure.
It scaffolds new projects, syncs configs, tracks learnings, and runs automated maintenance
via macOS launchd scheduled jobs.

## What This Repo Contains
- `registry/` — every project you track (active + archived)
- `templates/` — project templates used by /new-project
- `global-config/` — source of truth for all tool configs (settings.json, MCP configs)
- `library/` — reusable agents, skills, hooks, MCP recipes
- `docs/` — reference handbook: MCPs, plugins, skills, hooks installed globally
- `learnings/` — accumulated knowledge across all projects
- `planning/` — project plans, backlogs, architecture docs
- `tools/scripts/` — automation scripts for scheduled maintenance
- `tools/prompts/` — prompts used by scheduled Claude jobs

## Slash Commands
- /new-project — scaffold a project from template
- /list-projects — show the registry
- /doctor — health check the setup
- /sync — pull learnings, update templates

## Rules
- Every config change goes through this repo
- Templates are the source of truth — project configs derive from them
- Learnings flow back from projects into templates
- **Always document progress** — update execution docs, planning docs, and checklists as you complete steps
- **Commit and push regularly** — don't let changes pile up

## Setup
See `docs/SETUP.md` for initial configuration steps (API keys, launchd jobs, Telegram notifications).
