# Playground

- **Type:** Plugin
- **Package:** `playground@claude-plugins-official`
- **Source:** claude-plugins-official marketplace
- **Scope:** Global
- **Status:** Active

## What It Does

Creates interactive HTML playgrounds -- self-contained single-file explorers with live preview. Each playground has interactive controls on one side, a live visual preview on the other, and a prompt output at the bottom with a copy button. The user adjusts controls, explores visually, then copies the generated prompt back into Claude. All CSS and JS are inlined with no external dependencies.

## Commands Provided

| Command | Description |
|---------|-------------|
| `/playground:playground` | Build an interactive HTML playground for the given topic |

## Built-in Templates

| Template | Use Case |
|----------|----------|
| `design-playground` | Visual design decisions (components, layouts, spacing, color, typography) |
| `data-explorer` | Data and query building (SQL, APIs, pipelines, regex) |
| `concept-map` | Learning and exploration (concept maps, knowledge gaps, scope mapping) |
| `document-critique` | Document review (suggestions with approve/reject/comment workflow) |
| `diff-review` | Code review (git diffs, commits, PRs with line-by-line commenting) |
| `code-map` | Codebase architecture (component relationships, data flow, layer diagrams) |

## Tips & Gotchas

- Prompt output should be natural language (not a value dump), mentioning only non-default choices.
- Every playground uses dark theme, system font for UI, monospace for code/values.
- Preview updates instantly on every control change -- no "Apply" button.
- Include 3-5 named presets that snap all controls to a cohesive combination.
- The generated HTML file is automatically opened in the default browser after creation.
- If a topic does not fit any template cleanly, the closest template is adapted.
