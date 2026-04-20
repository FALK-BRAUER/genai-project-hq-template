# General Purpose

- **Type:** Agent
- **Subagent Type:** `general-purpose`
- **Scope:** Global (built-in)
- **Status:** Active

## What It Does
The default subagent. Handles research, code search, and multi-step tasks that don't fit a more specialized agent. It has access to the full tool suite, making it the most flexible but least focused option.

## Tools Available
All tools (Read, Write, Edit, Glob, Grep, Bash, Agent, and any MCP tools in scope).

## When to Use
- Multi-step tasks that span searching, reading, and editing
- General research across the codebase
- Tasks where no specialized agent is a clear fit
- Delegating subtasks from a parent agent

## When NOT to Use
- Tasks with a clear specialized agent (review, debug, refactor, git)
- Simple single-file reads or edits that don't need an agent at all
