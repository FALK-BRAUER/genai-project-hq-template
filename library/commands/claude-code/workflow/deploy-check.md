---
description: Pre-deployment checklist — verify everything before deploying
allowed-tools: Bash(npm:*), Bash(git:*), Read
---

Run pre-deployment checks:

1. **Tests pass:** `npm test`
2. **Lint clean:** `npm run lint`
3. **Type check:** `npx tsc --noEmit`
4. **Build succeeds:** `npm run build`
5. **No uncommitted changes:** `git status`
6. **On correct branch:** verify current branch
7. **Dependencies clean:** `npm audit --audit-level=high`
8. **Environment variables:** check .env.example vs actual env

Report as checklist. Block deployment if any critical check fails.
