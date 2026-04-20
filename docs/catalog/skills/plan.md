# Plan

- **Type:** Skill
- **Command:** `/plan`
- **Source:** Custom (global)
- **Scope:** Global + hq project
- **Status:** Active

## What It Does
Produces a structured execution plan before writing any code. Breaks tasks into ordered steps with file paths, dependencies, and verification criteria. Follows a four-phase workflow: Understand, Plan, Execute, Verify.

## Usage
```
/plan <task description>
```
Can also be invoked implicitly when Claude detects a multi-file task.

## Triggers
- Any task touching 3+ files
- Ambiguous or open-ended requests
- "Build a feature", "refactor", "design a system"
- Explicit `/plan` invocation

## Tips & Gotchas
- Plans must be concrete -- file paths, function names, specific changes -- not vague intentions.
- If the plan changes during execution, update it and note why.
- For large plans, break into phases that can each be verified independently.
- Plans that span multiple sessions are saved to `.claude/plans/{feature-name}.md`.
- Also available as a hq project-level skill (identical behavior).

## Installed In
| Location | Path |
|----------|------|
| Global skills | `~/.claude/skills/plan/SKILL.md` |
| hq project skills | `~/hq/.claude/skills/` (inherits global) |
