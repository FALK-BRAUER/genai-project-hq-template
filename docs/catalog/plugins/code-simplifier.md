# Code Simplifier

- **Type:** Plugin
- **Package:** `code-simplifier@claude-plugins-official`
- **Source:** claude-plugins-official marketplace
- **Scope:** Global
- **Status:** Active

## What It Does

Simplifies and refines code for clarity, consistency, and maintainability while preserving all functionality. Focuses on recently modified code unless instructed otherwise. Runs on Opus model. Reduces unnecessary complexity and nesting, eliminates redundant code and abstractions, improves naming, consolidates related logic, and removes obvious comments -- all while following project-specific CLAUDE.md standards.

## Commands Provided

| Command | Description |
|---------|-------------|
| `/code-simplifier:code-simplifier` | Simplify recently modified code for clarity and maintainability |

## Tips & Gotchas

- Preserves exact functionality -- only changes how code does something, never what it does.
- Avoids nested ternary operators; prefers switch statements or if/else chains for multiple conditions.
- Prioritizes readability over brevity -- explicit code over dense one-liners.
- Applies project-specific standards from CLAUDE.md (ES modules, `function` keyword over arrow functions, explicit return types, React Props types).
- Operates autonomously after code is written/modified; does not require explicit invocation.
- Also available as an agent within the pr-review-toolkit plugin for PR review workflows.
- Best used as a final polish pass after code review issues are addressed.
