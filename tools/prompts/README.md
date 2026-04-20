# tools/prompts/

Headless Claude prompts run via `claude -p` in launchd jobs and shell scripts.

Each `.md` file is a self-contained prompt passed to `claude --print`. Designed to be piped: output is parsed by downstream scripts.

- `collect-gmail-costs.md` — search Gmail for billing emails, output JSON array
- `learning-harvest.md` — extract learnings from recent handoffs
- `refresh-references.md` — update reference library entries
- `toolkit-scout.md` — scan for new tools worth evaluating
