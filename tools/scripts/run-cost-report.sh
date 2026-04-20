#!/bin/bash
# run-cost-report.sh — Weekly AI cost report → Telegram
# Runs via launchd: Sunday 18:00 local time
set -euo pipefail

source "$(dirname "$0")/env.sh"

TRACKER="$HQ_DIR/tools/cost-tracker"
PROMPTS="$HQ_DIR/tools/prompts"
DATE=$(date +%Y-%m-%d)
LOG="$HQ_DIR/tools/logs/cost-report-$DATE.log"

mkdir -p "$HQ_DIR/tools/logs"
echo "[$DATE $(date +%H:%M)] Starting weekly cost report" | tee -a "$LOG"

cd "$TRACKER"

# 1. Collect last 7 days of Gmail billing emails (direct, no Thunderbird dep)
SINCE=$(date -v-7d +%Y-%m-%d 2>/dev/null || date -d "7 days ago" +%Y-%m-%d)
SINCE_GMAIL=$(date -v-7d +%Y/%m/%d 2>/dev/null || date -d "7 days ago" +%Y/%m/%d)

echo "[$DATE] Collecting Gmail billing emails since $SINCE..." | tee -a "$LOG"

PROMPT=$(sed -e "s|\\\$SINCE_DATE|$SINCE|g" -e "s|\\\$SINCE_DATE_GMAIL|$SINCE_GMAIL|g" "$PROMPTS/collect-gmail-costs.md")

claude --print \
  --output-format text \
  --model claude-haiku-4-5-20251001 \
  --max-budget-usd 0.50 \
  --dangerously-skip-permissions \
  "$PROMPT" 2>>"$LOG" \
  | sed '/^```/d' \
  | bun parse-gmail-billing.ts --input /dev/stdin --since "$SINCE" >> "$LOG" 2>&1 \
  || echo "WARNING: Gmail billing collection/parse failed" | tee -a "$LOG"

# 2. Generate AI report and send to Telegram
echo "[$DATE] Generating AI cost report..." | tee -a "$LOG"
bun generate-cost-report.ts --days 7 >> "$LOG" 2>&1

echo "[$DATE $(date +%H:%M)] Cost report complete" | tee -a "$LOG"
