# PAL (Prompt Augmented LLM)

- **Type:** MCP Server
- **Package:** `git+https://github.com/BeehiveInnovations/pal-mcp-server.git`
- **Scope:** Global
- **Status:** Active

## What It Does

Multi-model AI gateway. Routes prompts to different LLMs (Qwen, Gemini, etc.) for second opinions, code review, planning, debugging, and consensus building. When no model is specified, use `listmodels` first to pick the best one.

## Tools Exposed

| Tool | Description |
|------|-------------|
| `apilookup` | Look up API documentation |
| `challenge` | Challenge an approach — get a contrarian view |
| `chat` | Chat with a specific model |
| `clink` | Generate context links |
| `codereview` | Code review via external model |
| `consensus` | Get consensus across multiple models |
| `debug` | Debug assistance from external model |
| `listmodels` | List available models |
| `planner` | Planning assistance |
| `precommit` | Pre-commit review |
| `thinkdeep` | Deep thinking / reasoning |
| `version` | Get PAL version |

**Disabled tools:** `analyze`, `refactor`, `testgen`, `secaudit`, `docgen`, `tracer` (overlaps with Claude Code built-ins).

## Configuration

```json
{
  "pal": {
    "type": "stdio",
    "command": "bash",
    "args": ["-c", "for p in $(which uvx 2>/dev/null) ..."],
    "env": {
      "CUSTOM_API_KEY": "${ALIBABA_CODING_PLAN_KEY}",
      "CUSTOM_API_URL": "https://dashscope-intl.aliyuncs.com/compatible-mode/v1",
      "CUSTOM_MODEL_NAME": "qwen3.5-plus",
      "GEMINI_API_KEY": "${GEMINI_API_KEY}",
      "DISABLED_TOOLS": "analyze,refactor,testgen,secaudit,docgen,tracer",
      "DEFAULT_MODEL": "auto"
    }
  }
}
```

**Environment variables:**
- `ALIBABA_CODING_PLAN_KEY` — DashScope API key (stored in env, not committed)
- `GEMINI_API_KEY` — Google Gemini API key
- `CUSTOM_MODELS_CONFIG_PATH` — points to `global-config/pal/custom_models.json`

## When to Use

- **Second opinion:** `challenge` or `consensus` when unsure about an approach
- **Code review:** `codereview` for external model review before PR
- **Deep reasoning:** `thinkdeep` for complex architectural decisions
- **Model-specific tasks:** `chat` with a named model when you want a specific LLM

## Tips & Gotchas

- When user names a specific model (e.g., "use chat with gpt5"), pass that exact model name
- When no model is mentioned, call `listmodels` first to pick the best one
- Requires `uvx` (Python package runner) — installed via `pipx` or Homebrew
- `custom_models.json` must register models for resolution to work

## When to Use for Blog Work

- **`challenge`** — get a contrarian view on a claim before publishing ("is this actually true?")
- **`consensus`** — verify star counts, repo activity, tool adoption across multiple models
- **`thinkdeep`** — reason through whether an argument holds up under scrutiny

## Installed In

| Location | Config Path |
|----------|-------------|
| Global (Claude Code) | `~/.claude.json` |
| Global (OpenCode) | `~/.config/opencode/opencode.json` |
