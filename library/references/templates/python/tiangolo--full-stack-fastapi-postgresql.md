---
url: https://github.com/tiangolo/full-stack-fastapi-postgresql
stars: 42600
last_checked: 2026-04-15
last_commit: 2024-08-02
category: python
status: archived
---
# Full Stack FastAPI PostgreSQL

> **Note: This repo is archived.** The official successor is https://github.com/fastapi/full-stack-fastapi-template

## What's Inside
- FastAPI backend with async support
- React frontend with TypeScript
- SQLModel for database ORM
- PostgreSQL database
- JWT authentication
- Docker Compose for development and production
- Traefik reverse proxy with automatic HTTPS
- Pytest test suite
- Playwright E2E tests
- Auto-generated frontend API client
- Email-based password recovery
- Dark mode support
- GitHub Actions CI/CD

## Stack
- Python 3.10+
- FastAPI
- SQLModel / SQLAlchemy
- React 18+ with TypeScript
- Vite
- Tailwind CSS
- shadcn/ui
- PostgreSQL
- Docker + Docker Compose
- Traefik
- Pytest + Playwright

## File Tree (key paths)
```
/
├── backend/
│   ├── app/
│   ├── tests/
│   └── Dockerfile
├── frontend/
│   ├── src/
│   ├── public/
│   └── package.json
├── docker-compose.yml
├── docker-compose.override.yml
├── scripts/
└── README.md
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: no
- Hooks: no

## Notable
- Originally by tiangolo (FastAPI creator)
- Moved to official FastAPI organization as `full-stack-fastapi-template`
- Latest version uses Chakra UI v3 and modern tooling
- Strong emphasis on type safety throughout the stack
