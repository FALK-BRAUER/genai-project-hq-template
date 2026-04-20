---
name: markitdown
description: Convert documents (PDF, DOCX, HTML, images) to clean markdown. Use when ingesting external documents into the project.
---

## Workflow

### 1. Identify Input Format
Detect the file type from extension or content.

### 2. Convert to Markdown
- **PDF**: Use `markitdown` CLI or Python library to extract text and structure
- **DOCX**: Parse XML structure, preserve headings and lists
- **HTML**: Strip tags, preserve structure, convert links
- **Images**: Use OCR if text content, describe if visual

### 3. Clean Up
- Fix heading hierarchy (no jumping from H1 to H4)
- Normalize list formatting
- Remove artifacts (page numbers, headers/footers from PDFs)
- Preserve tables as markdown tables

### 4. Output
Save as `.md` file in the project with a note about the source document.
