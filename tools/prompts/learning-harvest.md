# Task: Daily Learning Harvest

You are syncing learnings from active projects back into hq.

## Instructions

1. **Check each active project** listed in `registry/active/` for changes since yesterday:
   - `~/projects/<project-name>/CLAUDE.md`

2. For each project, compare:
   - CLAUDE.md content vs what's documented in `registry/active/{project}.md`
   - `.claude/settings.json` hooks vs `library/hooks/`
   - `.claude/skills/` vs `library/skills/`
   - `.claude/agents/` vs `library/agents/`
   - `.claude/commands/` vs `library/commands/`

3. **Identify drift:**
   - New skills/agents/hooks in a project that aren't in the library → candidates for promotion
   - CLAUDE.md sections that changed → update registry entry
   - New MCPs configured → update registry entry

4. **Write findings** to `tools/logs/harvest-{today's date}.md`:

```markdown
# Learning Harvest — {date}

## Changes Detected
- {project}: {what changed}

## Promotion Candidates
- {skill/agent/hook}: found in {project}, not in library

## Registry Updates Needed
- {project}: {what's stale in registry}

## No Changes
(if nothing changed, just write this section)
```

5. Do NOT auto-promote or auto-update — just report. Human decides what to pull in.

6. Commit the log:
   ```
   git add tools/logs/harvest-*.md
   git commit -m "chore: daily learning harvest"
   git push
   ```

## Important
- Read-only for project repos — never write to them
- Only flag meaningful changes, not whitespace or formatting
- If a project has a new skill that's clearly project-specific (not reusable), skip it
- Do NOT run `git pull`, `git fetch`, or `git rebase` — this repo is local-only
