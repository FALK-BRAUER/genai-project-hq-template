---
url: https://github.com/Matt-Dionis/claude-code-configs
stars: 626
last_checked: 2026-04-15
last_commit: 2025-08-24
category: starter-setup
status: active
---
# claude-code-configs
> Production-ready Claude Code configurations for popular frameworks and tools

## What's Inside
- CLI tool (claude-config-composer) for generating and merging configs
- Framework configs: Next.js 15, React 19, Svelte 5
- UI library configs: shadcn, Tailwind CSS
- Database configs: Drizzle ORM
- MCP server configs: memory-mcp-server, token-gated-mcp-server
- Tooling integrations: Vercel AI SDK
- 124 passing tests for config validation

## Stack
- TypeScript, Node.js CLI
- Framework-specific configurations
- MCP server integrations

## File Tree (key paths)
```
claude-code-configs/
├── claude-config-composer/
│   ├── src/
│   │   ├── cli.ts
│   │   ├── parser/
│   │   ├── merger/
│   │   └── generator/
│   └── README.md
├── configurations/
│   ├── frameworks/
│   │   └── nextjs-15/
│   ├── ui/
│   │   ├── shadcn/
│   │   └── tailwindcss/
│   ├── databases/
│   │   └── drizzle/
│   └── mcp-servers/
└── docs/
```

## AI-Readiness
- CLAUDE.md: yes
- .cursorrules: no
- MCP config: yes
- Skills/agents: yes
- Hooks: yes

## Notable
- Includes CLI tool for dynamic config generation with intelligent merging
- Automatic backups and git-friendly config management
- Installable via NPM: `npm install -g claude-config-composer`
