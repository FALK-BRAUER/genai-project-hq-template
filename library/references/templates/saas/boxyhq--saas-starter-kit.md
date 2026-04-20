---
url: https://github.com/boxyhq/saas-starter-kit
stars: 4400
last_checked: 2026-04-15
last_commit: 2024-12-24
category: saas
status: active
---
# BoxyHQ SaaS Starter Kit

> The Open Source Next.js SaaS boilerplate for Enterprise SaaS app development.

## What's Inside
- Authentication: email/password, magic links, OAuth (Google/GitHub), SAML SSO
- Team management: create teams, invite members, role-based access
- Enterprise features: SCIM directory sync, audit logs, webhooks & events
- Payments integration (Stripe/Paddle)
- Internationalization (i18n) support
- Dark mode UI
- User avatar upload
- Email notifications
- E2E tests with Playwright
- Docker Compose for local development
- Prisma ORM with PostgreSQL
- Security headers and best practices

## Stack
- Next.js 14+ (App Router)
- React 18+
- TypeScript
- Tailwind CSS
- Prisma ORM
- PostgreSQL
- NextAuth.js
- SAML Jackson (SSO)
- Svix (webhooks)
- Retraced (audit logs)
- Playwright (E2E testing)

## File Tree (key paths)
```
/
├── .github/
├── app/
│   ├── (auth)/
│   ├── (dashboard)/
│   ├── api/
│   └── layout.tsx
├── components/
├── lib/
├── prisma/
├── tests/
├── docker-compose.yml
├── Dockerfile
├── package.json
├── tailwind.config.ts
└── README.md
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: no
- Hooks: no

## Notable
- Focused on enterprise SaaS requirements (SSO, SCIM, audit logs)
- Built by BoxyHQ team behind enterprise identity products
- Over 4,400 stars — popular choice for Next.js SaaS starters
- Includes production-ready security configurations
