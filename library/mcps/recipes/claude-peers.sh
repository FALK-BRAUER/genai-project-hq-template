#!/bin/bash
# Install claude-peers MCP (global scope) — enables Claude Code instances to
# discover each other and exchange messages on the same machine.
# Repo: https://github.com/louislva/claude-peers-mcp
# Requires: Node.js 18+
set -euo pipefail

claude mcp add --scope user claude-peers -- npx -y claude-peers-mcp
echo "✅ claude-peers MCP installed (global scope)"
echo ""
echo "Each Claude Code session now registers itself on startup."
echo "Use mcp__claude-peers__list_peers to discover running sessions,"
echo "and mcp__claude-peers__send_message to send messages between them."
