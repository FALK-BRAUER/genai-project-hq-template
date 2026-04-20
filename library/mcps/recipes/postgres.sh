#!/bin/bash
# Install PostgreSQL MCP Server (project scope) — Claude Code + OpenCode
# Requires: DATABASE_URL environment variable
# IMPORTANT: Use a read-only database user
set -euo pipefail
source "$(dirname "$0")/../opencode-mcp-helper.sh"

if [ -z "${DATABASE_URL:-}" ]; then
  echo "Error: DATABASE_URL not set."
  echo "Format: postgresql://user:password@host:port/database"
  exit 1
fi

# Claude Code
claude mcp add --scope project postgres -e DATABASE_URL="$DATABASE_URL" -- \
  npx -y @modelcontextprotocol/server-postgres
echo "✅ Claude Code: PostgreSQL MCP installed"

# OpenCode
add_opencode_mcp "postgres" \
  '["npx", "-y", "@modelcontextprotocol/server-postgres"]' \
  "{\"DATABASE_URL\": \"$DATABASE_URL\"}"
