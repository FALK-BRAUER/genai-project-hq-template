---
name: handoff
description: >
  Generates a structured handoff document capturing session state, decisions,
  remaining work, and context for the next session. Use before /clear, when ending
  a work session, switching tasks, or when context window is getting large.
  Creates handoff document in the project's zz_handoffs/ directory.
allowed-tools: Read, Glob, Grep, Bash(git diff:*), Bash(git log:*), Bash(git status:*), Bash(mkdir:*), Write
effort: medium
---

## Handoff Document Format

Create `zz_handoffs/` directory if it doesn't exist, then write `zz_handoffs/{date}-{feature-name}.md`:

```bash
mkdir -p zz_handoffs
```

```markdown
# Handoff: {Feature/Task Name}
*{Date}*

## What We Did
[Summary of changes made this session — be specific about what was implemented]

## Decisions Made
[Key architectural or design decisions with rationale — the WHY matters most]

## Current State
- **Working:** [what's functional]
- **Partially done:** [what's in progress]
- **Broken:** [what needs fixing]

## What's Left
[Remaining tasks, in priority order. Be specific enough that someone can pick this up cold.]

## Context That Matters
[Domain knowledge, gotchas, constraints, non-obvious dependencies]

## Files Changed
[List of modified files with one-line descriptions of what changed in each]
```

## Rules

- Be specific. "Fixed the auth flow" is useless. "Added JWT refresh token rotation in `src/auth/tokens.ts`, tested with expired token scenario" is useful.
- Include failing test output or error messages if work is incomplete.
- The handoff must be self-contained — readable without the conversation history.
- Run `git diff --stat` to populate the Files Changed section accurately.
- Always write to `zz_handoffs/` directory, never project root. Create the directory if missing.
- Filename format: `{YYYY-MM-DD}-{feature-name}.md` (e.g. `2026-03-26-pal-integration.md`).
- Add `zz_handoffs/` to `.gitignore` if handoffs should stay local, or commit them if the team benefits from history.
