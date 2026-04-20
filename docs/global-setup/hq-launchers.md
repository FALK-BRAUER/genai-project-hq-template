# HQ Launchers — Reference

*Shell scripts in `~/bin/` that spin up multi-project AI coding sessions.*

Both scripts auto-discover projects from `~/projects/` + `~/hq`. Each opens one pane per project and launches the AI agent inside it. `AWS-Development-Environment` is excluded.

---

## `hqi` — iTerm2 + Claude Code

Vertical split panes with 10 distinct dark color themes per project. Uses hybrid AppleScript (System Events for splits, iTerm API for commands). Launches `claude --dangerously-skip-permissions --dangerously-load-development-channels server:claude-peers`.

```bash
hqi
```

## `hqo` — tmux + OpenCode

Tiled matrix layout in tmux. Pass `-wide` for horizontal layout. Uses bash as tmux shell (avoids zsh security issues).

```bash
hqo          # tiled grid
hqo -wide    # horizontal strips
```
