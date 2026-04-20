#!/bin/bash
# Install Notion MCP Server (project scope) — Claude Code + OpenCode
# Requires: NOTION_TOKEN environment variable (internal integration token)
set -euo pipefail
source "$(dirname "$0")/../opencode-mcp-helper.sh"

if [ -z "${NOTION_TOKEN:-}" ]; then
  echo "Error: NOTION_TOKEN not set. Create an integration at https://www.notion.so/my-integrations"
  exit 1
fi

# Claude Code
claude mcp add --scope project notion -e NOTION_TOKEN="$NOTION_TOKEN" -- \
  npx -y @notionhq/mcp
echo "✅ Claude Code: Notion MCP installed"

# OpenCode
add_opencode_mcp "notion" \
  '["npx", "-y", "@notionhq/mcp"]' \
  "{\"NOTION_TOKEN\": \"$NOTION_TOKEN\"}"
