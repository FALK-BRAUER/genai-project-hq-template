---
description: Run tests with coverage and identify gaps
allowed-tools: Bash(npx vitest:*), Bash(npm test:*), Read
---

1. Run tests with coverage: `npx vitest run --coverage`
2. Analyze coverage report — identify files below 80% coverage
3. For each low-coverage file:
   - Read the file to understand what's untested
   - Identify critical paths that need tests
   - Suggest specific test cases to add
4. Summarize: overall coverage %, files needing attention, suggested tests
