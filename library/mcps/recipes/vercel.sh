#!/bin/bash
# Install Vercel MCP Server (project scope) — Claude Code + OpenCode
# Requires: VERCEL_TOKEN environment variable
set -euo pipefail
source "$(dirname "$0")/../opencode-mcp-helper.sh"

if [ -z "${VERCEL_TOKEN:-}" ]; then
  echo "Error: VERCEL_TOKEN not set. Get one from https://vercel.com/account/tokens"
  exit 1
fi

# Claude Code
claude mcp add --scope project vercel -e VERCEL_TOKEN="$VERCEL_TOKEN" -- \
  npx -y @vercel/mcp
echo "✅ Claude Code: Vercel MCP installed"

# OpenCode
add_opencode_mcp "vercel" \
  '["npx", "-y", "@vercel/mcp"]' \
  "{\"VERCEL_TOKEN\": \"$VERCEL_TOKEN\"}"
