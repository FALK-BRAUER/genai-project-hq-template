# PRD to Tickets

- **Type:** Skill (Library)
- **Command:** N/A (loaded contextually)
- **Source:** hq library
- **Scope:** Library — available globally
- **Category:** Orchestration
- **Status:** Active

## What It Does
Break a PRD (Product Requirements Document) into implementation tickets with estimates and dependencies. Follows a five-step workflow: parse the PRD (extract user stories, acceptance criteria, technical constraints, non-functional requirements), identify domains (group by data model/API/UI/auth/infrastructure, flag cross-cutting concerns), break into tickets (title as verb+noun, description, acceptance criteria, dependencies, size S/M/L/XL), order by dependencies (produce dependency graph, identify critical path, flag parallelizable tickets), and output as a markdown checklist.

## Used By
| Project | How Loaded |
|---------|------------|
| All projects | Available globally as a library skill |

## Tips & Gotchas
- Tickets sized XL (>8 hours) should be split into smaller units.
- Always identify the critical path so you know what blocks everything else.
- Flag tickets that can be parallelized for maximum throughput.
- Include testable acceptance criteria on every ticket -- "done" must be verifiable.
