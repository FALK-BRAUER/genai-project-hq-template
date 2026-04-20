---
description: Fetch CI logs and fix failing pipeline
allowed-tools: Bash(gh *), Read, Write, Edit, Bash(npm:*), Bash(npx:*)
---

Find and fix the latest CI failure.

1. Get the latest CI run: `gh run list --limit 1`.
2. If it failed, fetch the failure logs: `gh run view {id} --log-failed`.
3. Analyze the failure — common causes:
   - Test failures: read the test, understand the assertion, fix the code or test.
   - Lint errors: run the linter locally and fix.
   - Build errors: check types, missing imports, dependency issues.
   - Timeout: check for infinite loops, missing async/await, slow queries.
4. Fix the issue locally.
5. Run the relevant check locally to verify the fix.
6. Report what was wrong and what you fixed.

Don't just suppress the error. Fix the root cause.
