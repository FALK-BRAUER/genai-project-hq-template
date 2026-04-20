---
url: https://github.com/alpacahq/alpaca-mcp-server
stars: 639
last_checked: 2026-04-13
last_commit: 2026-04-06
category: finance
status: active
---
# alpaca-mcp-server

> Alpaca's official MCP Server lets you trade stocks, ETFs, crypto, and options, run data analysis, and build strategies in plain English directly from your favorite LLM tools and IDEs

## What's Inside
- 61 MCP tools for account management, trading, positions, watchlists, and market data
- Support for stocks, ETFs, crypto, and options trading
- Real-time and historical market data (bars, quotes, trades, snapshots)
- Multi-leg options strategies (bull call spreads, etc.)
- Toolset filtering via `ALPACA_TOOLSETS` env var
- Docker support with official image

## Stack
- Python 3.10+
- FastMCP framework
- OpenAPI spec-driven tool generation
- uv package manager
- pytest for testing (integrity + paper API integration)

## File Tree (key paths)
```
alpaca-mcp-server/
├── src/alpaca_mcp_server/
│   ├── server.py
│   ├── cli.py
│   ├── names.py
│   ├── toolsets.py
│   ├── overrides.py
│   ├── market_data_overrides.py
│   └── specs/
├── tests/
├── scripts/
├── charts/alpaca-mcp-server/
└── pyproject.toml
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- AGENTS.md: yes
- MCP config: yes (server.json, server.yaml)
- Skills/agents: no
- Hooks: no

## Notable
- Official server from Alpaca HQ with full trading API coverage
- Auto-generates tools from bundled OpenAPI specs
- Comprehensive test suite: integrity checks + paper API integration tests
- V2 is a complete rewrite using FastMCP and OpenAPI (not backward compatible with V1)
