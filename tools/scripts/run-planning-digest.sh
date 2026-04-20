#!/bin/bash
# run-planning-digest.sh — Daily digest of open planning tasks
# Scans planning docs for unchecked items, open questions, and active statuses
source "$(dirname "$0")/env.sh"
set -euo pipefail

VIBE_HQ="$HQ_DIR"
DATE=$(date +%Y-%m-%d)
LOG="$VIBE_HQ/tools/logs/planning-digest-$DATE.log"
NOTIFY="$VIBE_HQ/tools/scripts/notify-telegram.sh"

mkdir -p "$VIBE_HQ/tools/logs"

echo "[$DATE] Planning digest" | tee "$LOG"

# Count open tasks across planning docs (unchecked checkboxes)
OPEN_TASKS=0
TASK_SUMMARY=""

for doc in "$VIBE_HQ"/planning/*.md; do
  [ -f "$doc" ] || continue
  BASENAME=$(basename "$doc")
  COUNT=$(grep -c '^\- \[ \]' "$doc" 2>/dev/null || true)
  if [ "$COUNT" -gt 0 ]; then
    OPEN_TASKS=$((OPEN_TASKS + COUNT))
    TASK_SUMMARY="${TASK_SUMMARY}\n• ${BASENAME}: ${COUNT} open"
  fi
done

# Count open GitHub issues
GH_ISSUES=$(gh issue list --repo YOUR_GITHUB_USER/genai-project-hq-template --state open --json number --jq 'length' 2>/dev/null || echo "?")
GH_AUTO=$(gh issue list --repo YOUR_GITHUB_USER/genai-project-hq-template --state open --label auto-detected --json number --jq 'length' 2>/dev/null || echo "?")

# Count active planning docs (not archived)
PLANNING_COUNT=$(ls "$VIBE_HQ"/planning/*.md 2>/dev/null | wc -l | tr -d ' ')

echo "Open tasks: $OPEN_TASKS" | tee -a "$LOG"
echo "GitHub issues: $GH_ISSUES (auto: $GH_AUTO)" | tee -a "$LOG"
echo "Planning docs: $PLANNING_COUNT" | tee -a "$LOG"

# Always send — this is a morning digest
"$NOTIFY" vibe-hq "**hq** · 📋 Planning Digest

📝 ${OPEN_TASKS} open tasks across ${PLANNING_COUNT} planning docs
📌 ${GH_ISSUES} open GitHub issues (${GH_AUTO} auto-detected)
$(echo -e "$TASK_SUMMARY")"
