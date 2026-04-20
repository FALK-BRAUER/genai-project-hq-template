---
url: https://github.com/Dicklesworthstone/claude_code_agent_farm
stars: 782
last_checked: 2026-04-15
last_commit: 2025-12-18
category: agent-orchestration
status: active
---
# claude_code_agent_farm

> Orchestration framework for running 20+ Claude Code agents in parallel: automated bug fixing, best-practices sweeps, lock-based coordination, and real-time tmux monitoring.

## What's Inside
- Parallel processing: run 20-50 Claude Code agents simultaneously in tmux panes
- Multiple workflows: bug fixing, best practices implementation, cooperating agents coordination
- Agent coordination: lock-based system prevents conflicts between parallel agents
- Multi-stack support: 34 technology stacks (Next.js, Python, Rust, Go, Java, Angular, Flutter, C++, Solana, etc.)
- Smart monitoring: real-time dashboard with context warnings, heartbeat tracking, tmux pane titles
- Auto-recovery: automatically restarts agents with adaptive idle timeout
- Context management: agents auto-clear context when nearing limits, Ctrl+R broadcasts /clear to all
- Settings backup/restore: automatic timestamped backups with 200MB rotation
- File locking: prevents concurrent Claude launches that could corrupt settings
- HTML run reports: comprehensive single-file reports with agent performance stats
- Cooperating agents mode: distributed coordination protocol with active work registry and completed work log

## Stack
- Python 3.13+, uv package manager
- tmux (terminal multiplexing)
- Claude Code CLI
- git, direnv (optional)

## File Tree (key paths)
```
claude_code_agent_farm/
├── claude_code_agent_farm.py (main orchestrator)
├── view_agents.sh (tmux viewer utility)
├── setup.sh (automated setup)
├── configs/ (34 tech stack configs)
├── prompts/ (37 prompts: bug fixing, best practices, cooperating agents)
├── best_practices_guides/ (31 guides)
├── tool_setup_scripts/ (24 setup scripts)
├── pyproject.toml
└── .envrc
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: no
- Hooks: no

## Notable
- Hidden monitor-only mode for external dashboards
- Context reset macro (Ctrl+R) broadcasts to all agents
- Exponential backoff for restart loops (10s initial, 5min max)
- Agent Farm state written to `.claude_agent_farm_state.json` for external monitoring
