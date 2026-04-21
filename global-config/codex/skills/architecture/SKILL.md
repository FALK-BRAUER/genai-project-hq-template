---
name: architecture
description: >
  Maintains ARCHITECTURE.md with accurate Mermaid diagrams. Use before starting
  feature work (to check consistency with current structure), after completing
  features (to update diagrams), or when adding new modules, routes, data models,
  or components. Also use when onboarding onto a codebase and no ARCHITECTURE.md
  exists yet.
---

## Core Workflow

1. **Check for ARCHITECTURE.md** — Read the file at project root. If missing, generate from scratch. If present, compare with current code state.
2. **Detect affected diagrams** — Based on recent changes or planned work, identify which diagrams need attention:
   - New directories/modules → System Overview (flowchart)
   - Schema changes → Data Model (erDiagram)
   - New routes/endpoints → API Route Map (flowchart)
   - New auth/business flows → User Flows (sequenceDiagram)
   - Component additions → Component Tree (graph)
3. **Update only what changed** — Never regenerate diagrams that are still accurate. Never delete diagrams for modules that still exist.
4. **Commit alongside code** — When invoked after a feature, stage ARCHITECTURE.md with the same commit as the feature changes.

## Scanning Approach

Inline (Codex has no subagents). For a multi-diagram update:

1. Walk the repo with `find` / `rg` to enumerate modules, routes, schemas, and components.
2. For each affected diagram, read the relevant source files (not every file — only what the diagram represents).
3. Produce or patch the Mermaid block. Keep the diff minimal — edit existing blocks, don't rewrite them wholesale.
4. Render Mermaid mentally to sanity-check node count and arrow direction before writing.

## Rules

- Use `flowchart TB` for system overviews
- Use `erDiagram` for data models
- Use `sequenceDiagram` for user flows
- Use `flowchart LR` for API route maps
- Keep diagrams readable — max 15–20 nodes. Split complex systems.
- Add a brief comment above each diagram explaining what it shows.
- Before starting feature work: read ARCHITECTURE.md to confirm the planned change is consistent with existing structure. Flag inconsistencies to the user before coding.
- After completing feature work: update diagrams affected by the change and include ARCHITECTURE.md in the commit.

## When NOT to run

- Trivial changes (typo fixes, comment edits, single-function refactors). Diagrams don't need updating.
- Changes scoped entirely inside an existing module with no structural impact.
