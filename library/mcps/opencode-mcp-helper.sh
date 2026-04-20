#!/bin/bash
# opencode-mcp-helper.sh — Add an MCP entry to .opencode/opencode.json
# Usage: source this file, then call add_opencode_mcp "name" "command_json" ["env_json"]
#
# Example:
#   source "$(dirname "$0")/opencode-mcp-helper.sh"
#   add_opencode_mcp "postgres" \
#     '["npx", "-y", "@modelcontextprotocol/server-postgres"]' \
#     "{\"DATABASE_URL\": \"$DATABASE_URL\"}"

add_opencode_mcp() {
  local name="$1"
  local command_json="$2"
  local env_json="${3:-}"
  local config=".opencode/opencode.json"

  mkdir -p .opencode

  python3 -c "
import json, os

config_path = '$config'
name = '$name'
command = json.loads('$command_json')
env = json.loads('${env_json:-{}}') if '${env_json}' else {}

if os.path.exists(config_path):
    with open(config_path) as f:
        cfg = json.load(f)
else:
    cfg = {'\$schema': 'https://opencode.ai/config.json'}

cfg.setdefault('mcp', {})
entry = {'type': 'local', 'command': command}
if env:
    entry['environment'] = env
cfg['mcp'][name] = entry

with open(config_path, 'w') as f:
    json.dump(cfg, f, indent=2)
    f.write('\n')
"
  echo "✅ OpenCode: $name MCP added to $config"
}
