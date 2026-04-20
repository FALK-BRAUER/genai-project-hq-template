# Memory

- **Type:** MCP Server
- **Package:** `@modelcontextprotocol/server-memory`
- **Scope:** Global
- **Status:** Active

## What It Does

Persistent knowledge graph that survives across sessions. Stores entities, observations, and relations.

## Tools Exposed

| Tool | Description |
|------|-------------|
| `create_entities` | Create new entities in the knowledge graph |
| `create_relations` | Create relations between entities |
| `add_observations` | Add observations to existing entities |
| `delete_entities` | Delete entities |
| `delete_observations` | Delete observations from entities |
| `delete_relations` | Delete relations |
| `open_nodes` | Open specific nodes by name |
| `read_graph` | Read the entire knowledge graph |
| `search_nodes` | Search nodes by query |

## Configuration

```json
{
  "memory": {
    "type": "stdio",
    "command": "npx",
    "args": ["-y", "@modelcontextprotocol/server-memory"],
    "env": {}
  }
}
```

**Environment variables:** None.

## When to Use

Project decisions, learned patterns, cross-session context that CLAUDE.md is too static for. Architecture decisions, tech stack choices, naming conventions.

## Tips & Gotchas

- Memory persists in `~/.claude/memory/` — back it up
- Claude Code also has its own file-based auto-memory system (MEMORY.md) — use that for most session-to-session persistence
- This MCP is better for structured entity-relationship data

## Installed In

| Location | Config Path |
|----------|-------------|
| Global | `global-config/claude-code/mcp-servers.json` |
