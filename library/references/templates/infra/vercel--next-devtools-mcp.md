---
url: https://github.com/vercel/next-devtools-mcp
stars: 715
last_checked: 2026-04-12
last_commit: 2026-01-08
category: infra
status: active
---
# next-devtools-mcp

> Next.js Development for Coding Agents — MCP server providing Next.js development tools, runtime diagnostics, and utilities for AI coding assistants.

## What's Inside
- Runtime diagnostics for Next.js 16+ (errors, routes, logs, metadata)
- Automated Next.js 16 upgrade with official codemods
- Cache Components migration and setup automation
- Browser automation via Playwright integration
- Direct access to official Next.js documentation
- Curated knowledge base: 12 focused resources on Cache Components, async APIs
- Pre-configured prompts for common Next.js tasks
- Telemetry with opt-out support

## Stack
- TypeScript 89.8%, JavaScript 10.2%
- Node.js v20.19+
- npm/pnpm
- Playwright (browser automation)
- Vitest (testing)

## File Tree (key paths)
```
next-devtools-mcp/
├── src/
│   ├── tools/
│   ├── resources/
│   └── prompts/
├── scripts/
├── test/
├── .claude/
├── .cursor/rules/
├── .mcp.json
├── server.json
├── package.json
├── tsconfig.json
└── vitest.config.ts
```

## AI-Readiness
- CLAUDE.md: yes
- .cursorrules: yes (.cursor/rules)
- MCP config: yes (.mcp.json, server.json)
- Skills/agents: no
- Hooks: no

## Notable
- Official Vercel project for Next.js development
- Auto-discovers running Next.js dev servers at `/_next/mcp`
- Privacy: anonymous telemetry with easy opt-out (NEXT_TELEMETRY_DISABLED=1)
- 16 releases, latest v0.3.10 (Jan 2026)
- Works with all major coding agents: Claude Code, Cursor, Codex, Gemini, VS Code
