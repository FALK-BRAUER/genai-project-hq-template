---
url: https://github.com/botpress/botpress
stars: 14600
last_checked: 2026-04-15
last_commit: 2026-04-06
category: customer-support
status: active
---
# botpress/botpress

> Botpress is the ultimate platform for building next-generation chatbots and assistants powered by OpenAI. Start building incredible assistants for your projects or businesses at lightning speed.

## What's Inside
- Integrations: All public integrations on Botpress Hub maintained by Botpress team
- Devtools: CLI (@botpress/cli), SDK (@botpress/sdk), API Client (@botpress/client)
- Bots: Example bots "as code" using SDK and CLI
- Plugins: Coming soon
- Integration development workflow with `bp init` and `bp deploy` commands
- Support for public and private integration deployment

## Stack
- TypeScript (99.6%)
- Node.js runtime
- pnpm package manager
- Turbo monorepo
- Vitest for testing
- ESLint + Prettier

## File Tree (key paths)
```
botpress/
├── .github/
├── .greptile/
├── .husky/
├── .vscode/
├── bots/
├── integrations/
├── interfaces/
├── packages/
├── patches/
├── plugins/
├── scripts/
├── .dockerignore
├── .editorconfig
├── .gitignore
├── .npmrc
├── .oxlintrc.json
├── .prettierignore
├── .prettierrc
├── .tool-versions
├── CODEOWNERS
├── eslint.config.mjs
├── package.json
├── pnpm-lock.yaml
├── pnpm-workspace.yaml
├── readme.md
├── tsconfig.json
├── turbo.json
└── vitest.config.ts
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: no
- Hooks: no (.husky present for git hooks)

## Notable
- 126 releases, latest v12.30.9 (Jun 2023)
- CNCF-style open source with clear contribution guidelines
- Greptile integration for AI code indexing
- MIT license
- Strong TypeScript focus with monorepo structure
