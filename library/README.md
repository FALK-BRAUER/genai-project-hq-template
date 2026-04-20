# library/

Reusable components shared across all projects. The source of truth for agents, skills, hooks, MCP recipes, commands, and references.

- `agents/` — agent definitions (system prompts, tool configs)
- `skills/` — skill libraries loaded into Claude sessions
- `hooks/` — Claude Code hook scripts
- `mcps/` — MCP catalog, recipes, and setup guides
- `commands/` — slash command definitions
- `references/` — reference docs on external tools, APIs, and services

Templates that use these live in `templates/`. Projects load from here — never copy into projects directly.
