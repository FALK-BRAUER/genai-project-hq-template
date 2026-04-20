---
url: https://github.com/vstorm-co/full-stack-fastapi-nextjs-llm-template
stars: 1000
last_checked: 2026-04-15
last_commit: 2026-04-07
category: ai-llm
status: active
---
# Full-Stack AI Agent Template

> Production-ready FastAPI + Next.js project generator with AI agents, RAG, and 20+ enterprise integrations

## What's Inside
- 5 AI agent frameworks (PydanticAI, LangChain, LangGraph, CrewAI, DeepAgents)
- RAG pipeline with vector stores (Milvus, Qdrant, pgvector, ChromaDB)
- FastAPI backend with WebSocket streaming for real-time responses
- Next.js 15 frontend with AI chat interface
- JWT authentication, OAuth, admin panel
- Background task processing (Celery, Taskiq, ARQ)
- Observability (Logfire, LangSmith, Sentry, Prometheus)
- Django-style CLI with auto-discovered commands
- Web configurator for visual project setup

## Stack
- Python, TypeScript
- FastAPI, Pydantic v2
- Next.js 15, React 19
- PostgreSQL, MongoDB, Redis
- Tailwind CSS v4, Zustand, TanStack Query

## File Tree (key paths)
```
fastapi_gen/
template/
docs/
tests/
assets/
.github/
AGENTS.md
CLAUDE.md
pyproject.toml
uv.lock
```

## AI-Readiness
- CLAUDE.md: yes
- .cursorrules: no
- MCP config: no
- Skills/agents: yes (AGENTS.md)
- Hooks: no

## Notable
- Generated projects include both CLAUDE.md and AGENTS.md optimized for AI coding assistants
- Supports 4 LLM providers and multiple embedding models
- Includes document ingestion CLI with Google Drive and S3 sync connectors
- 100% test coverage, used by teams at NVIDIA, Pfizer, TikTok
