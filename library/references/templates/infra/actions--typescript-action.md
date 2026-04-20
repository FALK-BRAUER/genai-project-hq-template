---
url: https://github.com/actions/typescript-action
stars: 2400
last_checked: 2026-04-15
last_commit: 2025-10-13
category: infra
status: active
---
# actions/typescript-action
> Create a TypeScript Action with tests, linting, workflow, publishing, and versioning

## What's Inside
- GitHub Action template for TypeScript
- Complete CI/CD workflow setup
- Jest testing with TypeScript support
- ESLint and Prettier linting
- Rollup bundling for distribution
- Version tagging and release workflow
- Licensed dependency compliance checking
- CodeQL security scanning
- Local action testing with @github/local-action
- Release helper script

## Stack
- TypeScript
- JavaScript
- Node.js 20.x
- Jest (testing)
- Rollup (bundling)
- ESLint, Prettier
- GitHub Actions

## File Tree (key paths)
```
.
├── .devcontainer/
├── .github/
│   └── workflows/
├── .licenses/npm/
├── .vscode/
├── __fixtures__/
├── __tests__/
├── badges/
├── dist/
├── script/
├── src/
├── .checkov.yml
├── .env.example
├── .gitignore
├── .node-version
├── .prettierrc.yml
├── action.yml
├── actionlint.yml
├── eslint.config.mjs
├── jest.config.js
├── LICENSE
├── package.json
├── README.md
├── rollup.config.ts
└── tsconfig.json
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: no
- Hooks: no

## Notable
- Official GitHub Actions template repository
- 976 commits with very active maintenance
- 76 contributors
- Includes release automation script
- Checkov security scanning integration
- Full ESM support
