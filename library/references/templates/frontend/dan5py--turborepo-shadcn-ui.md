---
url: https://github.com/dan5py/turborepo-shadcn-ui
stars: 667
last_checked: 2026-04-15
last_commit: 2024-12-13
category: frontend
status: active
---
# turborepo-shadcn-ui

> Turborepo starter with shadcn/ui pre-configured

## What's Inside
- Turborepo monorepo setup with pnpm
- Next.js app in `apps/docs`
- Shared React component library powered by shadcn/ui
- Pre-configured ESLint and Prettier
- TypeScript configuration across packages
- Custom script: `pnpm ui add <component-name>`
- Turbo gen workspace command for adding new apps
- Remote caching support with Vercel

## Stack
- Turborepo, Next.js, React
- TypeScript, shadcn/ui
- Tailwind CSS, pnpm
- ESLint, Prettier

## File Tree (key paths)
```
/
├── apps/
│   └── docs/
├── packages/
│   ├── eslint-config/
│   ├── typescript-config/
│   └── ui/
├── package.json
├── pnpm-workspace.yaml
└── turbo.json
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: no
- Hooks: no

## Notable
- Uses pnpm as package manager (bun version also available)
- Simple command to add shadcn/ui components: `pnpm ui add`
- Supports remote caching with Vercel for CI/CD pipelines
