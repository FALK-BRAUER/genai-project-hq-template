---
url: https://github.com/wshobson/maverick-mcp
stars: 479
last_checked: 2026-04-12
last_commit: 2026-03-28
category: finance
status: active
---
# maverick-mcp

> MaverickMCP — Personal Stock Analysis MCP Server with professional-grade financial data analysis, technical indicators, and portfolio optimization tools.

## What's Inside
- 39+ financial analysis tools for Claude Desktop
- Pre-seeded database with 520 S&P 500 stocks
- Advanced backtesting engine (VectorBT-powered) with 15+ built-in strategies
- Technical analysis: RSI, MACD, Bollinger Bands, support/resistance
- Portfolio management: position tracking, correlation analysis, optimization
- AI-powered research agents with parallel execution (7-256x speedup)
- Redis-powered caching with in-memory fallback
- Multi-transport support: HTTP, SSE, STDIO

## Stack
- Python 3.12+
- FastMCP 2.0
- uv package manager
- TA-Lib (technical analysis)
- VectorBT (backtesting)
- SQLAlchemy (PostgreSQL/SQLite)
- Redis (optional caching)

## File Tree (key paths)
```
maverick-mcp/
├── maverick_mcp/
│   ├── api/
│   ├── tools/
│   ├── agents/
│   └── db/
├── conductor/
├── alembic/
├── scripts/
├── tools/
├── tests/
├── docs/
├── examples/
├── CLAUDE.md
├── server.json
├── pyproject.toml
├── Makefile
└── docker-compose.yml
```

## AI-Readiness
- CLAUDE.md: yes
- .cursorrules: no
- MCP config: yes (server.json)
- Skills/agents: yes (research agents, multi-agent orchestration)
- Hooks: no

## Notable
- No authentication required — designed for personal use
- OpenRouter integration with 400+ AI models, 40-60% cost reduction
- Comprehensive Makefile: `make dev` starts everything including database seeding
- Smart error handling with automatic fix suggestions
- Hot reload and fast development tools (< 3 second startup)
- Educational focus with detailed build guide on author's website
