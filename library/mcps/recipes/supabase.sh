#!/bin/bash
# Install Supabase MCP Server (project scope) — Claude Code + OpenCode
# Requires: SUPABASE_URL and SUPABASE_SERVICE_KEY environment variables
set -euo pipefail
source "$(dirname "$0")/../opencode-mcp-helper.sh"

if [ -z "${SUPABASE_URL:-}" ] || [ -z "${SUPABASE_SERVICE_KEY:-}" ]; then
  echo "Error: SUPABASE_URL and SUPABASE_SERVICE_KEY must be set"
  echo "Get them from: https://app.supabase.com/project/_/settings/api"
  exit 1
fi

# Claude Code
claude mcp add --scope project supabase \
  -e SUPABASE_URL="$SUPABASE_URL" \
  -e SUPABASE_SERVICE_KEY="$SUPABASE_SERVICE_KEY" -- \
  npx -y supabase-mcp
echo "✅ Claude Code: Supabase MCP installed"

# OpenCode
add_opencode_mcp "supabase" \
  '["npx", "-y", "supabase-mcp"]' \
  "{\"SUPABASE_URL\": \"$SUPABASE_URL\", \"SUPABASE_SERVICE_KEY\": \"$SUPABASE_SERVICE_KEY\"}"
