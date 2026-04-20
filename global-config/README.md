# global-config/

Source of truth for all tool configurations. Project configs derive from these — never edit project configs directly without updating here first.

- `claude-code/` — `settings.json` and `mcp-servers.json` for Claude Code CLI
- `opencode/` — MCP config for opencode
- `codex/` — OpenAI Codex CLI config
- `openclaw/` — openclaw agent config and vetted skills
- `gateway/` — AI gateway / proxy config
- `orchestration/` — multi-agent orchestration config
- `pal/` — PAL MCP custom models config
- `shell/` — shell aliases and helper scripts (`claude-aliases.sh`, `hqi`)
