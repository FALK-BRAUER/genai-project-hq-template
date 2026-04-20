# PR Review Toolkit

- **Type:** Plugin
- **Package:** `pr-review-toolkit@claude-plugins-official`
- **Source:** claude-plugins-official marketplace
- **Scope:** Global
- **Status:** Active

## What It Does

Comprehensive PR review using 6 specialized agents that each focus on a different aspect of code quality. Can run agents individually (triggered by natural language) or together via the `/review-pr` command. Agents analyze git diff by default and return actionable findings with file:line references, prioritized by severity.

## Commands Provided

| Command | Description |
|---------|-------------|
| `/pr-review-toolkit:review-pr` | Run comprehensive PR review with all or selected agents. Args: `[aspects] [parallel]` |

## Specialized Agents

| Agent | Focus |
|-------|-------|
| `code-reviewer` | CLAUDE.md compliance, bug detection, general code quality |
| `silent-failure-hunter` | Silent failures in catch blocks, inadequate error handling, missing error logging |
| `code-simplifier` | Code clarity, unnecessary complexity, redundant abstractions (runs on Opus) |
| `pr-test-analyzer` | Behavioral test coverage, critical gaps, test quality and resilience |
| `type-design-analyzer` | Type encapsulation, invariant expression, type usefulness (rated 1-10 per dimension) |
| `comment-analyzer` | Comment accuracy vs actual code, documentation completeness, comment rot |

## Tips & Gotchas

- Specify review aspects to run only relevant agents: `/pr-review-toolkit:review-pr tests errors`.
- Agents also trigger automatically from natural language (e.g., "check for silent failures" triggers silent-failure-hunter).
- Recommended workflow: code-reviewer first, then targeted agents, then code-simplifier last as a polish pass.
- Results are aggregated into Critical / Important / Suggestions / Strengths categories.
- Re-run targeted reviews after fixing issues to verify resolution.
- Author: Daisy (Anthropic).
