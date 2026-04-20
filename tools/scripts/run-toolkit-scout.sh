#!/bin/bash
# run-toolkit-scout.sh — Weekly toolkit scout via Claude
source "$(dirname "$0")/env.sh"
set -euo pipefail

VIBE_HQ="$HQ_DIR"
DATE=$(date +%Y-%m-%d)
LOG="$VIBE_HQ/tools/logs/toolkit-scout-$DATE.log"
NOTIFY="$VIBE_HQ/tools/scripts/notify-telegram.sh"
CREATE_ISSUE="$VIBE_HQ/tools/scripts/create-issue.sh"

mkdir -p "$VIBE_HQ/tools/logs"

echo "[$DATE] Starting toolkit scout" | tee "$LOG"

cd "$VIBE_HQ"

claude --dangerously-skip-permissions -p "$(cat tools/prompts/toolkit-scout.md)" 2>&1 | tee -a "$LOG"
EXIT_CODE=${PIPESTATUS[0]}

echo "[$DATE] Scout complete" | tee -a "$LOG"

if [ "$EXIT_CODE" -ne 0 ]; then
  DETAILS=$(tail -5 "$LOG")
  "$CREATE_ISSUE" "Toolkit scout failed ($DATE)" "$DETAILS" "monitoring,auto-detected"
  "$NOTIFY" vibe-hq "**hq** · ❌ Toolkit scout failed

$DETAILS"
elif [ -f "$VIBE_HQ/tools/logs/scout-$DATE.md" ]; then
  if grep -q "## Nothing New" "$VIBE_HQ/tools/logs/scout-$DATE.md"; then
    echo "[$DATE] Nothing notable — silent" | tee -a "$LOG"
  else
    FINDS=$(grep -c "^### " "$VIBE_HQ/tools/logs/scout-$DATE.md" || true)
    "$NOTIFY" vibe-hq "**hq** · 🔭 Toolkit Scout — ${FINDS} find(s)

Check tools/logs/scout-$DATE.md"
  fi
fi
