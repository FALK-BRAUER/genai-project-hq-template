---
url: https://github.com/davila7/claude-code-templates
stars: 420
last_checked: 2026-04-15
last_commit: 2026-03-18
category: registry
status: active
---
# claude-code-templates

> Node.js CLI tool for managing Claude Code components (agents, commands, MCPs, hooks, settings) with a static website for browsing and installing components.

## What's Inside
- 600+ AI agents for development tasks (security auditors, React performance optimizers, database architects)
- 200+ custom slash commands for workflows
- 55+ MCP integrations for external services
- 60+ Claude Code configuration files (settings)
- 39+ automation hooks for lifecycle events
- 14+ complete project templates
- Interactive CLI for component installation and management
- Static website (aitmpl.com) for browsing and installing components
- Vercel API endpoints for download tracking
- Discord integration for community support
- Plugin marketplace with 10+ plugins and 1000+ total components

## Stack
- Node.js
- TypeScript
- Vercel (for API endpoints and hosting)
- GitHub CLI integration

## File Tree (key paths)
```
claude-code-templates/
├── CLAUDE.md               # Repository guidance
├── agents/                 # 600+ AI agents
├── commands/               # 200+ slash commands
├── mcps/                   # 55+ MCP integrations
├── settings/               # 60+ config files
├── hooks/                  # 39+ automation hooks
├── templates/              # 14+ project templates
├── website/                # Static site for browsing
├── api/                    # Vercel API endpoints
│   ├── download.ts
│   └── discord.ts
├── src/                    # CLI tool source
└── package.json
```

## AI-Readiness
- CLAUDE.md: yes
- .cursorrules: no
- AGENTS.md: no
- MCP config: yes
- Skills/agents: yes
- Hooks: yes

## Notable
- One of the largest component marketplaces for Claude Code with 1000+ total components
- Components organized by workflow: testing, deployment, documentation, DevOps
- Supports both CLI installation and web-based browsing at aitmpl.com
- Built with Claude Code itself (self-documenting project)
