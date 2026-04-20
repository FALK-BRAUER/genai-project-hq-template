---
url: https://github.com/cloudflare/templates
stars: 1900
last_checked: 2026-04-15
last_commit: 2026-03-09
category: infra
status: active
---
# cloudflare/templates
> Templates for Cloudflare Workers

## What's Inside
- 30+ Cloudflare Workers starter templates
- Full-stack application templates (Astro, Next.js, React, Remix)
- Database templates (D1, PostgreSQL, MySQL, KV)
- AI/LLM integration templates
- Authentication templates (OpenAuth)
- E2E testing with Playwright
- Turborepo monorepo setup
- CLI template via `create-cloudflare`

## Stack
- TypeScript (52.5%)
- JavaScript (32.1%)
- CSS (6.9%)
- HTML (5.5%)
- Astro (2.8%)
- Cloudflare Workers
- Playwright (testing)
- Vitest
- pnpm

## File Tree (key paths)
```
.
├── .github/
├── astro-blog-starter-template/
├── chanfana-openapi-template/
├── cli/
├── containers-template/
├── d1-template/
├── durable-chat-template/
├── llm-chat-app-template/
├── next-starter-template/
├── playwright-tests/
├── react-postgres-fullstack-template/
├── vite-react-template/
├── workers-for-platforms-template/
├── .editorconfig
├── .gitignore
├── .prettierrc.yaml
├── AGENTS.md
├── CLAUDE.md
├── CODEOWNERS
├── CONTRIBUTING.md
├── LICENSE
├── package.json
├── playwright.config.ts
├── pnpm-lock.yaml
├── pnpm-workspace.yaml
├── README.md
├── templates.json
├── turbo.json
└── vitest.config.ts
```

## AI-Readiness
- CLAUDE.md: yes
- .cursorrules: no
- MCP config: no
- Skills/agents: yes (AGENTS.md)
- Hooks: no

## Notable
- **Has both CLAUDE.md and AGENTS.md** - AI-ready template
- 25 releases (latest v8.1.0 Mar 2026)
- 996 commits with very active maintenance
- Comprehensive Playwright E2E test suite
- 104 contributors
- Templates accessible via `npm create cloudflare@latest`
