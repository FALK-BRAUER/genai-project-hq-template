#!/bin/bash
# Install Firecrawl MCP Server (project scope) — Claude Code + OpenCode
# Requires: FIRECRAWL_API_KEY environment variable
set -euo pipefail
source "$(dirname "$0")/../opencode-mcp-helper.sh"

if [ -z "${FIRECRAWL_API_KEY:-}" ]; then
  echo "Error: FIRECRAWL_API_KEY not set. Get one from https://firecrawl.dev"
  exit 1
fi

# Claude Code
claude mcp add --scope project firecrawl -e FIRECRAWL_API_KEY="$FIRECRAWL_API_KEY" -- \
  npx -y firecrawl-mcp
echo "✅ Claude Code: Firecrawl MCP installed"

# OpenCode
add_opencode_mcp "firecrawl" \
  '["npx", "-y", "firecrawl-mcp"]' \
  "{\"FIRECRAWL_API_KEY\": \"$FIRECRAWL_API_KEY\"}"
