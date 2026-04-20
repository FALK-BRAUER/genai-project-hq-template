---
url: https://github.com/EodHistoricalData/EODHD-MCP-Server
stars: 2
last_checked: 2026-04-12
last_commit: 2026-03-15
category: finance
status: active
---
# EODHD-MCP-Server

> EODHD MCP Server for AI assistants — provides 75 read-only MCP tools for accessing EOD Historical Data APIs.

## What's Inside
- 75 read-only MCP tools for financial data access
- Three transport options: streamable-http, SSE, stdio
- Core datasets: end-of-day, intraday, live quotes, fundamentals, company news, sentiment
- Marketplace datasets: options, ESG, risk scoring, bond data
- Bundled MCP prompts and documentation resources
- Docker support with docker-compose configuration

## Stack
- Python 3.10+
- FastMCP framework
- Docker, docker-compose

## File Tree (key paths)
```
EODHD-MCP-Server/
├── app/
│   ├── api_client.py
│   ├── tools/
│   ├── prompts/
│   └── resources/
├── entrypoints/
├── tests/
│   ├── auto/
│   └── manual/
├── server.py
├── manifest.json
├── pyproject.toml
└── docker-compose.yml
```

## AI-Readiness
- CLAUDE.md: yes
- .cursorrules: no
- MCP config: yes (manifest.json)
- Skills/agents: no
- Hooks: no
- AGENTS.md: yes

## Notable
- Two server versions: v1 (API key auth) and v2 (OAuth 2.1)
- Preserves upstream API errors as MCP ToolErrors with status codes
- Includes retry support controlled by EODHD_RETRY_ENABLED
- Some marketplace endpoints require specific EODHD subscription access
