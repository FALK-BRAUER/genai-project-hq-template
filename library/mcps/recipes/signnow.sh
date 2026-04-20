#!/bin/bash
# Install SignNow MCP Server (project scope) — Claude Code only
# Requires: SIGNNOW_API_BASIC_TOKEN, SIGNNOW_USER_EMAIL, SIGNNOW_PASSWORD
# Store credentials in macOS Keychain before running:
#   security add-generic-password -a signnow -s SIGNNOW_API_BASIC_TOKEN -w "<token>" -U
#   security add-generic-password -a signnow -s SIGNNOW_USER_EMAIL -w "<email>" -U
#   security add-generic-password -a signnow -s SIGNNOW_PASSWORD -w "<password>" -U
set -euo pipefail

# Retrieve from Keychain
API_TOKEN=$(security find-generic-password -s "SIGNNOW_API_BASIC_TOKEN" -w 2>/dev/null) || {
  echo "Error: SIGNNOW_API_BASIC_TOKEN not found in Keychain"
  echo "Add it: security add-generic-password -a signnow -s SIGNNOW_API_BASIC_TOKEN -w '<token>' -U"
  exit 1
}

USER_EMAIL=$(security find-generic-password -s "SIGNNOW_USER_EMAIL" -w 2>/dev/null) || {
  echo "Error: SIGNNOW_USER_EMAIL not found in Keychain"
  echo "Add it: security add-generic-password -a signnow -s SIGNNOW_USER_EMAIL -w '<email>' -U"
  exit 1
}

PASSWORD=$(security find-generic-password -s "SIGNNOW_PASSWORD" -w 2>/dev/null) || {
  echo "Error: SIGNNOW_PASSWORD not found in Keychain"
  echo "Add it: security add-generic-password -a signnow -s SIGNNOW_PASSWORD -w '<password>' -U"
  exit 1
}

PROJECT_DIR="$HOME/Library/CloudStorage/GoogleDrive-YOUR_EMAIL/My Drive"

# Update .mcp.json — merge signnow into existing config
MCP_FILE="$PROJECT_DIR/.mcp.json"
if [ -f "$MCP_FILE" ]; then
  # Merge with existing config using python
  python3 -c "
import json, sys
with open('$MCP_FILE') as f:
    config = json.load(f)
config['mcpServers']['signnow'] = {
    'command': 'uvx',
    'args': ['--from', 'signnow-mcp-server', 'sn-mcp', 'serve'],
    'env': {
        'SIGNNOW_API_BASIC_TOKEN': '$API_TOKEN',
        'SIGNNOW_USER_EMAIL': '$USER_EMAIL',
        'SIGNNOW_PASSWORD': '$PASSWORD'
    }
}
with open('$MCP_FILE', 'w') as f:
    json.dump(config, f, indent=2)
"
else
  echo "Error: $MCP_FILE not found"
  exit 1
fi

echo "✅ Claude Code: SignNow MCP installed in $MCP_FILE"
echo "   Restart Claude Code session to pick up the new config."
