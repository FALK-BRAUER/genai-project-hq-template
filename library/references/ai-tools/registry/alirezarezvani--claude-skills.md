---
url: https://github.com/alirezarezvani/claude-skills
stars: 1250
last_checked: 2026-04-15
last_commit: 2026-03-18
category: registry
status: active
---
# claude-skills

> Comprehensive open-source library of 235 production-ready Claude Code skills, plugins, and agent skills across 9 domains.

## What's Inside
- 235 production-ready skills across 9 domains: engineering, marketing, product, C-level advisory, project management, design, data science, DevOps, and security
- 268 Python automation tools embedded in skills
- 384 reference guides for deep technical context
- 16 specialized agents for autonomous task execution
- 19 slash commands for quick workflows
- Skill packages follow consistent pattern: SKILL.md + scripts/ + references/ + assets/
- Domain-specific READMEs with detailed skill descriptions
- INSTALLATION.md with automated and manual methods for 205+ skills across supported agents (Claude Code, Codex, Cursor, etc.)
- MCP integrations for Atlassian (Jira/Confluence) and engineering tools
- agnix tool for MCP server config validation

## Stack
- Python 3.9+
- Markdown (SKILL.md files)
- YAML frontmatter for skill metadata
- Shell scripts for installation and automation

## File Tree (key paths)
```
claude-skills/
├── CLAUDE.md               # Project guidance and structure
├── INSTALLATION.md         # Installation methods
├── agents/                 # 16 specialized agents
│   └── CLAUDE.md
├── commands/               # 19 slash commands
├── engineering-team/       # 26 skills
├── marketing-skill/        # 43 skills
├── project-management/     # MCP integrations
├── skills/                 # Core skill packages
│   ├── [skill-name]/
│   │   ├── SKILL.md
│   │   ├── scripts/
│   │   ├── references/
│   │   └── assets/
├── .claude/
│   └── commands/
└── README.md
```

## AI-Readiness
- CLAUDE.md: yes
- .cursorrules: no
- AGENTS.md: no
- MCP config: yes
- Skills/agents: yes
- Hooks: no

## Notable
- Restructured README to ~400 lines with SEO optimization; detailed descriptions moved to domain-specific READMEs
- Version 2.1.2 includes a11y-audit, seo-auditor, and plugin-audit skills
- Modular skill package pattern designed for extraction and deployment into any Claude workflow
