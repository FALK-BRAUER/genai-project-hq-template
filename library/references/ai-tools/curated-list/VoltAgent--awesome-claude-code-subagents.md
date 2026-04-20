---
url: https://github.com/VoltAgent/awesome-claude-code-subagents
stars: 16500
last_checked: 2026-04-15
last_commit: 2026-04-06
category: curated-list
status: active
---
# VoltAgent/awesome-claude-code-subagents

> A collection of 100+ specialized Claude Code subagents covering a wide range of development use cases.

## What's Inside
- 10 Categories of subagents: Core Development, Language Specialists, Infrastructure, Quality & Security, Data & AI, Developer Experience, Specialized Domains, Business & Product, Meta & Orchestration, Research & Analysis
- Plugin-based installation with multiple plugin packs (voltagent-core-dev, voltagent-lang, voltagent-infra, etc.)
- Interactive installer script (install-agents.sh)
- Standalone installer (no clone required)
- Agent-installer subagent for browsing/installing via Claude Code
- Subagent structure templates and documentation

## Stack
- Markdown agent definitions
- YAML frontmatter for agent metadata
- Bash installation scripts
- Claude Code plugin format

## File Tree (key paths)
```
awesome-claude-code-subagents/
├── .claude-plugin/
├── .claude/
├── .github/
│   └── workflows/
├── categories/
│   ├── 01-core-development/
│   ├── 02-language-specialists/
│   ├── 03-infrastructure/
│   ├── 04-quality-security/
│   ├── 05-data-ai/
│   ├── 06-developer-experience/
│   ├── 07-specialized-domains/
│   ├── 08-business-product/
│   ├── 09-meta-orchestration/
│   └── 10-research-analysis/
├── tools/
│   └── subagent-catalog/
├── .gitignore
├── CLAUDE.md
├── CONTRIBUTING.md
├── LICENSE
├── README.md
└── install-agents.sh
```

## AI-Readiness
- CLAUDE.md: yes
- .cursorrules: no
- MCP config: no
- Skills/agents: yes (100+ subagents)
- Hooks: no

## Notable
- Part of larger VoltAgent ecosystem (awesome-agent-skills, awesome-codex-subagents, awesome-openclaw-skills, awesome-ai-agent-papers)
- Subagents have independent context windows and granular tool permissions
- Supports both project-specific (.claude/agents/) and global (~/.claude/agents/) installation
- Active maintenance with 430+ commits
