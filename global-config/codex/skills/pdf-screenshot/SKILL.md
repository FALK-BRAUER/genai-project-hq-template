---
name: pdf-screenshot
description: Render PDF pages as PNG images for visual analysis. Use when PDFs have charts, tables, diagrams, or complex layouts that text extraction misses. Requires poppler (pdftoppm).
---

## Purpose

Built-in PDF readers extract text but lose visual layout — charts, diagrams, formatted tables, images, and multi-column layouts. This skill renders PDF pages as PNG images so vision can analyze the actual visual content.

## Prerequisites

- `pdftoppm` from poppler: `brew install poppler` (macOS) or `apt install poppler-utils` (Linux)

## Workflow

### 1. Render Pages to PNG

```bash
# Single page (page 3)
pdftoppm -png -f 3 -l 3 -r 200 input.pdf /tmp/pdf-page

# Range of pages (pages 1-5)
pdftoppm -png -f 1 -l 5 -r 200 input.pdf /tmp/pdf-pages

# All pages (use cautiously on large PDFs)
pdftoppm -png -r 200 input.pdf /tmp/pdf-all
```

**Resolution guide:**
- `-r 150` — fast, good for text-heavy pages
- `-r 200` — balanced (default recommendation)
- `-r 300` — high quality, needed for small text or detailed charts

### 2. Read the Images

View the generated PNG files. Vision will analyze the visual content including:
- Charts and graphs (values, trends, labels)
- Tables with complex formatting
- Diagrams and flowcharts
- Scanned documents (OCR-like reading)
- Multi-column layouts

### 3. Clean Up

```bash
rm /tmp/pdf-page*.png
```

## When to Use

- PDF has charts, graphs, or data visualizations
- PDF has complex table layouts that text extraction garbles
- PDF is a scanned document (image-based, no selectable text)
- PDF has diagrams, flowcharts, or architectural drawings
- You need to see the exact visual layout (contracts with formatting, reports with headers/footers)

## When NOT to Use

- PDF is text-only with simple formatting — use the built-in PDF reader instead
- You only need a few specific data points — use built-in reader with page ranges
- PDF is 100+ pages — render only the pages you need, not all

## Tips

- Always specify page ranges (`-f` and `-l`) for large PDFs
- For SEC filings (10-K, 10-Q): render the financial statements pages, use text reader for the narrative
- Combine approaches: text extraction for searchable content + screenshots for visual pages
- Output files are named `{prefix}-{page}.png` (e.g., `/tmp/pdf-page-03.png`)
