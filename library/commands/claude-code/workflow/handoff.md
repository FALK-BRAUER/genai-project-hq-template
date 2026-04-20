---
description: Write structured handoff document for session continuity
allowed-tools: Read, Write, Bash(git log:*), Bash(git diff:*)
---

Generate a handoff document capturing the current session state.

1. Review git log for recent changes: `git log --oneline -20`
2. Check for uncommitted work: `git diff --stat`
3. Read CLAUDE.md "Current Focus" section

Write HANDOFF-$ARGUMENTS.md (or HANDOFF-session.md if no argument) with:

## What We Did
[Summary of changes made this session]

## Decisions Made
[Key architectural or design decisions with rationale]

## Current State
[What works, what's partially done, what's broken]

## What's Left
[Remaining tasks, in priority order]

## Context That Matters
[Domain knowledge, gotchas, constraints the next session needs]

## Files Changed
[List of modified files with one-line descriptions]
