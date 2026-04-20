# Context7

- **Type:** MCP Server
- **Package:** `@upstash/context7-mcp@latest`
- **Scope:** Global
- **Status:** Active

## What It Does

Fetches up-to-date, version-specific library documentation. Injects current APIs into the prompt so Claude doesn't hallucinate deprecated methods.

## Tools Exposed

| Tool | Description |
|------|-------------|
| `resolve-library-id` | Resolve a library name to its Context7 ID |
| `query-docs` | Query documentation for a specific library |

## Configuration

```json
{
  "context7": {
    "type": "stdio",
    "command": "npx",
    "args": ["-y", "@upstash/context7-mcp@latest"],
    "env": {}
  }
}
```

**Environment variables:** Optional API key from context7.com/dashboard for higher rate limits.

## When to Use

Every time you're working with a library or framework. Eliminates the #1 vibe coding failure: hallucinated deprecated APIs. Global CLAUDE.md rule: "Always use Context7 MCP when you need library/API documentation."

## Tips & Gotchas

- Add `use context7` to prompts, or rely on the global CLAUDE.md rule
- Remote HTTP option available (no npx needed): `claude mcp add --scope user --transport http context7 https://mcp.context7.com/mcp`

## Installed In

| Location | Config Path |
|----------|-------------|
| Global | `global-config/claude-code/mcp-servers.json` |
