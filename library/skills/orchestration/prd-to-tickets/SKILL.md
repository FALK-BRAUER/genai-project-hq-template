---
name: prd-to-tickets
description: Break a PRD (Product Requirements Document) into implementation tickets with estimates and dependencies. Use when starting a new feature from a PRD or spec.
---

## Workflow

### 1. Parse the PRD
- Read the full PRD
- Extract: user stories, acceptance criteria, technical constraints, non-functional requirements

### 2. Identify Domains
- Group requirements by domain: data model, API, UI, auth, infrastructure
- Flag cross-cutting concerns: logging, error handling, performance

### 3. Break Into Tickets
For each logical unit of work, create a ticket:
- **Title**: verb + noun (e.g., "Add user registration endpoint")
- **Description**: what to build and why
- **Acceptance criteria**: testable conditions for "done"
- **Dependencies**: which tickets must complete first
- **Size**: S (< 2hrs), M (2-4hrs), L (4-8hrs), XL (> 8hrs, should be split)

### 4. Order by Dependencies
- Produce a dependency graph
- Identify the critical path
- Flag tickets that can be parallelized

### 5. Output
Write tickets as a markdown checklist with dependencies noted.
