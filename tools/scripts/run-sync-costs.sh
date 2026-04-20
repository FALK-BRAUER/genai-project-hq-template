#!/bin/bash
# run-sync-costs.sh — Daily cost sync across all projects
# Runs via launchd at 06:00 local time
set -euo pipefail

source "$(dirname "$0")/env.sh"

TRACKER="$HQ_DIR/tools/cost-tracker"
PROMPTS="$HQ_DIR/tools/prompts"
DATE=$(date +%Y-%m-%d)
LOG="$HQ_DIR/tools/logs/sync-costs-$DATE.log"

mkdir -p "$HQ_DIR/tools/logs"
echo "[$DATE $(date +%H:%M)] Starting cost sync" | tee -a "$LOG"

cd "$TRACKER"

# Date range: last 3 days (overlap ensures no gaps between runs)
SINCE=$(date -v-3d +%Y-%m-%d 2>/dev/null || date -d "3 days ago" +%Y-%m-%d)
SINCE_GMAIL=$(date -v-3d +%Y/%m/%d 2>/dev/null || date -d "3 days ago" +%Y/%m/%d)

# 1. Pull from billing APIs (yesterday's data)
echo "[$DATE] Syncing billing APIs..." | tee -a "$LOG"
bun sync-costs.ts >> "$LOG" 2>&1 || echo "WARNING: sync-costs.ts failed" | tee -a "$LOG"

# 2. Collect billing emails via Gmail MCP (direct — faster than Thunderbird/Supabase path)
echo "[$DATE] Collecting Gmail billing emails since $SINCE..." | tee -a "$LOG"

# Build prompt with date substituted
PROMPT=$(sed -e "s|\\\$SINCE_DATE|$SINCE|g" -e "s|\\\$SINCE_DATE_GMAIL|$SINCE_GMAIL|g" "$PROMPTS/collect-gmail-costs.md")

# Run headless Claude session — outputs JSON array of billing emails
echo "[$DATE] Parsing Gmail billing emails..." | tee -a "$LOG"
claude --print \
  --output-format text \
  --model claude-haiku-4-5-20251001 \
  --max-budget-usd 0.50 \
  --dangerously-skip-permissions \
  "$PROMPT" 2>>"$LOG" \
  | sed '/^```/d' \
  | bun parse-gmail-billing.ts --input /dev/stdin --since "$SINCE" >> "$LOG" 2>&1 \
  || echo "WARNING: Gmail billing collection/parse failed" | tee -a "$LOG"

echo "[$DATE $(date +%H:%M)] Cost sync complete" | tee -a "$LOG"

# 3. Print 3-day summary to log
bun report.ts --days 3 >> "$LOG" 2>&1 || true
