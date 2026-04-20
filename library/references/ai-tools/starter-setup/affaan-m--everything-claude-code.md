---
url: https://github.com/affaan-m/everything-claude-code
stars: 156000
last_checked: 2026-04-15
last_commit: 2026-01-18
category: starter-setup
status: active
---
# everything-claude-code
> Complete agent harness system from Anthropic hackathon winner with skills, instincts, memory, security, and research-first development

## What's Inside
- 28 specialized subagents (planning, TDD, security review)
- 119 skills with continuous learning system for pattern extraction
- 60 slash commands for workflows
- Cross-platform configs: Claude Code, Cursor (.cursor/), Codex (.codex/), OpenCode (.opencode/)
- AgentShield scanner (CLI/GitHub Action with 1,282 tests)
- PreToolUse hooks (blocks --no-verify, detects secrets like sk-, ghp_, AKIA)
- Support for 12 language ecosystems (TypeScript, Python, Go, Rust)
- SQLite state store for memory persistence
- Selective install via install-plan.js/install-apply.js

## Stack
- Multi-language support (TypeScript, Python, Go, Rust, etc.)
- SQLite for state persistence
- GitHub Actions for AgentShield CI

## File Tree (key paths)
```
everything-claude-code/
├── .claude/
│   ├── settings.json
│   ├── agents/
│   ├── commands/
│   ├── hooks/
│   └── skills/
├── .cursor/
├── .codex/
├── .opencode/
├── agents/
├── commands/
├── hooks/
├── skills/
├── rules/
│   ├── common/
│   └── typescript/
├── install.sh
├── install-plan.js
└── install-apply.js
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no (uses .cursor/ directory)
- MCP config: no
- Skills/agents: yes
- Hooks: yes

## Notable
- Hit 100K stars, 768 commits from 113 contributors
- Hook-based security enforcement blocks dangerous operations
- v1.9.0 added 15+ new skills and multi-language rules
