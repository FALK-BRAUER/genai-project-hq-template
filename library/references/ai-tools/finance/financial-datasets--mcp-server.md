---
url: https://github.com/financial-datasets/mcp-server
stars: 1893
last_checked: 2026-04-12
last_commit: 2025-03-07
category: finance
status: active
---
# financial-datasets/mcp-server

> An MCP server for interacting with the Financial Datasets stock market API.

## What's Inside
- 10 MCP tools for stock market and crypto data
- Income statements, balance sheets, cash flow statements
- Current and historical stock prices
- Company news retrieval
- Crypto tickers and historical crypto prices
- Claude Desktop integration guide

## Stack
- Python 3.10+
- uv package manager
- mcp[cli], httpx

## File Tree (key paths)
```
mcp-server/
├── server.py
├── pyproject.toml
├── uv.lock
├── .env.example
└── README.md
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: no
- Hooks: no

## Notable
- Simple, focused implementation — single server.py file
- Requires Financial Datasets API key (www.financialdatasets.ai)
- Uses uv for fast dependency management
- MIT license
