---
url: https://github.com/CriticalMoments/CMSaasStarter
stars: 2300
last_checked: 2026-04-15
last_commit: 2025-06-06
category: frontend
status: active
---
# CMSaasStarter

> A modern SaaS template/boilerplate built with SvelteKit, Tailwind, and Supabase

## What's Inside
- User authentication (Supabase Auth) with OAuth
- Marketing page with SEO optimization
- Blog engine with RSS and rich formatting
- User dashboard with profile, settings, billing
- Subscriptions via Stripe Checkout + Portal
- Pricing page with plan management
- Email system with templates (Resend)
- Site search without backend
- Contact-us form
- Onboarding flow after signup
- Cookie consent for GDPR
- Cloudflare Pages/Workers deployment

## Stack
- SvelteKit, Tailwind CSS, DaisyUI
- Supabase (Auth, Postgres)
- Stripe (Checkout, Portal)
- Cloudflare Pages, Cloudflare Workers
- Vitest for testing

## File Tree (key paths)
```
/
├── .github/workflows/
├── .vscode/
├── patches/
├── src/
│   ├── lib/
│   ├── routes/
│   │   ├── (marketing)/
│   │   └── (admin)/
│   └── utils/
├── static/
├── supabase/migrations/
└── package.json
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: no
- Hooks: yes (pre-commit script)

## Notable
- Created by Kiln AI team for their own product
- Perfect Google PageSpeed score (100/100)
- Pre-rendered pages + instant navigation
- Free tier: $0/mo hosting, scales to 50k MAU
- Community extensions: i18n, shadcn/ui fork
