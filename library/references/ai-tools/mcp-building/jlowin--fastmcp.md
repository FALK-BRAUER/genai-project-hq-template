---
url: https://github.com/jlowin/fastmcp
stars: 24500
last_checked: 2026-04-13
last_commit: 2026-04-11
category: mcp-building
status: active
---
# fastmcp

> The fast, Pythonic way to build MCP servers and clients

## What's Inside
- High-level decorators for tools (`@mcp.tool`), resources (`@mcp.resource`), and prompts
- Built-in client support for stdio, SSE, HTTP, and in-memory transports
- LLM sampling via `ctx.sample()` for AI-assisted operations
- HTTP request handling via `ctx.http_request()`
- Provider system for sourcing components from anywhere (v3)
- Hot reload with `fastmcp dev` command
- OAuth 2.1 support via WorkOS integration
- Background tasks via Docket

## Stack
- Python 3.10+
- MCP SDK
- Starlette/FastAPI for HTTP transports
- Pydantic for validation
- uv package manager
- prek for linting/formatting

## File Tree (key paths)
```
fastmcp/
├── src/fastmcp/
│   ├── server/
│   ├── client/
│   ├── tools/
│   ├── resources/
│   ├── prompts/
│   ├── cli/
│   ├── auth/
│   └── utilities/
├── tests/
├── docs/
├── examples/
├── skills/fastmcp-client-cli/
└── pyproject.toml
```

## AI-Readiness
- CLAUDE.md: yes
- .cursorrules: no
- AGENTS.md: yes
- MCP config: yes (Typed MCPConfig system)
- Skills/agents: yes (skills/fastmcp-client-cli)
- Hooks: yes (prek pre-commit hooks)

## Notable
- Powers ~70% of MCP servers with 1M+ daily downloads
- Extremely active development (3,374 commits, multiple commits daily)
- v3 introduces providers, transforms, and enhanced background tasks
- Comprehensive documentation at gofastmcp.com with llms.txt support
- Required workflow: `uv sync` + `pytest -n auto` + `prek run --all-files` before committing
