---
url: https://github.com/vercel/platforms
stars: 6700
last_checked: 2026-04-15
last_commit: 2025-01-01
category: frontend
status: active
---
# platforms

> A full-stack Next.js app with multi-tenancy and custom domain support

## What's Inside
- Custom subdomain routing with Next.js middleware
- Tenant-specific content and pages
- Shared components across tenants
- Redis for tenant data storage (Upstash)
- Admin interface for managing tenants
- Emoji support for tenant branding
- Local development with subdomains support
- Vercel preview deployment compatible
- shadcn/ui design system

## Stack
- Next.js 15 with App Router
- React 19
- Upstash Redis
- Tailwind CSS 4
- shadcn/ui

## File Tree (key paths)
```
/
├── app/
│   ├── (dashboard)/
│   ├── [domain]/
│   └── admin/
├── components/
│   └── ui/
├── lib/
├── middleware.ts
├── next.config.ts
└── package.json
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: no
- Hooks: no

## Notable
- Built by Vercel team (Steven Tey)
- Demo: app.vercel.pub
- Wildcard subdomain routing handled in middleware
- Uses `subdomain:{name}` key pattern in Redis
- Production-ready multi-tenant architecture example
