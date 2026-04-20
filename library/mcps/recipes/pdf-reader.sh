#!/bin/bash
# Install PDF Reader MCP Server (project scope) — Claude Code + OpenCode
# Fast parallel PDF processing — 5-10x faster than sequential
set -euo pipefail
source "$(dirname "$0")/../opencode-mcp-helper.sh"

# Claude Code
claude mcp add --scope project pdf-reader -- \
  npx -y @sylphx/pdf-reader-mcp
echo "✅ Claude Code: PDF Reader MCP installed"

# OpenCode
add_opencode_mcp "pdf-reader" \
  '["npx", "-y", "@sylphx/pdf-reader-mcp"]'
