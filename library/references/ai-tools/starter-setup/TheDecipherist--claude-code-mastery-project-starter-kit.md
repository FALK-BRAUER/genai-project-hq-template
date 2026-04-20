---
url: https://github.com/TheDecipherist/claude-code-mastery-project-starter-kit
stars: 283
last_checked: 2026-04-15
last_commit: 2025-08-12
category: starter-setup
status: active
---
# claude-code-mastery-project-starter-kit
> Ready-to-use project template incorporating best practices from the Claude Code Mastery Guide series (V1-V5)

## What's Inside
- CLAUDE.md with numbered critical rules for security, TypeScript, StrictDB, testing, deployment
- 26 slash commands (/help, /quickstart, /review, /commit, /mdd, /new-project, /security-check)
- Context-aware skills (code review checklists, microservice scaffolding, Project Progress with 27 files)
- Classic and MDD (Document → Test → Code) workflows
- Documentation templates (ARCHITECTURE.md, INFRASTRUCTURE.md, DECISIONS.md)
- Integrated MIT-licensed npm packages (ClassMCP, Classpresso, StrictDB-MCP, TerseJSON)
- Quality gates and deterministic hooks

## Stack
- TypeScript strict mode
- StrictDB for database patterns
- ClassMCP for CSS profiles
- MIT-licensed utility packages

## File Tree (key paths)
```
claude-code-mastery-project-starter-kit/
├── .claude/
│   ├── agents/
│   ├── commands/
│   ├── hooks/
│   └── skills/
├── docs/
│   ├── ARCHITECTURE.md
│   ├── INFRASTRUCTURE.md
│   └── DECISIONS.md
├── CLAUDE.md
├── CLAUDE.local.md
└── .env.example
```

## AI-Readiness
- CLAUDE.md: yes
- .cursorrules: no
- MCP config: yes
- Skills/agents: yes
- Hooks: yes

## Notable
- Includes /mdd command for full Document → Test → Code workflow
- Global CLAUDE.md enforces no secrets in commits
- Commands detect project language and preserve existing setup when merging
