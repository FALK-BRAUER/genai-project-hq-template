# branded-docs

**Category:** Business Operations
**Status:** Active
**Source:** Original (hq)
**Used By:** your-project-2-ventures

## Purpose

Generate branded your-project PDF documents — quotes, invoices, SOWs, proposals, timesheets, engagement letters. Uses HTML/CSS Jinja2 templates with WeasyPrint renderer, matching the official timesheet brand format (logo header, teal divider, company footer).

## Location

`library/skills/business-ops/branded-docs/`

## Dependencies

- Python venv: `tools/branded-docs-env/` (weasyprint, jinja2)
- System: `pango` via Homebrew
- Related: `contracts` skill (content), `solo-ops` skill (content), `document-edit` MCP (read/write PDFs)

## Templates

| Template | Document Type |
|----------|--------------|
| `quote` | Client quotations |
| `invoice` | Invoices with payment details |
| `sow` | Statements of Work |
| `proposal` | Client proposals |
| `timesheet` | Weekly time logs |
| `engagement-letter` | Engagement letters |

## Usage

```bash
branded-docs-env/bin/python3 render.py --template <name> --data <data.json> --output <output.pdf>
```

See `SKILL.md` for full data field reference and examples.
