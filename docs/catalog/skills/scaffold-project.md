# Scaffold Project

- **Type:** Skill
- **Command:** `/scaffold-project` or `/new-project`
- **Source:** Custom (global + hq project)
- **Scope:** Global + hq project
- **Status:** Active

## What It Does
Bootstraps new projects from hq templates with full Claude Code configuration including CLAUDE.md, agents, skills, hooks, and MCP setup. Reads template manifests, copies library components, generates project configs, and registers the project in the hq registry.

## Usage
```
/scaffold-project <project-name> --template <nextjs-app|fastapi-service|consulting-report>
/new-project <project-name> --template <template>
```
Template defaults to `nextjs-app` if not specified.

### Available Templates
- `nextjs-app` -- Next.js App Router + TypeScript + Tailwind + shadcn/ui + Prisma
- `fastapi-service` -- Python FastAPI + SQLAlchemy + Alembic
- `consulting-report` -- Non-code: client deliverable template

## Triggers
- "Create a new project"
- "Scaffold"
- Starting a new project from scratch
- Explicit `/scaffold-project` or `/new-project` invocation

## Tips & Gotchas
- Uses the global default stack unless explicitly told otherwise.
- Never scaffolds into an existing directory without confirmation.
- The project CLAUDE.md references global standards, not duplicating them.
- Creates a FOR_HUMAN.md explaining the project setup after scaffolding.
- The hq project command `/new-project` delegates to this skill.
- Also available as a hq project-level skill with identical logic.

## Installed In
| Location | Path |
|----------|------|
| Global skills | `~/.claude/skills/scaffold-project/SKILL.md` |
| hq project skill | `~/hq/.claude/skills/scaffold-project/SKILL.md` |
| hq project command | `~/hq/.claude/commands/new-project.md` |
