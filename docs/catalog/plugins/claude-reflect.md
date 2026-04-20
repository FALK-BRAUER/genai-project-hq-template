# Claude Reflect

- **Type:** Plugin
- **Package:** `claude-reflect@claude-reflect-marketplace`
- **Source:** bayramannakov/claude-reflect
- **Scope:** Global
- **Status:** Active
- **Version:** 2.6.0

## What It Does

Self-learning system that captures corrections during Claude Code sessions and discovers workflow patterns. When you correct Claude ("no, use X not Y"), hooks automatically detect and queue the correction. Running `/reflect` reviews queued learnings and syncs approved ones to CLAUDE.md (global and project-level) and AGENTS.md. Also discovers repeating workflow patterns across sessions and generates reusable skill files.

## Commands Provided

| Command | Description |
|---------|-------------|
| `/claude-reflect:reflect` | Process queued learnings with human review. Flags: `--scan-history`, `--dry-run`, `--targets`, `--review`, `--dedupe`, `--include-tool-errors` |
| `/claude-reflect:reflect-skills` | Discover skill candidates from repeating session patterns. Flags: `--days N`, `--project <path>`, `--all-projects`, `--dry-run` |
| `/claude-reflect:view-queue` | View pending learnings without processing |
| `/claude-reflect:skip-reflect` | Discard all queued learnings |

## Tips & Gotchas

- First run: use `/reflect --scan-history` to capture corrections from all past sessions before installation.
- Uses hybrid detection: regex patterns for real-time capture, AI semantic validation during `/reflect` for accuracy and multi-language support.
- Each learning gets a confidence score (0.60-0.95). Duplicate detection prevents redundant CLAUDE.md entries.
- Corrections made during a skill (e.g., `/deploy`) can be routed back to the skill file itself, making skills smarter over time.
- Run `/reflect --dedupe` periodically to consolidate semantically similar CLAUDE.md entries.
- Run `/reflect-skills --days 30` monthly to find automation opportunities from repeating patterns.
- Syncs to: `~/.claude/CLAUDE.md` (global), `./CLAUDE.md` (project), subdirectory CLAUDE.md files, `.claude/commands/*.md` (skills), and `AGENTS.md`.
- Extend session retention in `~/.claude/settings.json` with `"cleanupPeriodDays": 99999` to preserve history for scan and skill discovery.
- Requires Python 3.6+. Fully supported on macOS, Linux, and Windows.
