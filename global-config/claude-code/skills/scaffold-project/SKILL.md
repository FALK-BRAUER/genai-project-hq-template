---
name: scaffold-project
description: >
  Bootstraps new projects from vibe-hq templates with full Claude Code and OpenCode
  configuration including CLAUDE.md, AGENTS.md, agents, skills, hooks, MCPs, and plugins.
  Use when starting a new project, running /new-project, or when the user says
  "create a new project" or "scaffold".
allowed-tools: Read, Write, Edit, Glob, Bash(mkdir:*), Bash(git init:*), Bash(git add:*), Bash(git commit:*), Bash(npm:*), Bash(cp:*)
effort: high
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
4. **Customize CLAUDE.md** — Replace template variables with project-specific values (Claude Code).
5. **Setup OpenCode** — Create `.opencode/` directory, copy config from template, customize AGENTS.md.
6. **Initialize ARCHITECTURE.md** — Create empty structure for the architect agent.
7. **Install dependencies** — `npm install` or equivalent.
8. **Register in HQ** — Create entry in `~/vibe-hq/registry/active/{project-name}.md`.
9. **Verify** — Does it build? Does Claude Code load the CLAUDE.md? Does OpenCode load the AGENTS.md?

## Rules

- Use the global default stack unless the user explicitly requests deviations.
- Never scaffold into an existing directory without confirmation.
- The project CLAUDE.md and AGENTS.md should reference global standards, not duplicate them.
- Copy template configs from `claude-code/` and `opencode/` subdirectories in the template.
- Both tools (Claude Code and OpenCode) should be able to load the project after scaffolding.
- Create a FOR_ME.md explaining the project setup after scaffolding.
