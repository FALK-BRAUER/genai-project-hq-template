---
url: https://github.com/abhishekray07/claude-md-templates
stars: 145
last_checked: 2026-04-15
last_commit: 2026-02-04
category: starter-setup
status: active
---
# claude-md-templates
> Templates for the 3-level CLAUDE.md hierarchy: global, project, and local

## What's Inside
- 3-level hierarchy templates (global → project → local)
- Global template: personal preferences under 15 lines
- Project templates: Next.js/TypeScript, Python/FastAPI, generic
- Local template: personal overrides (gitignored)
- Self-improvement workflow documentation
- Workflows: self-improvement-rules.md, prompting-patterns.md
- Cheatsheet and principles documentation
- Decision guide for what goes where

## Stack
- Markdown templates
- Claude Code configuration patterns

## File Tree (key paths)
```
claude-md-templates/
├── global/
│   └── CLAUDE.md
├── project/
│   ├── nextjs-typescript.md
│   ├── python-fastapi.md
│   └── generic.md
├── local/
│   └── local.md
├── workflows/
│   ├── self-improvement-rules.md
│   └── prompting-patterns.md
├── cheatsheet.md
└── principles.md
```

## AI-Readiness
- CLAUDE.md: yes (templates provided)
- .cursorrules: no
- MCP config: no
- Skills/agents: no
- Hooks: no

## Notable
- Emphasizes lean configs (under 80 lines) to respect attention budget
- Includes "self-improvement loop": after every correction, update CLAUDE.md
- Module-specific CLAUDE.md files for scaling large codebases
