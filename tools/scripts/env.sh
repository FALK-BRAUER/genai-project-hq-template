#!/bin/bash
# env.sh — Shared environment for launchd-triggered scripts
# Source this at the top of every scheduled script:
#   source "$(dirname "$0")/env.sh"
#
# launchd runs with minimal PATH — this adds Homebrew, nvm, claude, etc.
# Adjust the paths below to match your local setup.

# Adjust to your Node.js version (run: node --version)
NODE_VERSION="v22.0.0"

export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$HOME/.local/bin:$HOME/.nvm/versions/node/$NODE_VERSION/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

# Anthropic API key — stored in macOS Keychain:
#   security add-generic-password -a "$USER" -s ANTHROPIC_API_KEY_HQ -w "sk-ant-..."
export ANTHROPIC_API_KEY=$(security find-generic-password -a "$USER" -s ANTHROPIC_API_KEY_HQ -w 2>/dev/null)

# Root of this repo — scripts use $HQ_DIR to reference logs, prompts, etc.
export HQ_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
