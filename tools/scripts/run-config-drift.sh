#!/bin/bash
# run-config-drift.sh — Scan active code projects for config drift
# Checks: CLAUDE.md freshness, missing hooks, missing agents, stale configs
source "$(dirname "$0")/env.sh"
set -euo pipefail

DATE=$(date +%Y-%m-%d)
LOG="$HQ_DIR/tools/logs/config-drift-$DATE.log"
NOTIFY="$HQ_DIR/tools/scripts/notify-telegram.sh"
CREATE_ISSUE="$HQ_DIR/tools/scripts/create-issue.sh"
DRIFT_COUNT=0
DRIFT_DETAILS=""

mkdir -p "$HQ_DIR/tools/logs"

echo "[$DATE] Starting config drift scan" | tee "$LOG"

# Build project list from registry — reads Path: field from each registry entry
declare -a PROJECTS=()
while IFS= read -r reg_file; do
  proj_name=$(basename "$reg_file" .md)
  proj_path=$(grep -oE '\*\*Path:\*\* [^ ]+' "$reg_file" | sed 's/\*\*Path:\*\* //' | sed "s|~|$HOME|" || true)
  [ -n "$proj_path" ] && PROJECTS+=("${proj_path}|${proj_name}|custom")
done < <(ls "$HQ_DIR/registry/active/"*.md 2>/dev/null)

flag_drift() {
  local project="$1"
  local issue="$2"
  DRIFT_COUNT=$((DRIFT_COUNT + 1))
  DRIFT_DETAILS="${DRIFT_DETAILS}\n• ${project}: ${issue}"
  echo "  ⚠️  $project: $issue" | tee -a "$LOG"
}

for entry in "${PROJECTS[@]}"; do
  IFS='|' read -r path name template <<< "$entry"

  echo "[$DATE] Scanning $name ($path)" | tee -a "$LOG"

  # 1. Project directory exists?
  if [ ! -d "$path" ]; then
    flag_drift "$name" "Project directory missing: $path"
    continue
  fi

  # 2. CLAUDE.md exists?
  if [ ! -f "$path/CLAUDE.md" ]; then
    flag_drift "$name" "Missing CLAUDE.md"
  else
    # 3. CLAUDE.md freshness — warn if >30 days since last modified
    LAST_MOD=$(stat -f %m "$path/CLAUDE.md")
    NOW=$(date +%s)
    DAYS_OLD=$(( (NOW - LAST_MOD) / 86400 ))
    if [ "$DAYS_OLD" -gt 30 ]; then
      flag_drift "$name" "CLAUDE.md is ${DAYS_OLD} days old"
    fi
  fi

  # 4. .claude directory exists?
  if [ ! -d "$path/.claude" ]; then
    flag_drift "$name" "Missing .claude/ directory"
    continue
  fi

  # 5. Secret scanning hook — all code projects should have trufflehog
  if [ -f "$path/.claude/settings.json" ]; then
    if ! grep -q "trufflehog" "$path/.claude/settings.json"; then
      flag_drift "$name" "Missing trufflehog secret scanning hook"
    fi
  else
    flag_drift "$name" "Missing settings.json (no hooks configured)"
  fi

  # 6. settings.local.json — should exist for MCP/permissions config
  if [ ! -f "$path/.claude/settings.local.json" ]; then
    flag_drift "$name" "Missing settings.local.json"
  fi

  # 7. At least one agent defined?
  if [ -d "$path/.claude/agents" ]; then
    AGENT_COUNT=$(find "$path/.claude/agents" -name "*.md" | wc -l | tr -d ' ')
    if [ "$AGENT_COUNT" -eq 0 ]; then
      flag_drift "$name" "No agents defined"
    fi
  else
    flag_drift "$name" "No agents defined"
  fi

done

echo "" | tee -a "$LOG"
echo "[$DATE] Drift scan complete. Found $DRIFT_COUNT issue(s)." | tee -a "$LOG"

# Notify + create issue if drift found
if [ "$DRIFT_COUNT" -gt 0 ]; then
  DETAILS=$(echo -e "$DRIFT_DETAILS")
  ISSUE_NUM=$("$CREATE_ISSUE" "Config drift: ${DRIFT_COUNT} issue(s) ($DATE)" "$DETAILS" "monitoring,auto-detected")
  "$NOTIFY" hq "**hq** · ⚠️ Config Drift — ${DRIFT_COUNT} issue(s)
${DETAILS}

📋 $ISSUE_NUM"
else
  echo "[$DATE] No drift — silent" | tee -a "$LOG"
fi
