# Code Review

- **Type:** Plugin
- **Package:** `code-review@claude-plugins-official`
- **Source:** claude-plugins-official marketplace
- **Scope:** Global
- **Status:** Active

## What It Does

Automated PR code review using multiple specialized agents with confidence-based scoring to filter false positives. Launches 5 parallel agents that independently audit changes: CLAUDE.md compliance, shallow bug scan, git blame/history context, prior PR comment analysis, and code comment compliance. Each finding is scored 0-100 for confidence; only issues scoring 80+ are posted as a GitHub PR comment.

## Commands Provided

| Command | Description |
|---------|-------------|
| `/code-review:code-review` | Run automated multi-agent code review on the current PR |

## Tips & Gotchas

- Automatically skips closed PRs, drafts, trivial/automated PRs, and PRs already reviewed.
- Requires `gh` CLI installed and authenticated. Uses `gh` (not web fetch) for all GitHub interaction.
- Maintain clear CLAUDE.md files for better compliance checking -- vague guidelines produce weaker reviews.
- Does not run build, typecheck, or lint steps; assumes CI handles those separately.
- False positives filtered: pre-existing issues, linter-catchable problems, pedantic nitpicks, issues on unmodified lines, and items with lint-ignore comments.
- Confidence threshold (default 80) is adjustable in `commands/code-review.md`.
- Code links in the review comment require full SHA and `#L` line range notation to render correctly on GitHub.
- Author: Boris Cherny (Anthropic).
