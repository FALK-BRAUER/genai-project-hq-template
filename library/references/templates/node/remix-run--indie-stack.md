---
url: https://github.com/remix-run/indie-stack
stars: 1100
last_checked: 2026-04-15
last_commit: 2025-04-28
category: node
status: archived
---
# indie-stack

> The Remix Stack for deploying to Fly with SQLite, authentication, testing, linting, formatting, etc.

## What's Inside
- Fly app deployment with Docker
- Production-ready SQLite database
- Healthcheck endpoint for Fly backups region fallbacks
- Cookie-based session authentication
- Prisma ORM
- Tailwind CSS styling
- Cypress E2E testing
- MSW for API mocking
- Vitest + Testing Library unit tests
- GitHub Actions for CI/CD
- remix.init setup script

## Stack
- TypeScript 78%, JavaScript 18%
- Remix, React
- Prisma, SQLite
- Tailwind, Cypress, Vitest
- Docker, Fly.io

## File Tree (key paths)
```
app/
  models/
cypress/
prisma/
test/
mocks/
remix.init/
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: no
- Hooks: no

## Notable
- Archived April 2025 - use React Router templates or Epic Stack instead
- Simpler than blues-stack (SQLite vs PostgreSQL)
- Note-taking app example with full auth
