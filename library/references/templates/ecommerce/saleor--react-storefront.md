---
url: https://github.com/saleor/storefront
stars: 1400
last_checked: 2026-04-15
last_commit: 2026-04-14
category: ecommerce
status: active
---
# storefront (Paper)

> A minimal, production-ready storefront template for Saleor — clean as a blank page, built to ship.

## What's Inside
- Multi-step, mobile-first checkout with guest/auth support
- Multi-channel, multi-currency support with channel-scoped routing
- Product pages with multi-attribute variant selection
- Cache Components (Partial Prerendering) for performance
- GraphQL Codegen for type-safe API calls
- Webhook-based cache invalidation

## Stack
- TypeScript (98.2%)
- Next.js 16 with App Router and Server Components
- React 19 with concurrent features
- Tailwind CSS with OKLCH design tokens
- GraphQL with Codegen

## File Tree (key paths)
```
.cursor/
.github/
.husky/
.vscode/
public/
skills/saleor-paper-storefront/
src/
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: yes
- MCP config: no
- Skills/agents: yes (skills/saleor-paper-storefront/ with 11 task-specific rules)
- Hooks: yes (.husky/)

## Notable
- Includes AGENTS.md for AI assistant architecture overview
- 11 project-specific skills for GraphQL, caching, checkout, etc.
- Cache architecture with 5-min TTL for product pages, live checkout
- FSL-1.1-ALv2 license (converts to Apache 2.0 after 2 years)
