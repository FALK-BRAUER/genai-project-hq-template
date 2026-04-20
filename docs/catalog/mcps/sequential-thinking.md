# Sequential Thinking

- **Type:** MCP Server
- **Package:** `@modelcontextprotocol/server-sequential-thinking`
- **Scope:** Global
- **Status:** Active

## What It Does

Forces step-by-step structured reasoning. Changes HOW Claude thinks, not WHAT it can access.

## Tools Exposed

| Tool | Description |
|------|-------------|
| `sequentialthinking` | Create a structured thought chain with step-by-step reasoning |

## Configuration

```json
{
  "sequential-thinking": {
    "type": "stdio",
    "command": "npx",
    "args": ["-y", "@modelcontextprotocol/server-sequential-thinking"],
    "env": {}
  }
}
```

**Environment variables:** None.

## When to Use

Architecture decisions, complex debugging, multi-step planning, any situation where Claude's first instinct might be wrong.

## Tips & Gotchas

- Mention "think step by step" or "use sequential thinking" to engage this deliberately
- Most useful for architecture and debugging, less useful for simple code generation

## Installed In

| Location | Config Path |
|----------|-------------|
| Global | `global-config/claude-code/mcp-servers.json` |
