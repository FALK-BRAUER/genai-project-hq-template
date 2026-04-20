#!/bin/bash
# run-learning-harvest.sh — Daily learning harvest via Claude
source "$(dirname "$0")/env.sh"
set -euo pipefail

VIBE_HQ="$HQ_DIR"
DATE=$(date +%Y-%m-%d)
LOG="$VIBE_HQ/tools/logs/learning-harvest-$DATE.log"
NOTIFY="$VIBE_HQ/tools/scripts/notify-telegram.sh"
CREATE_ISSUE="$VIBE_HQ/tools/scripts/create-issue.sh"

mkdir -p "$VIBE_HQ/tools/logs"

echo "[$DATE] Starting learning harvest" | tee "$LOG"

cd "$VIBE_HQ"

claude --dangerously-skip-permissions -p "$(cat tools/prompts/learning-harvest.md)" 2>&1 | tee -a "$LOG"
EXIT_CODE=${PIPESTATUS[0]}

echo "[$DATE] Harvest complete" | tee -a "$LOG"

if [ "$EXIT_CODE" -ne 0 ]; then
  DETAILS=$(tail -5 "$LOG")
  "$CREATE_ISSUE" "Learning harvest failed ($DATE)" "$DETAILS" "monitoring,auto-detected"
  "$NOTIFY" vibe-hq "**hq** · ❌ Learning harvest failed

$DETAILS"
elif [ -f "$VIBE_HQ/tools/logs/harvest-$DATE.md" ]; then
  if grep -q "## No Changes" "$VIBE_HQ/tools/logs/harvest-$DATE.md"; then
    echo "[$DATE] No changes — silent" | tee -a "$LOG"
  else
    "$NOTIFY" vibe-hq "**hq** · 📥 Learning Harvest — drift detected

Check tools/logs/harvest-$DATE.md"
  fi
fi
