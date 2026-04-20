# Ralph Loop

- **Type:** Plugin
- **Package:** `ralph-loop@claude-plugins-official`
- **Source:** claude-plugins-official marketplace
- **Scope:** Global
- **Status:** Active

## What It Does

Implements the Ralph Wiggum iterative development technique inside Claude Code. Uses a Stop hook to intercept session exits, feeding the same prompt back repeatedly so Claude iterates on its own work. Each loop iteration sees previous file changes and git history, enabling autonomous refinement until a completion promise is met or max iterations reached. Based on Geoffrey Huntley's "Ralph is a Bash loop" methodology.

## Commands Provided

| Command | Description |
|---------|-------------|
| `/ralph-loop:ralph-loop` | Start a Ralph loop. Args: `"PROMPT" [--max-iterations N] [--completion-promise TEXT]` |
| `/ralph-loop:cancel-ralph` | Cancel an active Ralph loop (removes state file, reports iteration count) |
| `/ralph-loop:help` | Explain Ralph Loop concepts, commands, and usage examples |

## Tips & Gotchas

- Always set `--max-iterations` as a safety net to prevent infinite loops on impossible tasks.
- The completion promise uses exact string matching via `<promise>TEXT</promise>` tags -- you cannot use it for multiple completion conditions.
- Works by creating `.claude/.ralph-loop.local.md` state file; `/cancel-ralph` removes it.
- Best for well-defined tasks with clear success criteria and automatic verification (tests, linters). Not suited for tasks requiring human judgment.
- Prompt quality matters: include phased goals, self-correction steps, and explicit completion criteria.
- On Windows, the stop hook requires Git Bash -- WSL bash may not work. See README for workaround.
