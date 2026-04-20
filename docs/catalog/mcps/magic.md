# Magic MCP (21st.dev)

- **Type:** MCP Server
- **Package:** `@21st-dev/magic-mcp@latest`
- **Source:** [21st-dev/magic-mcp](https://github.com/21st-dev/magic-mcp)
- **Scope:** Global
- **Status:** Active (configured in Claude Code global config)

## What It Does

AI-powered UI component generation. Describe a component in natural language and get production-ready code. Integrates with your project's design system.

## Tools Exposed

| Tool | Description |
|------|-------------|
| `generate_component` | Generate a UI component from a natural language description |

## Configuration

```json
{
  "magic": {
    "type": "stdio",
    "command": "npx",
    "args": ["-y", "@21st-dev/magic-mcp@latest"],
    "env": {
      "API_KEY": "${MAGIC_API_KEY}"
    }
  }
}
```

**Environment variables:** `MAGIC_API_KEY` — get from https://21st.dev/magic/console (free during beta).

## When to Use

Any frontend project where you need UI components generated from descriptions. Pairs with:
- **UI UX Pro Max** skill — design decisions (what to build)
- **Frontend Design** plugin — full page generation
- **Playground** plugin — interactive exploration

## Tips & Gotchas

- Free during beta period
- Configured and active in Claude Code global config
- API key stored as `MAGIC_API_KEY` environment variable

## Installed In

| Location | Config Path |
|----------|-------------|
| Global | `~/.claude.json` + `global-config/claude-code/mcp-servers.json` |
