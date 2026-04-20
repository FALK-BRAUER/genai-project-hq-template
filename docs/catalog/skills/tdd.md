# TDD

- **Type:** Skill (Library)
- **Command:** N/A (loaded contextually)
- **Source:** hq library
- **Scope:** Library — available globally
- **Category:** Orchestration
- **Status:** Active

## What It Does
Test-driven development workflow skill. Enforces the strict Red-Green-Refactor cycle: write a failing test that describes the desired behavior, write the minimum code to make it pass, clean up the code while keeping tests green, repeat. Includes test quality rules for naming, assertions, independence, and mocking boundaries.

## Used By
| Project | How Loaded |
|---------|------------|
| All projects | Available globally as a library skill |

## Tips & Gotchas
- Never write implementation code before writing the test. If you catch yourself doing it, stop and write the test first.
- Test names should describe behavior: "should return 404 when user not found".
- One assertion per test when possible.
- No test interdependencies -- each test must stand alone.
- Mock external boundaries (APIs, databases), not internal modules.
