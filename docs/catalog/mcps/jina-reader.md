# Jina Reader

- **Type:** MCP Server
- **Package:** `mcp-remote` → `https://mcp.jina.ai/v1`
- **Scope:** Global
- **Status:** Active (configured in Claude Code global config)

## What It Does

Web page reading and content extraction. Converts web pages to clean, structured text for Claude to process.

## Tools Exposed

| Tool | Description |
|------|-------------|
| `read_url` | Read and extract content from a URL |
| `search_web` | Search the web for information |
| `search_arxiv` | Search arXiv for academic papers |
| `search_ssrn` | Search SSRN for finance/economics papers |
| `search_images` | Search for images online |
| `capture_screenshot_url` | Take a screenshot of a webpage |
| `classify_text` | Classify text into categories |
| `sort_by_relevance` | Rerank results by semantic relevance |

## Configuration

```json
{
  "jina-reader": {
    "type": "stdio",
    "command": "npx",
    "args": ["-y", "mcp-remote", "https://mcp.jina.ai/v1"],
    "env": {}
  }
}
```

**Environment variables:** None.

## When to Use

Reading web pages, extracting article content, parsing documentation from URLs.

## Tips & Gotchas

- Rich tool set: web search, URL reading, arXiv/SSRN search, image search, screenshots, text classification
- Also available as built-in `WebFetch` fallback if MCP connection drops
- Alternative direct API: `https://r.jina.ai/<url>`

## Installed In

| Location | Config Path |
|----------|-------------|
| Global | `global-config/claude-code/mcp-servers.json` |
