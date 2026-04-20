# claude-aliases.sh — Managed by vibe-hq (global-config/shell/)
# Source this from ~/.zshrc. Edit here, deploy with install-global.sh.

# clp — single Claude window with claude-peers + remote control
alias clp="claude --dangerously-skip-permissions --channels server:claude-peers --remote-control"

# hqi — iTerm2 split-pane launcher for all projects (uses --dangerously-load-development-channels for push delivery)
alias hqi="$HOME/vibe-hq/global-config/shell/hqi"

# HQ session management
alias hq-exit="tmux kill-session -t hq"
alias hq-detach="tmux detach-client -t hq"
alias hq-attach="tmux attach-session -t hq"
