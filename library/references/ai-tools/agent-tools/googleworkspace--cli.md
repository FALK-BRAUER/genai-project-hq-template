---
url: https://github.com/googleworkspace/cli
stars: 24900
last_checked: 2026-04-18
last_commit: 2026-03-31
category: agent-tools
status: active
---
# googleworkspace/cli (gws)

> One CLI for all of Google Workspace — built for humans and AI agents. Drive, Gmail, Calendar, and every Workspace API. Zero boilerplate. Structured JSON output. 40+ agent skills included.

## What's Inside
- Dynamically built command surface from Google Discovery Service — picks up new API endpoints automatically
- 100+ AI agent skills (SKILL.md files) for every supported API plus higher-level workflow helpers
- Helper commands prefixed with `+` (e.g., `gws gmail +send`, `gws calendar +agenda`) for common workflows
- Time-aware helpers that use Google account timezone for agenda, standup reports, and meeting prep
- Model Armor integration for sanitizing API responses against prompt injection
- Gemini CLI extension for direct Workspace access within Gemini sessions

## Stack
- Rust (98.8% of codebase)
- Bun/TypeScript for Nix flake
- OAuth2 with AES-256-GCM encrypted credentials
- Nix flake, Homebrew, npm, and Cargo distribution

## File Tree (key paths)
```
googleworkspace/cli/
├── crates/                 # Rust crates (core CLI, Discovery parser, HTTP client)
├── skills/                 # 100+ SKILL.md files per API
├── docs/                   # Skills index, authentication guides
├── scripts/                # Coverage, linting, release scripts
├── .claude/                # Claude Code config
├── .gemini/                # Gemini CLI extension
├── .agent/                 # Agent configuration
├── CLAUDE.md               # Claude Code instructions
├── AGENTS.md               # General agent instructions
└── CONTEXT.md              # Project context for agents
```

## AI-Readiness
- CLAUDE.md: yes
- .cursorrules: no
- MCP config: no
- Skills/agents: yes (100+ SKILL.md files, Gemini CLI extension)
- Hooks: yes (lefthook.yml)

## Notable
- Two-phase parsing: reads argv to identify service, fetches Discovery Document, builds clap command tree dynamically
- Structured exit codes (0-5) for scripting without parsing error output
- NDJSON streaming mode (`--page-all`) for agent-friendly pagination
- Service account and headless CI auth flows with credential export/import
- Not an officially supported Google product
