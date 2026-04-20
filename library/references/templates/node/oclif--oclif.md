---
url: https://github.com/oclif/oclif
stars: 9500
last_checked: 2026-04-15
last_commit: 2026-04-07
category: node
status: active
---
# oclif

> CLI for generating, building, and releasing oclif CLIs. Built by Salesforce.

## What's Inside
- oclif generate command for new CLIs
- oclif generate:command for adding commands
- oclif generate:hook for adding hooks
- oclif manifest for generating plugin manifests
- oclif pack for packaging (deb, macos, win)
- oclif upload for S3 publishing
- oclif readme for auto-generating README
- oclif init for initializing existing projects

## Stack
- TypeScript 94%, EJS 5%
- Node.js 18+
- @oclif/core, @oclif/test
- ESLint, Prettier, Mocha

## File Tree (key paths)
```
src/
templates/
test/
docs/
bin/
.github/
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: no
- Hooks: yes (husky)

## Notable
- Built and used by Salesforce for Salesforce CLI, Heroku CLI
- Open CLI Framework - industry standard for Node.js CLIs
- Active development with frequent releases (v4.22.98 latest)
