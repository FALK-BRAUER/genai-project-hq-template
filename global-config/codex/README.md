# global-config/codex/

Configuration for the OpenAI Codex CLI tool (`~/.codex/`).

- `config.toml` — Codex config template; deploy to `~/.codex/config.toml`
- `skills/` — skill definitions; deploy each to `~/.codex/skills/<name>/SKILL.md`

## Deploy skills

```bash
for d in global-config/codex/skills/*/; do
  name=$(basename "$d")
  mkdir -p "$HOME/.codex/skills/$name"
  cp "$d/SKILL.md" "$HOME/.codex/skills/$name/SKILL.md"
done
```

## Alignment rule

Keep `skills/` in sync with `global-config/claude-code/skills/`. When a skill is added or updated in Claude Code, mirror it here. GSD is Claude Code-only (slash commands) — no Codex equivalent needed.
