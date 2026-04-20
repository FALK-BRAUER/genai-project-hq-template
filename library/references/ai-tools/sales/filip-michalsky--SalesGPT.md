---
url: https://github.com/filip-michalsky/SalesGPT
stars: 2600
last_checked: 2026-04-15
last_commit: 2024-03-23
category: sales
status: active
---
# SalesGPT

> Context-aware AI Sales Agent to automate sales outreach using LLMs, supporting voice, email, texting (SMS, WhatsApp, etc.), product catalogs, Stripe integration, and LiteLLM for 50+ models.

## What's Inside
- Context-aware sales agent using LangChain (inspired by BabyAGI)
- Sales stage awareness (Introduction, Qualification, Value Prop, Needs Analysis, Solution, Objection Handling, Close)
- Product knowledge base integration to reduce hallucinations
- Stripe payment link generation for closing sales
- Calendly meeting scheduling integration
- Automated email communication
- LiteLLM integration for 50+ LLM model support
- LangSmith tracing for debugging and monitoring
- Sync/async streaming support
- Poetry dependency management with Makefile for setup
- Human-in-the-loop supervision

## Stack
- Python 3.8-3.11
- LangChain
- Poetry (dependency management)
- Docker/Docker Compose
- FastAPI (backend)
- LiteLLM

## File Tree (key paths)
```
SalesGPT/
├── .github/workflows/
├── api-website/
├── examples/
├── frontend/
├── salesgpt/
├── tests/
├── website/
├── .env.example
├── Dockerfile.backend
├── docker-compose.yml
├── poetry.lock
├── pyproject.toml
├── run.py
├── run_api.py
└── calendly.py
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- AGENTS.md: no
- MCP config: no
- Skills/agents: no
- Hooks: no

## Notable
- <1s round-trip response for voice channel (STT + LLM + TTS)
- Last commit March 2024 (maintenance mode)
- Most recent release v0.1.2 on March 25, 2024
- 50 open issues, 7 PRs
- Discord community for support
