#!/bin/bash
# run-heartbeat.sh — Check that all scheduled jobs ran as expected
# Runs daily, checks for missing/stale log files and launchd failures
source "$(dirname "$0")/env.sh"
set -euo pipefail

DATE=$(date +%Y-%m-%d)
YESTERDAY=$(date -v-1d +%Y-%m-%d)
DOW=$(date +%u)  # 1=Mon, 7=Sun
LOG="$HQ_DIR/tools/logs/heartbeat-$DATE.log"
NOTIFY="$HQ_DIR/tools/scripts/notify-telegram.sh"
CREATE_ISSUE="$HQ_DIR/tools/scripts/create-issue.sh"
ISSUES=""
ISSUE_COUNT=0

mkdir -p "$HQ_DIR/tools/logs"

echo "[$DATE] Heartbeat check" | tee "$LOG"

flag() {
  ISSUE_COUNT=$((ISSUE_COUNT + 1))
  ISSUES="${ISSUES}\n• $1"
  echo "  ⚠️ $1" | tee -a "$LOG"
}

info() {
  echo "  ✅ $1" | tee -a "$LOG"
}

# --- Auto-commit: commit dirty repos before checks run ---
# Reads all paths from registry/active/*.md + this repo itself.
# Skips non-git dirs (iCloud, Google Drive, etc).
# Registry mismatches (Last Activity date) are also fixed here.

auto_commit_repo() {
  local dir name
  dir="${1/#\~/$HOME}"
  name="$2"

  [ -d "$dir/.git" ] || return 0

  # Fix registry Last Activity date if stale
  local reg_file="$HQ_DIR/registry/active/${name}.md"
  if [ -f "$reg_file" ]; then
    local actual_date
    actual_date=$(git -C "$dir" log -1 --format=%cs 2>/dev/null || true)
    if [ -n "$actual_date" ]; then
      local recorded_date
      recorded_date=$(grep -oE '\*\*Last Activity:\*\* [0-9-]+' "$reg_file" | grep -oE '[0-9-]+' || true)
      if [ -n "$recorded_date" ] && [ "$actual_date" != "$recorded_date" ]; then
        sed -i '' "s/\*\*Last Activity:\*\* ${recorded_date}/**Last Activity:** ${actual_date}/" "$reg_file"
        info "registry: updated $name Last Activity ($recorded_date → $actual_date)"
      fi
    fi
  fi

  # Check for uncommitted changes (tracked modified + untracked)
  local has_changes=0
  git -C "$dir" diff --quiet 2>/dev/null || has_changes=1
  git -C "$dir" diff --cached --quiet 2>/dev/null || has_changes=1
  [ -z "$(git -C "$dir" ls-files --others --exclude-standard 2>/dev/null)" ] || has_changes=1

  if [ "$has_changes" -eq 1 ]; then
    git -C "$dir" add -A
    git -C "$dir" commit -m "chore: auto-commit unattended changes ($DATE)" --quiet
    git -C "$dir" push --quiet 2>/dev/null || true
    info "auto-committed $name"
  fi
}

# Collect all project paths from registry
REGISTRY_DIR="$HQ_DIR/registry/active"
while IFS= read -r reg_file; do
  proj_name=$(basename "$reg_file" .md)
  proj_path=$(grep -oE '\*\*Path:\*\* [^ ]+' "$reg_file" | sed 's/\*\*Path:\*\* //' || true)
  [ -n "$proj_path" ] && auto_commit_repo "$proj_path" "$proj_name"
done < <(ls "$REGISTRY_DIR"/*.md 2>/dev/null)

# Commit this repo itself last (picks up any registry fixes above)
auto_commit_repo "$HQ_DIR" "hq"

# --- Check daily jobs ran yesterday ---

# config-drift (daily)
if [ ! -f "$HQ_DIR/tools/logs/config-drift-$YESTERDAY.log" ]; then
  flag "config-drift did not run yesterday ($YESTERDAY)"
fi

# learning-harvest (daily)
if [ ! -f "$HQ_DIR/tools/logs/learning-harvest-$YESTERDAY.log" ]; then
  flag "learning-harvest did not run yesterday ($YESTERDAY)"
fi

# refresh-references (daily)
if [ ! -f "$HQ_DIR/tools/logs/refresh-references-$YESTERDAY.log" ]; then
  flag "refresh-references did not run yesterday ($YESTERDAY)"
fi

# --- Check weekly jobs (only on the day after they should run) ---

# doctor runs Monday — check on Tuesday (DOW=2)
if [ "$DOW" -eq 2 ]; then
  if [ ! -f "$HQ_DIR/tools/logs/doctor-$YESTERDAY.log" ]; then
    flag "doctor did not run yesterday (Monday)"
  fi
fi

# toolkit-scout runs Sunday — check on Monday (DOW=1)
if [ "$DOW" -eq 1 ]; then
  if [ ! -f "$HQ_DIR/tools/logs/toolkit-scout-$YESTERDAY.log" ]; then
    flag "toolkit-scout did not run yesterday (Sunday)"
  fi
fi

# --- Check launchd status for HQ jobs ---
# Adjust these job names to match your launchd plist Label fields
for job in com.hq.config-drift com.hq.doctor com.hq.toolkit-scout com.hq.learning-harvest com.hq.refresh-references com.hq.heartbeat; do
  STATUS=$(launchctl list "$job" 2>&1) || true
  if echo "$STATUS" | grep -q "Could not find"; then
    flag "$job not loaded in launchd"
  else
    LAST_EXIT=$(echo "$STATUS" | grep '"LastExitStatus"' | sed 's/[^0-9]//g')
    if [ -n "$LAST_EXIT" ] && [ "$LAST_EXIT" != "0" ]; then
      flag "$job last exit code: $LAST_EXIT"
    fi
  fi
done

# --- Scan yesterday's logs for errors ---
echo "" | tee -a "$LOG"
echo "Scanning logs for errors..." | tee -a "$LOG"

DAILY_LOGS=(
  "$HQ_DIR/tools/logs/config-drift-$YESTERDAY.log"
  "$HQ_DIR/tools/logs/learning-harvest-$YESTERDAY.log"
  "$HQ_DIR/tools/logs/refresh-references-$YESTERDAY.log"
)

[ "$DOW" -eq 2 ] && DAILY_LOGS+=("$HQ_DIR/tools/logs/doctor-$YESTERDAY.log")
[ "$DOW" -eq 1 ] && DAILY_LOGS+=("$HQ_DIR/tools/logs/toolkit-scout-$YESTERDAY.log")

for logfile in "${DAILY_LOGS[@]}"; do
  if [ -f "$logfile" ]; then
    JOBNAME=$(basename "$logfile" | sed "s/-$YESTERDAY.log//")
    ERROR_LINES=$(grep -iE "error|fail|exception|traceback|fatal|panic|denied|refused|timeout" "$logfile" | grep -ivE "Errors: 0|Processed:.*Errors: 0" | tail -3)
    if [ -n "$ERROR_LINES" ]; then
      flag "$JOBNAME had errors:
$ERROR_LINES"
    fi
    LINE_COUNT=$(wc -l < "$logfile" | tr -d ' ')
    if [ "$LINE_COUNT" -lt 3 ]; then
      flag "$JOBNAME log suspiciously short ($LINE_COUNT lines)"
    fi
  fi
done

# --- Scan launchd stderr logs for unexpected output ---
for errlog in "$HQ_DIR/tools/logs/"*-launchd.log; do
  if [ -f "$errlog" ] && [ -s "$errlog" ]; then
    JOBNAME=$(basename "$errlog" | sed 's/-launchd.log//')
    [ "$JOBNAME" = "heartbeat" ] && continue
    MOD_DATE=$(stat -f %Sm -t %Y-%m-%d "$errlog")
    if [ "$MOD_DATE" = "$YESTERDAY" ] || [ "$MOD_DATE" = "$DATE" ]; then
      ERROR_LINES=$(grep -iE "error|fail|exception|traceback|fatal|panic|denied|refused|timeout|no such|not found|command not found" "$errlog" \
        | grep -ivE "Errors: 0|Processed:.*Errors: 0" | tail -3)
      if [ -n "$ERROR_LINES" ]; then
        flag "$JOBNAME launchd stderr:
$ERROR_LINES"
      fi
    fi
  fi
done

# --- Report ---
echo "" | tee -a "$LOG"
if [ "$ISSUE_COUNT" -gt 0 ]; then
  echo "[$DATE] $ISSUE_COUNT issue(s) found" | tee -a "$LOG"
  DETAILS=$(echo -e "$ISSUES")
  ISSUE_NUM=$("$CREATE_ISSUE" "Heartbeat: ${ISSUE_COUNT} issue(s) ($DATE)" "$DETAILS" "monitoring,auto-detected")
  "$NOTIFY" hq "**hq** · 💓 Heartbeat — ${ISSUE_COUNT} issue(s)
${DETAILS}

📋 $ISSUE_NUM"
else
  echo "[$DATE] All jobs healthy — silent" | tee -a "$LOG"
fi
