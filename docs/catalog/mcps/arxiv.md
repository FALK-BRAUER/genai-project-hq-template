# ArXiv

- **Type:** MCP Server
- **Package:** `arxiv-mcp-server` (Python, via `uv tool run`)
- **Scope:** OpenCode only (not in Claude Code)
- **Status:** Active
- **Source:** blazickjp/arxiv-mcp-server (2440 stars, Apache 2.0)

## What It Does

Bridges OpenCode to arXiv's research paper repository. Search, download, and read academic papers directly in context. Papers are cached locally for fast re-access. Includes a deep-paper-analysis research prompt for systematic paper evaluation.

## Tools Exposed

| Tool | Description |
|------|-------------|
| `search_papers` | Query arXiv with filters for date ranges and categories (cs.AI, cs.LG, etc.) |
| `download_paper` | Download a paper by arXiv ID to local cache |
| `read_paper` | Access content of a downloaded paper |
| `list_papers` | View all papers in local cache |

## Configuration

```json
{
  "mcp": {
    "arxiv": {
      "type": "stdio",
      "command": "uv",
      "args": [
        "tool",
        "run",
        "arxiv-mcp-server",
        "--storage-path",
        "$HOME/.config/opencode/mcp-storage/arxiv"
      ]
    }
  }
}
```

**Environment variables:** None

## When to Use

- AI/tech blog posts that reference research papers
- Validating claims about model performance or architecture
- Consulting work requiring academic citations
- Checking if a technique has published benchmarks before recommending it

## Tips & Gotchas

- Filter by `cs.AI` or `cs.LG` to stay in scope for your-project content
- Papers cached at `~/.config/opencode/mcp-storage/arxiv` — no re-download needed per session
- Use `deep-paper-analysis` prompt for structured paper breakdowns
- Pairs with Perplexity: ArXiv for academic citations, Perplexity for industry/news

## Installed In

| Location | Config Path |
|----------|-------------|
| Global (OpenCode) | `~/.config/opencode/opencode.json` |
