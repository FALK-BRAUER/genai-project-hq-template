---
url: https://github.com/louislva/claude-peers-mcp
stars: 1900
last_checked: 2026-04-18
last_commit: 2026-03-21
category: agent-tools
status: active
---
# louislva/claude-peers-mcp

> Allow all your Claude Codes to message each other ad-hoc — a local MCP server that enables isolated Claude Code instances to discover and communicate in real-time.

## What's Inside
- Broker daemon on localhost:7899 with SQLite database for peer registration and message routing
- MCP server (stdio transport) — one per Claude Code session, registers with broker on startup
- Channel protocol for instant message delivery (no polling delay)
- Auto-summary feature using gpt-5.4-nano (optional, requires OPENAI_API_KEY)
- Peer discovery scoped by machine, directory, or git repository
- CLI for inspecting peers and sending messages from terminal

## Stack
- TypeScript 100%
- Bun runtime
- SQLite for persistence
- claude/channel protocol for push-based interruptions

## File Tree (key paths)
```
louislva/claude-peers-mcp/
├── broker.ts           # Broker daemon: peer registry, message routing, SQLite
├── server.ts           # MCP server: stdio transport, broker registration
├── cli.ts              # CLI: status, peers, send, kill-broker
├── shared/             # Shared utilities and types
├── .mcp.json           # MCP configuration
├── CLAUDE.md           # Claude Code instructions
└── package.json        # Bun dependencies
```

## AI-Readiness
- CLAUDE.md: yes
- .cursorrules: no
- MCP config: yes (.mcp.json)
- Skills/agents: no
- Hooks: no

## Notable
- Push-based interruption delivers messages directly into agent's context window without user prompts
- Automatic zombie pruning via process ID checks keeps network registry clean
- Bottom-up peer discovery based on git branches and working directories (not top-down orchestration)
- Requires Claude Code v2.1.80+ and claude.ai login (channels don't work with API key auth)
