---
url: https://github.com/HKUDS/CLI-Anything
stars: 31300
last_checked: 2026-04-18
last_commit: 2026-04-17
category: agent-tools
status: active
---
# CLI-Anything

> CLI-Anything: Making ALL Software Agent-Native — bridges the gap between AI agents and the world's software by generating structured CLI interfaces for any application.

## What's Inside
- 7-phase pipeline that analyzes source code, designs CLI architecture, implements Click-based CLI with REPL, writes tests, and publishes to PATH
- Pre-built plugins for Claude Code, Pi, OpenCode, OpenClaw, Codex, Qodercli, and GitHub Copilot CLI
- 50+ agent harnesses for popular software (GIMP, Blender, LibreOffice, OBS Studio, Zoom, Godot, etc.)
- CLI-Hub meta-skill for autonomous CLI discovery and installation by agents
- CLI-Hub package manager (`pip install cli-anything-hub`) for browsing and installing community CLIs
- SKILL.md generation for every CLI, making them AI-discoverable

## Stack
- Python 3.10+, Click 8.0+
- Pytest for testing (2,130+ tests)
- Jinja2 for skill template generation
- Structured JSON output for agent consumption

## File Tree (key paths)
```
CLI-Anything/
├── cli-anything-plugin/    # Claude Code plugin
├── opencode-commands/      # OpenCode slash commands
├── openclaw-skill/         # OpenClaw skill definition
├── codex-skill/            # Codex skill with installer
├── qoder-plugin/           # Qodercli plugin setup
├── .pi-extension/          # Pi Coding Agent extension
├── agent-harness/          # Software-specific harnesses (gimp/, blender/, etc.)
├── cli-hub-meta-skill/     # Agent-discoverable CLI catalog
├── cli-hub/                # CLI-Hub frontend
└── registry.json           # CLI-Hub registry
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: yes (plugins for 7+ AI coding platforms)
- Hooks: no

## Notable
- Generated CLIs include REPL mode with undo/redo, structured JSON output, and comprehensive test suites
- CLI-Hub v0.2.0 supports public CLIs from multiple install sources (pip, npm, brew, system tools)
- Each pip-installed CLI automatically exposes its SKILL.md path in the REPL banner for agent discovery
- Refine command performs gap analysis between software capabilities and CLI coverage for iterative improvement
