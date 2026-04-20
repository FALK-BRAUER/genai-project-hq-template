# PDF Screenshot

- **Type:** Skill
- **Command:** N/A (used contextually)
- **Source:** hq library
- **Scope:** Global
- **Category:** Task
- **Status:** Active

## What It Does

Renders PDF pages as PNG images using `pdftoppm` (poppler) so Claude's vision can analyze visual content — charts, diagrams, complex tables, scanned documents, and formatted layouts that text extraction misses.

## Usage

```bash
# Render pages 1-5 at 200 DPI
pdftoppm -png -f 1 -l 5 -r 200 input.pdf /tmp/pdf-pages
```

Then use Claude's Read tool on the resulting PNG files.

## Prerequisites

- `poppler` must be installed: `brew install poppler` (macOS) or `apt install poppler-utils` (Linux)

## When to Use

- PDFs with charts, graphs, or data visualizations
- Complex table layouts that text extraction garbles
- Scanned documents (image-based, no selectable text)
- Diagrams, flowcharts, architectural drawings
- When you need to see exact visual layout

## Tips & Gotchas

- Always specify page ranges for large PDFs — don't render all 200 pages
- `-r 200` is the sweet spot for most use cases
- Combine with text extraction: screenshots for visual pages, text for narrative
- Clean up temp files after analysis: `rm /tmp/pdf-page*.png`

## Installed In

| Location | Path |
|----------|------|
| Global | `~/.claude/skills/pdf-screenshot/SKILL.md` |
| Library | `library/skills/task/pdf-screenshot/SKILL.md` |
