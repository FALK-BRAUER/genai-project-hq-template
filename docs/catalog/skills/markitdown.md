# Markitdown

- **Type:** Skill (Library)
- **Command:** N/A (loaded contextually)
- **Source:** hq library
- **Scope:** Library — available globally
- **Category:** Task
- **Status:** Active

## What It Does
Convert documents (PDF, DOCX, HTML, images) to clean markdown. Follows a four-step workflow: identify input format, convert to markdown (PDF via markitdown CLI/Python, DOCX by parsing XML structure, HTML by stripping tags, images via OCR or description), clean up (fix heading hierarchy, normalize lists, remove artifacts like page numbers, preserve tables), and output as .md with source document attribution.

## Used By
| Project | How Loaded |
|---------|------------|
| All projects | Available globally as a library skill |

## Tips & Gotchas
- Fix heading hierarchy during cleanup -- do not jump from H1 to H4.
- Remove PDF artifacts (page numbers, headers/footers) during conversion.
- Preserve tables as markdown tables rather than converting to plain text.
- Always note the source document in the output file.
