# Handoff

- **Type:** Skill
- **Command:** `/handoff`
- **Source:** Custom (global)
- **Scope:** Global + hq project
- **Status:** Active

## What It Does
Generates a structured handoff document capturing session state, decisions, remaining work, and context for the next session. Creates a `HANDOFF-{name}.md` file in the project root that is fully self-contained and readable without conversation history.

## Usage
```
/handoff <feature-or-task-name>
```
Produces `HANDOFF-{feature-name}.md` with sections: What We Did, Decisions Made, Current State, What's Left, Context That Matters, Files Changed.

## Triggers
- Before running `/clear`
- When ending a work session
- When switching tasks
- When context window is getting large
- Explicit `/handoff` invocation

## Tips & Gotchas
- Be specific. "Fixed the auth flow" is useless. "Added JWT refresh token rotation in `src/auth/tokens.ts`, tested with expired token scenario" is useful.
- Include failing test output or error messages if work is incomplete.
- The handoff must be self-contained -- readable without the conversation history.
- Runs `git diff --stat` to populate the Files Changed section accurately.
- Also available as a hq project-level skill (identical behavior).

## Installed In
| Location | Path |
|----------|------|
| Global skills | `~/.claude/skills/handoff/SKILL.md` |
| hq project skills | `~/hq/.claude/skills/` (inherits global) |
