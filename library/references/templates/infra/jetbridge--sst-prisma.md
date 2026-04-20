---
url: https://github.com/jetbridge/sst-prisma
stars: 210
last_checked: 2026-04-15
last_commit: 2024-07-02
category: infra
status: active
---
# jetbridge/sst-prisma
> Serverless Stack + Prisma ORM Template

## What's Inside
- AWS CDK + Serverless Stack (SST) setup
- Prisma ORM with Aurora Serverless v2 PostgreSQL
- Next.js App Router frontend
- GraphQL API with AWS AppSync (optional)
- REST API gateway
- NextAuth.js + AWS Cognito authentication
- Live local Lambda development
- Vitest testing setup
- pnpm monorepo
- Lambda Powertools integration

## Stack
- TypeScript (94.9%)
- JavaScript (3.3%)
- SST (Serverless Stack)
- AWS CDK
- Prisma ORM
- Next.js
- Tailwind CSS
- AWS AppSync
- Vitest
- pnpm

## File Tree (key paths)
```
.
├── .github/workflows/
├── backend/
├── bin/
├── common/
├── graphql/
├── stacks/
├── web/
├── .env
├── .env.prod
├── .gitignore
├── .prettierrc.yaml
├── docker-compose.yml
├── eslint.config.mjs
├── LICENSE
├── package.json
├── pnpm-lock.yaml
├── pnpm-workspace.yaml
├── README.md
├── sst.config.ts
├── tsconfig.json
├── vite.config.ts
└── vitest.config.ts
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: no
- Hooks: no

## Notable
- Full-stack serverless template with live Lambda debugging
- Database integration testing with Docker Compose
- Middy middleware for Lambda functions
- ESBuild bundling with tree-shaking
- 148 commits
- Can merge upstream improvements over time
