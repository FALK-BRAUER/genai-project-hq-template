#!/bin/bash
# run-doctor.sh — Weekly health check (scriptable version of /doctor)
# Checks tools, configs, MCPs, repo state, library, templates
source "$(dirname "$0")/env.sh"
set -euo pipefail

VIBE_HQ="$HQ_DIR"
DATE=$(date +%Y-%m-%d)
LOG="$VIBE_HQ/tools/logs/doctor-$DATE.log"
NOTIFY="$VIBE_HQ/tools/scripts/notify-telegram.sh"
CREATE_ISSUE="$VIBE_HQ/tools/scripts/create-issue.sh"
FAIL_COUNT=0
WARN_COUNT=0
ISSUES=""

mkdir -p "$VIBE_HQ/tools/logs"

echo "🩺 GenAI Project HQ Health Check — $DATE" | tee "$LOG"
echo "" | tee -a "$LOG"

fail() {
  FAIL_COUNT=$((FAIL_COUNT + 1))
  ISSUES="${ISSUES}\n❌ $1"
  echo "  ❌ $1" | tee -a "$LOG"
}

warn() {
  WARN_COUNT=$((WARN_COUNT + 1))
  ISSUES="${ISSUES}\n⚠️ $1"
  echo "  ⚠️ $1" | tee -a "$LOG"
}

pass() {
  echo "  ✅ $1" | tee -a "$LOG"
}

# 1. Core tools
echo "Core Tools:" | tee -a "$LOG"
for tool in node npm git gh claude docker; do
  if command -v "$tool" &>/dev/null; then
    pass "$tool $(command $tool --version 2>/dev/null | head -1 || echo 'ok')"
  else
    if [ "$tool" = "docker" ]; then
      warn "$tool not found (optional)"
    else
      fail "$tool not found"
    fi
  fi
done

# 2. Global Claude config
echo "" | tee -a "$LOG"
echo "Global Config:" | tee -a "$LOG"
[ -f "$HOME/.claude/CLAUDE.md" ] && pass "~/.claude/CLAUDE.md" || fail "~/.claude/CLAUDE.md missing"
[ -f "$HOME/.claude/settings.json" ] && pass "~/.claude/settings.json" || fail "~/.claude/settings.json missing"

for dir in agents commands skills; do
  COUNT=$(find "$HOME/.claude/$dir" -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
  if [ "$COUNT" -gt 0 ]; then
    pass "~/.claude/$dir/ ($COUNT files)"
  else
    warn "~/.claude/$dir/ empty or missing"
  fi
done

# 3. MCP servers
echo "" | tee -a "$LOG"
echo "MCP Config:" | tee -a "$LOG"
if [ -f "$HOME/.claude.json" ]; then
  for server in memory sequential-thinking context7 chrome-devtools filesystem github; do
    if grep -q "\"$server\"" "$HOME/.claude.json"; then
      pass "MCP: $server"
    else
      warn "MCP: $server not configured"
    fi
  done
else
  fail "~/.claude.json missing (no MCP servers)"
fi

# 4. Vibe HQ repo
echo "" | tee -a "$LOG"
echo "Vibe HQ Repo:" | tee -a "$LOG"
if [ -d "$VIBE_HQ/.git" ]; then
  BRANCH=$(git -C "$VIBE_HQ" branch --show-current)
  [ "$BRANCH" = "main" ] && pass "On main branch" || warn "On branch: $BRANCH"
else
  fail "$HQ_DIR is not a git repo"
fi

# 5. Library
echo "" | tee -a "$LOG"
echo "Library:" | tee -a "$LOG"
for dir in agents skills hooks mcps commands; do
  if [ -d "$VIBE_HQ/library/$dir" ]; then
    COUNT=$(find "$VIBE_HQ/library/$dir" -type f | wc -l | tr -d ' ')
    [ "$COUNT" -gt 0 ] && pass "library/$dir ($COUNT files)" || warn "library/$dir empty"
  else
    warn "library/$dir missing"
  fi
done

# 6. Templates
echo "" | tee -a "$LOG"
echo "Templates:" | tee -a "$LOG"
for tmpl in nextjs-app fastapi-service consulting-report; do
  MANIFEST="$VIBE_HQ/templates/$tmpl/manifest.json"
  if [ -f "$MANIFEST" ]; then
    if python3 -c "import json; json.load(open('$MANIFEST'))" 2>/dev/null; then
      pass "$tmpl/manifest.json valid"
    else
      fail "$tmpl/manifest.json invalid JSON"
    fi
  else
    warn "$tmpl/manifest.json missing"
  fi
done

# 7. Keychain secrets (Telegram bots)
echo "" | tee -a "$LOG"
echo "Keychain Secrets:" | tee -a "$LOG"
for account in hq; do  # add your project accounts here
  UPPER=$(echo "$account" | tr -d '-' | tr '[:lower:]' '[:upper:]')
  if security find-generic-password -a "$account" -s "${UPPER}_TELEGRAM_BOT_TOKEN" -w &>/dev/null; then
    pass "$account Telegram token"
  else
    warn "$account Telegram token missing"
  fi
done

# 8. README coverage — every non-hidden dir must have a README.md
echo "" | tee -a "$LOG"
echo "README Coverage:" | tee -a "$LOG"
README_MISSING=0
while IFS= read -r dir; do
  if [ ! -f "$dir/README.md" ]; then
    warn "Missing README.md: ${dir#$HOME/}"
    README_MISSING=$((README_MISSING + 1))
  fi
done < <(find "$VIBE_HQ" -mindepth 1 -maxdepth 2 -type d \
  ! -path '*/.git/*' ! -name '.git' \
  ! -path '*/.github/*' ! -name '.github' \
  ! -path '*/.claude/*' ! -name '.claude' \
  ! -path '*/node_modules/*' ! -name 'node_modules' \
  ! -path '*/logs/*' ! -name 'logs' \
  2>/dev/null | sort)
[ "$README_MISSING" -eq 0 ] && pass "All directories have README.md"

# Summary
echo "" | tee -a "$LOG"
TOTAL=$((FAIL_COUNT + WARN_COUNT))
if [ "$FAIL_COUNT" -gt 0 ]; then
  echo "Overall: ❌ $FAIL_COUNT failure(s), $WARN_COUNT warning(s)" | tee -a "$LOG"
  DETAILS=$(echo -e "$ISSUES")
  ISSUE_NUM=$("$CREATE_ISSUE" "Doctor: ${FAIL_COUNT} failure(s), ${WARN_COUNT} warning(s)" "$DETAILS" "monitoring,auto-detected")
  "$NOTIFY" vibe-hq "**hq** · 🩺 Doctor — ❌ ${FAIL_COUNT} failure(s), ${WARN_COUNT} warning(s)
${DETAILS}

📋 $ISSUE_NUM"
elif [ "$WARN_COUNT" -gt 0 ]; then
  echo "Overall: ⚠️ $WARN_COUNT warning(s)" | tee -a "$LOG"
  DETAILS=$(echo -e "$ISSUES")
  ISSUE_NUM=$("$CREATE_ISSUE" "Doctor: ${WARN_COUNT} warning(s)" "$DETAILS" "monitoring,auto-detected")
  "$NOTIFY" vibe-hq "**hq** · 🩺 Doctor — ⚠️ ${WARN_COUNT} warning(s)
${DETAILS}

📋 $ISSUE_NUM"
else
  echo "Overall: ✅ Healthy" | tee -a "$LOG"
fi
