---
description: Move project to archived state
allowed-tools: Read, Write, Bash(mv:*), Bash(git:*)
argument-hint: <project-name>
---

Archive a project — move it from active to archived status.

1. Verify `registry/active/$ARGUMENTS.md` exists
2. Move registry entry: `registry/active/$ARGUMENTS.md` → `registry/archived/$ARGUMENTS.md`
3. Update the registry entry with archive date and reason
4. Pull any final learnings from the project before archiving
5. Report: project archived, learnings captured
