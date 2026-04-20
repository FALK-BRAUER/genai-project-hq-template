# OSP Marketing Tools

- **Type:** MCP Server
- **Package:** `osp_marketing_tools` (Python, via `uvx --from git+...`)
- **Scope:** OpenCode only (not in Claude Code)
- **Status:** Active
- **Source:** open-strategy-partners/osp_marketing_tools (official, CC BY-SA 4.0)

## What It Does

Implements Open Strategy Partners' B2B tech content methodology as MCP tools. Covers the full content lifecycle: product positioning, metadata generation, structured editing, writing guidance, and SEO optimization.

## Tools Exposed

| Tool | Description |
|------|-------------|
| OSP Product Value Map Generator | Product positioning: taglines, persona dev, feature categorization |
| OSP Meta Information Generator | Title (H1), meta title (50-60 chars), meta description (155-160 chars), URL slug |
| OSP Content Editing Codes | Structured review: scope, flow, style, word choice, grammar, technical accuracy |
| OSP Technical Writing Guide | Narrative structure, flow, style guidelines, content-type-specific guidance |
| OSP On-Page SEO Guide | Search intent alignment, keyword integration, structured data, performance metrics |

## Configuration

```json
{
  "mcp": {
    "osp-marketing-tools": {
      "type": "stdio",
      "command": "uvx",
      "args": [
        "--from",
        "git+https://github.com/open-strategy-partners/osp_marketing_tools@main",
        "osp_marketing_tools"
      ]
    }
  }
}
```

**Environment variables:** None

## When to Use

- Blog post editing: "Apply OSP editing codes to this draft"
- Ghost metadata generation: "Generate OSP meta for this post"
- SEO review before publishing
- Consulting report structure and quality review
- Any content where you need structured, actionable feedback (not vague suggestions)

## Tips & Gotchas

- The editing codes system gives specific before/after examples — much more useful than generic AI feedback
- Meta generator respects character limits that Ghost CMS actually needs
- Works well after a Perplexity research pass: research first, write, then OSP edit
- Source methodology is proven B2B tech content from a real agency — not AI-generated guidelines

## Installed In

| Location | Config Path |
|----------|-------------|
| Global (OpenCode) | `~/.config/opencode/opencode.json` |
