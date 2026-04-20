---
url: https://github.com/ixartz/SaaS-Boilerplate
stars: 7000
last_checked: 2026-04-15
last_commit: 2025-05-01
category: saas
status: active
---
# SaaS Boilerplate

> 🚀🎉📚 SaaS Boilerplate built with Next.js + Tailwind CSS + Shadcn UI + TypeScript. ⚡️ Full-stack React application with Auth, Multi-tenancy, Roles & Permissions, i18n, Landing Page, DB, Logging, Testing

## What's Inside
- Authentication with Clerk (sign up, sign in, MFA, social auth, passkeys)
- Multi-tenancy and team support with organization management
- Role-based access control and permissions
- User impersonation feature
- Database with DrizzleORM (PostgreSQL, SQLite, MySQL compatible)
- I18n with next-intl and Crowdin integration
- Form handling with React Hook Form and Zod validation
- Error monitoring with Sentry
- Logging with Pino.js and Better Stack
- E2E testing with Playwright, unit testing with Vitest
- Storybook for UI development
- Stripe subscription payment integration

## Stack
- TypeScript, JavaScript, CSS
- Next.js 14 with App Router
- DrizzleORM
- Clerk authentication
- Tailwind CSS, Shadcn UI
- React Hook Form, Zod
- Vitest, Playwright
- Sentry, Pino.js

## File Tree (key paths)
```
SaaS-Boilerplate/
├── .github/
├── .husky/
├── .storybook/
├── .vscode/
├── migrations/
├── public/
├── src/
│   ├── app/
│   ├── components/
│   ├── features/
│   ├── libs/
│   ├── locales/
│   ├── models/
│   ├── styles/
│   ├── templates/
│   ├── types/
│   └── utils/
└── tests/
    ├── e2e/
    └── integration/
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: no
- Hooks: yes (Husky, GitHub Actions)

## Notable
- Actively maintained with monthly dependency updates
- Has Pro and Max versions with additional features
- Includes Checkly monitoring as code
- Automatic changelog generation with Semantic Release
