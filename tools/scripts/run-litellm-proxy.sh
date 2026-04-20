#!/bin/bash
# run-litellm-proxy.sh — Start LiteLLM proxy for local model routing
# Adjust paths below to match your LiteLLM installation and config location.
#
# If running on a separate user/machine, use the SSH wrapper pattern:
#   exec ssh -o BatchMode=yes user@host 'litellm --config /path/to/config.yaml --port 4000'

source "$(dirname "$0")/env.sh"

# Adjust to your LiteLLM binary and config locations
LITELLM_BIN="litellm"
LITELLM_CONFIG="$HOME/.config/litellm/config.yaml"

exec "$LITELLM_BIN" --config "$LITELLM_CONFIG" --port 4000
