---
url: https://github.com/vercel/mcp-handler
stars: 580
last_checked: 2026-04-13
last_commit: 2026-03-24
category: infra
status: active
---
# mcp-handler

> A Vercel adapter for the Model Context Protocol (MCP), enabling real-time communication between your applications and AI models. Supports Next.js and Nuxt.

## What's Inside
- Framework adapters for Next.js and Nuxt
- Streamable HTTP and Server-Sent Events (SSE) transports
- Optional Redis integration for SSE resumability
- OAuth Protected Resource Metadata handler (RFC 9728)
- Full TypeScript support with zod validation
- `createMcpHandler` for quick server setup
- Dynamic routing support

## Stack
- TypeScript (95.1%)
- Next.js 13+ / Nuxt 3+
- Node.js 18+
- @modelcontextprotocol/sdk (≥1.26.0 required for security fix)
- zod for schema validation
- Redis (optional, for SSE)

## File Tree (key paths)
```
mcp-handler/
├── src/
│   ├── handlers/
│   ├── transports/
│   ├── oauth/
│   └── types/
├── docs/
│   ├── CLIENTS.md
│   ├── AUTHORIZATION.md
│   └── ADVANCED.md
├── examples/
├── tests/
└── package.json
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- AGENTS.md: no
- MCP config: no
- Skills/agents: no
- Hooks: no

## Notable
- Recently rebranded from `@vercel/mcp-adapter` to `mcp-handler`
- Requires @modelcontextprotocol/sdk ≥1.26.0 due to security vulnerability in prior versions
- Supports both stdio-only clients (via mcp-remote) and direct Streamable HTTP
- 29 releases with active maintenance
