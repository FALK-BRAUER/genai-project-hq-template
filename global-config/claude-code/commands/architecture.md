---
description: Regenerate or update ARCHITECTURE.md from current codebase
allowed-tools: Read, Bash(find:*), Bash(grep:*)
argument-hint: [full|update|check]
---

Based on $ARGUMENTS:

**full** (or no argument): Regenerate ARCHITECTURE.md completely by scanning the codebase.
Use the architect agent. Analyze: directory structure, package.json,
database schemas, route definitions, component files. Generate all
Mermaid diagrams from scratch.

**update**: Read existing ARCHITECTURE.md, compare with current code,
update only the sections that are stale.

**check**: Compare ARCHITECTURE.md against current code and report
what's out of sync — don't make any changes.
