#!/bin/bash
# notify-telegram.sh — Send Telegram notification via Keychain-stored credentials
source "$(dirname "$0")/env.sh"
# Usage:
#   notify-telegram.sh <keychain-account> <message> [--silent]
#
# Examples:
#   notify-telegram.sh my-project "Daily brief complete — 2 new signals"
#   notify-telegram.sh vibe-hq "❌ Reference refresh failed"
#   notify-telegram.sh vibe-hq "Config drift — 3 stale projects" --silent
#
# Keychain keys (per account):
#   {ACCOUNT}_TELEGRAM_BOT_TOKEN   (e.g. FINTRACK_TELEGRAM_BOT_TOKEN)
#   {ACCOUNT}_TELEGRAM_CHAT_ID     (e.g. FINTRACK_TELEGRAM_CHAT_ID)
#
# --silent flag sets disable_notification: true (message arrives, phone doesn't buzz)

set -euo pipefail

ACCOUNT="${1:?Usage: notify-telegram.sh <keychain-account> <message> [--silent]}"
MESSAGE="${2:?Usage: notify-telegram.sh <keychain-account> <message> [--silent]}"
SILENT="${3:-}"

# Derive Keychain service names
# Remove hyphens before uppercasing (my-project → MYPROJECT, hq → HQ)
UPPER_ACCOUNT=$(echo "$ACCOUNT" | tr -d '-' | tr '[:lower:]' '[:upper:]')
TOKEN_KEY="${UPPER_ACCOUNT}_TELEGRAM_BOT_TOKEN"
CHAT_KEY="${UPPER_ACCOUNT}_TELEGRAM_CHAT_ID"

# Read from Keychain
TOKEN=$(security find-generic-password -a "$ACCOUNT" -s "$TOKEN_KEY" -w 2>/dev/null) || {
  echo "ERROR: Could not read $TOKEN_KEY from Keychain (account: $ACCOUNT)" >&2
  exit 1
}
CHAT_ID=$(security find-generic-password -a "$ACCOUNT" -s "$CHAT_KEY" -w 2>/dev/null) || {
  echo "ERROR: Could not read $CHAT_KEY from Keychain (account: $ACCOUNT)" >&2
  exit 1
}

# Quiet hours: 22:00-08:00 local → auto-silent (unless already explicit)
if [ -z "$SILENT" ]; then
  HOUR=$(TZ=${TZ:-UTC} date +%H)
  if [ "$HOUR" -ge 22 ] || [ "$HOUR" -lt 8 ]; then
    SILENT="--silent"
  fi
fi

DISABLE_NOTIFICATION="false"
[ "$SILENT" = "--silent" ] && DISABLE_NOTIFICATION="true"

# Add timestamp
TIMESTAMP=$(TZ=${TZ:-UTC} date '+%Y-%m-%d %H:%M local')
FULL_MESSAGE="${MESSAGE}

⏰ ${TIMESTAMP}"

# Send — use python3 for safe JSON encoding of the message
PAYLOAD=$(python3 -c "
import json, sys
msg = sys.stdin.read()
print(json.dumps({
    'chat_id': '${CHAT_ID}',
    'text': msg,
    'parse_mode': 'Markdown',
    'disable_notification': True if '${DISABLE_NOTIFICATION}' == 'true' else False
}))
" <<< "$FULL_MESSAGE")

RESPONSE=$(curl -s -X POST "https://api.telegram.org/bot${TOKEN}/sendMessage" \
  -H "Content-Type: application/json" \
  -d "$PAYLOAD")

# Check response
OK=$(echo "$RESPONSE" | python3 -c "import sys,json; print(json.load(sys.stdin).get('ok', False))" 2>/dev/null)
if [ "$OK" != "True" ]; then
  echo "ERROR: Telegram API failed: $RESPONSE" >&2
  exit 1
fi
