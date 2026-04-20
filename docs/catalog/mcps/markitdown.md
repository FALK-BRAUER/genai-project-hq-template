# MarkItDown

- **Type:** MCP Server
- **Package:** `markitdown-mcp` (pip/uvx)
- **Source:** [microsoft/markitdown](https://github.com/microsoft/markitdown)
- **Scope:** Global
- **Status:** Active

## What It Does

Microsoft's open-source document-to-markdown converter exposed as an MCP server. Converts PDF, DOCX, XLSX, PPTX, HTML, images, audio, and more to clean Markdown that Claude can parse.

## Tools Exposed

| Tool | Description |
|------|-------------|
| `convert_to_markdown` | Convert any file or URL to Markdown. Accepts `http:`, `https:`, `file:`, and `data:` URIs. |

## Configuration

```json
{
  "markitdown": {
    "type": "stdio",
    "command": "uvx",
    "args": ["markitdown-mcp"],
    "env": {}
  }
}
```

**Environment variables:** None.

## Supported Formats

PDF, DOCX, XLSX, PPTX, HTML, XML, CSV, JSON, TXT, EPub, images (with optional LLM descriptions), audio (with optional transcription), ZIP archives, YouTube URLs.

## When to Use

- Ingesting external documents (contracts, reports, spreadsheets) into a project
- Converting uploaded files to Markdown for analysis
- Processing multiple document formats in a uniform way

## Tips & Gotchas

- PDF conversion is text-extraction only (~25% fidelity on image-heavy PDFs) — use the `pdf-screenshot` skill for visual PDFs
- DOCX and XLSX conversion is strong — preserves structure well
- For large PDFs, consider `pdf-reader-mcp` (parallel processing) instead
- Requires Python 3.10+ and `uvx`

## Installed In

| Location | Config Path |
|----------|-------------|
| Global | `global-config/claude-code/mcp-servers.json` + `~/.claude.json` |
