# Explain Code

- **Type:** Skill
- **Command:** `/explain-code`
- **Source:** Custom (global)
- **Scope:** Global + hq project
- **Status:** Active

## What It Does
Explains code using analogies, ASCII diagrams, step-by-step walkthroughs, and gotcha highlights. Tailors depth to audience and uses a consistent four-part structure: Analogy, Diagram, Walkthrough, Gotcha.

## Usage
```
/explain-code <file, function, or code block>
```
Point it at a file, function, or paste a code block and ask "how does this work".

## Triggers
- "How does this work"
- "Explain this"
- "Walk me through"
- Onboarding onto unfamiliar code
- Preparing explanations for others

## Tips & Gotchas
- Start high-level, then zoom in -- don't lead with implementation details.
- If the code is complex, the explanation breaks into layers (data flow, control flow, error handling).
- Uses actual variable/function names from the code in explanations.
- Also available as a hq project-level skill (identical behavior).

## Installed In
| Location | Path |
|----------|------|
| Global skills | `~/.claude/skills/explain-code/SKILL.md` |
| hq project skills | `~/hq/.claude/skills/` (inherits global) |
