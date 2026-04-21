---
name: scaffold-project
description: >
  Bootstraps new projects from vibe-hq templates with full Codex and Claude Code
  configuration including AGENTS.md, CLAUDE.md, skills, hooks, and MCPs. Use when
  starting a new project, running /new-project, or when the user says "create a
  new project" or "scaffold".
---

## Available Templates

Check `~/vibe-hq/templates/` for current templates:
- `nextjs-app` — Next.js App Router + TypeScript + Tailwind + shadcn/ui + Prisma
- `fastapi-service` — Python FastAPI + SQLAlchemy + Alembic
- `consulting-report` — Non-code: client deliverable template

## Workflow

1. **Gather info** — Ask for: project name, template choice, brief description, any stack deviations.
2. **Create project** — `mkdir -p ~/projects/{project-name}`, initialize git.
3. **Apply template** — Copy from `~/vibe-hq/templates/{template}/`.
4. **Customize AGENTS.md** — Replace template variables with project-specific values (Codex).
5. **Customize CLAUDE.md** — Mirror relevant sections for Claude Code, reference global standards rather than duplicating.
6. **Initialize ARCHITECTURE.md** — Create empty structure for later population.
7. **Install dependencies** — `npm install` or equivalent.
8. **Register in HQ** — Create entry in `~/vibe-hq/registry/active/{project-name}.md`.
9. **Verify** — Does it build? Does Codex load AGENTS.md? Does Claude Code load CLAUDE.md?

## Rules

- Use the global default stack unless the user explicitly requests deviations.
- Never scaffold into an existing directory without confirmation.
- Project AGENTS.md and CLAUDE.md should reference global standards, not duplicate them.
- Copy template configs from `codex/` and `claude-code/` subdirectories in the template.
- Both tools (Codex and Claude Code) should be able to load the project after scaffolding.
- Create a FOR_FALK.md explaining the project setup after scaffolding.
