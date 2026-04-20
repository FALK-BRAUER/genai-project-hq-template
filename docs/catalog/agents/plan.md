# Plan

- **Type:** Agent
- **Subagent Type:** `plan`
- **Scope:** Global (built-in)
- **Status:** Active

## What It Does
Software architect agent. Explores the codebase to design implementation plans with step-by-step instructions. Identifies critical files, dependencies, and potential risks. Read-only -- produces a plan but does not execute it.

## Tools Available
Read, Glob, Grep, Bash (read-only commands).

Explicitly excluded: Agent, ExitPlanMode, Edit, Write, NotebookEdit.

## When to Use
- Designing a feature before writing code
- Breaking a large task into ordered steps
- Identifying which files need to change and why
- Architecture decisions that touch 3+ files

## When NOT to Use
- When you already know what to do and just need to execute
- Trivial changes (rename a variable, fix a typo)
- When the task is purely exploratory with no planned output
