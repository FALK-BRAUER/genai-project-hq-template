#!/bin/bash
# Install Document Edit MCP Server (project scope) — Claude Code + OpenCode
# Read + write PDF, Word, Excel documents
# Requires: Python 3.10+
set -euo pipefail
source "$(dirname "$0")/../opencode-mcp-helper.sh"

# Claude Code
claude mcp add --scope project document-edit -- \
  uvx --from document-edit-mcp document-edit-mcp
echo "✅ Claude Code: Document Edit MCP installed"

# OpenCode
add_opencode_mcp "document-edit" \
  '["uvx", "--from", "document-edit-mcp", "document-edit-mcp"]'
