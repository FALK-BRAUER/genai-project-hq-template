---
description: Scaffold new project from template
allowed-tools: Read, Write, Bash(mkdir:*), Bash(cp:*), Bash(git init:*), Bash(claude mcp add:*)
argument-hint: <project-name> --template <nextjs-app|fastapi-service|consulting-report>
---

Scaffold a new project using the vibe-hq library.

1. Parse $ARGUMENTS for project name and template (default: nextjs-app)
2. Read `templates/<template>/manifest.json` for the list of components to install
3. Create `~/projects/<project-name>/` and initialize git
4. Copy agents from `library/agents/` as listed in manifest → `.claude/agents/`
5. Copy skills from `library/skills/` as listed in manifest → `.claude/skills/`
6. Copy commands from `library/commands/` as listed in manifest → `.claude/commands/`
7. Merge hooks from `library/hooks/` as listed in manifest into `.claude/settings.json`
8. Run MCP install recipes from `library/mcps/recipes/` as listed in manifest
9. Generate CLAUDE.md from `templates/<template>/CLAUDE.md.template` with project name substituted
10. Initialize empty ARCHITECTURE.md
11. Add registry entry: `registry/active/<project-name>.md`
12. Report what was installed

Use the scaffold-project skill for the detailed implementation logic.
