# Perplexity

- **Type:** MCP Server
- **Package:** `@perplexity-ai/mcp-server` (npx)
- **Scope:** OpenCode only (not in Claude Code)
- **Status:** Active (API key configured in OpenCode)
- **Source:** Official — perplexityai/modelcontextprotocol (2049 stars)

## What It Does

Connects OpenCode to Perplexity's search and reasoning capabilities. Returns cited, real-time web results. Four distinct tools covering search, conversational AI, deep research, and reasoning — each backed by a different Perplexity model.

## Tools Exposed

| Tool | Model | Description |
|------|-------|-------------|
| `perplexity_search` | sonar | Direct web search. Returns ranked results with titles, URLs, snippets. |
| `perplexity_ask` | sonar-pro | Conversational AI with real-time web search. Best for quick factual queries. |
| `perplexity_research` | sonar-deep-research | Deep research with citations. Best for blog post research and reports. |
| `perplexity_reason` | sonar-reasoning-pro | Step-by-step reasoning for complex analysis and decisions. |

## Configuration

```json
{
  "mcp": {
    "perplexity": {
      "type": "stdio",
      "command": "npx",
      "args": ["-y", "@perplexity-ai/mcp-server"],
      "env": {
        "PERPLEXITY_API_KEY": "your_key_here"
      }
    }
  }
}
```

**Environment variables:** `PERPLEXITY_API_KEY` — get from console.perplexity.ai

## When to Use

- Blog post research requiring cited sources
- Current events and news context for posts
- Deep research on AI/tech topics (use `perplexity_research`)
- Any query where source attribution matters
- Consulting deliverables that reference current market data

## Tips & Gotchas

- `perplexity_research` is the right tool for blog research — it returns citable sources
- Costs per query — don't use for things built-in web search handles fine
- Replaces the need for Brave Search MCP in OpenCode context
- Pairs with ArXiv: Perplexity for industry/news, ArXiv for academic papers

## Installed In

| Location | Config Path |
|----------|-------------|
| Global (OpenCode) | `~/.config/opencode/opencode.json` |
