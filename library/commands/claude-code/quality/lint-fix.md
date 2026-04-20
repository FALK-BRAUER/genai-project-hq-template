---
description: Auto-fix all lint errors
allowed-tools: Bash(npx eslint:*), Bash(npm run:*), Read
---

1. Run lint with auto-fix: `npx eslint . --fix`
2. Run Prettier: `npx prettier --write "**/*.{ts,tsx,css,json}"`
3. Check for remaining errors: `npx eslint .`
4. If errors remain, read the files and fix manually
5. Report: N errors auto-fixed, M remaining (with file:line details)
