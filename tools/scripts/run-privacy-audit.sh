#!/bin/bash
# run-privacy-audit.sh — Scan projects for accidentally exposed private data
# Checks: public repos with private data, secrets in tracked files,
#         sensitive patterns in committed content, exposed URLs/IPs
source "$(dirname "$0")/env.sh"
set -euo pipefail

VIBE_HQ="$HQ_DIR"
DATE=$(date +%Y-%m-%d)
LOG="$VIBE_HQ/tools/logs/privacy-audit-$DATE.log"
NOTIFY="$VIBE_HQ/tools/scripts/notify-telegram.sh"
CREATE_ISSUE="$VIBE_HQ/tools/scripts/create-issue.sh"
FINDING_COUNT=0
FINDINGS=""

mkdir -p "$VIBE_HQ/tools/logs"

echo "[$DATE] Starting privacy audit" | tee "$LOG"

flag() {
  local severity="$1"  # CRITICAL / WARNING
  local project="$2"
  local issue="$3"
  FINDING_COUNT=$((FINDING_COUNT + 1))
  FINDINGS="${FINDINGS}\n${severity} ${project}: ${issue}"
  echo "  ${severity} $project: $issue" | tee -a "$LOG"
}

# --- Projects to audit — loaded from registry ---
# Add a Visibility: field to registry entries (public or private) to control audit type
declare -a PROJECTS=()
while IFS= read -r reg_file; do
  proj_name=$(basename "$reg_file" .md)
  proj_path=$(grep -oE '\*\*Path:\*\* [^ ]+' "$reg_file" | sed 's/\*\*Path:\*\* //' | sed "s|~|$HOME|" || true)
  visibility=$(grep -oE '\*\*Visibility:\*\* [a-z]+' "$reg_file" | sed 's/\*\*Visibility:\*\* //' || echo "private")
  [ -n "$proj_path" ] && PROJECTS+=("${proj_path}|${proj_name}|${visibility}")
done < <(ls "$HQ_DIR/registry/active/"*.md 2>/dev/null)
# Always include the HQ repo itself
PROJECTS+=("$HQ_DIR|hq|private")

# --- Sensitive patterns to grep for in tracked files ---
SECRETS_PATTERNS=(
  'AKIA[0-9A-Z]{16}'                    # AWS access key
  'sk-[a-zA-Z0-9]{32,}'                 # OpenAI/Anthropic API key
  'ghp_[a-zA-Z0-9]{36}'                 # GitHub PAT
  'xoxb-[0-9]+-[0-9]+-[a-zA-Z0-9]+'    # Slack bot token
  '[0-9]+:AA[a-zA-Z0-9_-]{33}'          # Telegram bot token
  'password\s*[:=]\s*["\x27][^"\x27]+'  # Hardcoded passwords
  'secret\s*[:=]\s*["\x27][^"\x27]+'    # Hardcoded secrets
  'eyJ[A-Za-z0-9_-]{50,}\.[A-Za-z0-9_-]{50,}\.[A-Za-z0-9_-]{20,}'  # Long JWT (Supabase service role, etc.)
)

# --- Config files to scan even when untracked (not committed) ---
SENSITIVE_UNTRACKED_GLOBS=( '.mcp.json' '*.mcp.json' '.env' '.env.*' )

# --- Private data patterns (financial, personal) ---
PRIVATE_DATA_PATTERNS=(
  'account.*[0-9]{8,}'                  # Account numbers (8+ digits)
  'NRIC.*[STFG][0-9]{7}[A-Z]'          # Singapore NRIC
  'passport.*[A-Z][0-9]{7,}'            # Passport numbers
  'S\$[0-9]{3,},[0-9]{3}'              # Large SGD amounts (S$XXX,XXX)
  'SSN.*[0-9]{3}-[0-9]{2}-[0-9]{4}'    # US SSN
)

for entry in "${PROJECTS[@]}"; do
  IFS='|' read -r path name expected_vis <<< "$entry"

  echo "[$DATE] Auditing $name" | tee -a "$LOG"

  if [ ! -d "$path" ]; then
    echo "  ⏭️  $name: directory missing, skipping" | tee -a "$LOG"
    continue
  fi

  if [ ! -d "$path/.git" ]; then
    echo "  ⏭️  $name: not a git repo, skipping" | tee -a "$LOG"
    continue
  fi

  cd "$path"

  # --- CHECK 1: Repo visibility vs expectation ---
  REMOTE=$(git remote get-url origin 2>/dev/null || echo "")
  if [ -n "$REMOTE" ]; then
    # Extract owner/repo from remote URL
    REPO_SLUG=$(echo "$REMOTE" | sed -E 's|.*github.com[:/](.+/.+)\.git$|\1|; s|.*github.com[:/](.+/.+)$|\1|')
    if [ -n "$REPO_SLUG" ]; then
      ACTUAL_VIS=$(gh api "repos/$REPO_SLUG" --jq '.visibility' 2>/dev/null || echo "unknown")
      if [ "$expected_vis" = "private" ] && [ "$ACTUAL_VIS" = "public" ]; then
        flag "🔴 CRITICAL" "$name" "Repo is PUBLIC but expected PRIVATE — private data may be exposed"
      elif [ "$ACTUAL_VIS" = "unknown" ]; then
        echo "  ⚠️  $name: could not determine visibility" | tee -a "$LOG"
      else
        echo "  ✅ $name: visibility=$ACTUAL_VIS (expected $expected_vis)" | tee -a "$LOG"
      fi
    fi
  fi

  # --- CHECK 2: Secrets in tracked files ---
  for pattern in "${SECRETS_PATTERNS[@]}"; do
    MATCHES=$(git grep -lP "$pattern" HEAD 2>/dev/null || true)
    if [ -n "$MATCHES" ]; then
      # Exclude known safe files: audit scripts, node_modules, type definitions,
      # AWS helper modules, minified/bundled JS, and documentation exports
      REAL_MATCHES=$(echo "$MATCHES" | grep -v 'run-privacy-audit.sh' | grep -v 'MCP-SECURITY-AUDIT.md' \
        | grep -v 'node_modules/' | grep -v 'ThirdPartyNotices' | grep -v '\.d\.ts$' \
        | grep -v 'aws-secrets\.ts$' | grep -v '\.min\.js$' \
        | grep -v 'groovy_and_imc_docu/' | grep -v 'groovyandimcdocu/' \
        | grep -v 'gsd-debugger\.md$' || true)
      if [ -n "$REAL_MATCHES" ]; then
        FILE_LIST=$(echo "$REAL_MATCHES" | head -3 | tr '\n' ', ')
        flag "🔴 CRITICAL" "$name" "Secret pattern found in: ${FILE_LIST}"
      fi
    fi
  done

  # --- CHECK 3: Private data in tracked files (only for public repos) ---
  if [ "$ACTUAL_VIS" = "public" ] 2>/dev/null; then
    for pattern in "${PRIVATE_DATA_PATTERNS[@]}"; do
      MATCHES=$(git grep -lP "$pattern" HEAD 2>/dev/null || true)
      if [ -n "$MATCHES" ]; then
        REAL_MATCHES=$(echo "$MATCHES" | grep -v 'run-privacy-audit.sh' || true)
        if [ -n "$REAL_MATCHES" ]; then
          FILE_LIST=$(echo "$REAL_MATCHES" | head -3 | tr '\n' ', ')
          flag "⚠️ WARNING" "$name" "Private data pattern in public repo: ${FILE_LIST}"
        fi
      fi
    done
  fi

  # --- CHECK 4: .env files committed ---
  ENV_FILES=$(git ls-files '*.env' '.env*' 2>/dev/null || true)
  if [ -n "$ENV_FILES" ]; then
    # Exclude known-safe files: templates/examples (no real values) and job configs
    RISKY_ENV=$(echo "$ENV_FILES" | grep -v 'tools/jobs/' \
      | grep -vE '\.env\.(example|template|sample|local\.template)$' || true)
    if [ -n "$RISKY_ENV" ]; then
      flag "🔴 CRITICAL" "$name" ".env file committed: $RISKY_ENV"
    fi
  fi

  # --- CHECK 5: GitHub Pages enabled on private-expected repos ---
  # Only flag when Pages is actively built/building — 404 (disabled) returns non-zero exit,
  # caught by || echo "disabled". Avoid flagging null/empty from jq on 404 responses.
  if [ "$expected_vis" = "private" ] && [ -n "$REPO_SLUG" ]; then
    PAGES_STATUS=$(gh api "repos/$REPO_SLUG/pages" --jq '.status' 2>/dev/null || echo "disabled")
    if [[ "$PAGES_STATUS" == "built" || "$PAGES_STATUS" == "building" || "$PAGES_STATUS" == "queued" ]]; then
      PAGES_URL=$(gh api "repos/$REPO_SLUG/pages" --jq '.html_url' 2>/dev/null || echo "")
      flag "🔴 CRITICAL" "$name" "GitHub Pages ENABLED on private-expected repo — publicly accessible at $PAGES_URL"
    fi
  fi

  # --- CHECK 6: Large files that might contain sensitive data ---
  LARGE_FILES=$(git ls-files | while read f; do
    if [ -f "$f" ]; then
      SIZE=$(wc -c < "$f" 2>/dev/null || echo 0)
      if [ "$SIZE" -gt 1048576 ]; then  # >1MB
        echo "$f ($((SIZE / 1024))KB)"
      fi
    fi
  done)
  if [ -n "$LARGE_FILES" ]; then
    flag "⚠️ WARNING" "$name" "Large tracked files (>1MB): $(echo "$LARGE_FILES" | head -3 | tr '\n' ', ')"
  fi

  # --- CHECK 7: Credentials files committed ---
  CRED_FILES=$(git ls-files | grep -iE 'credential|\.pem$|\.key$|\.p12$|\.pfx$|id_rsa|id_ed25519' || true)
  if [ -n "$CRED_FILES" ]; then
    flag "🔴 CRITICAL" "$name" "Credential file committed: $CRED_FILES"
  fi

  # --- CHECK 8: Secrets in untracked config files (.mcp.json, .env*) ---
  # These files may not be gitignored yet — catch secrets before they're ever committed
  for glob in "${SENSITIVE_UNTRACKED_GLOBS[@]}"; do
    UNTRACKED=$(git ls-files --others --exclude-standard "$glob" 2>/dev/null || true)
    if [ -n "$UNTRACKED" ]; then
      while IFS= read -r file; do
        [ -f "$file" ] || continue
        for pattern in "${SECRETS_PATTERNS[@]}"; do
          if grep -qP "$pattern" "$file" 2>/dev/null; then
            flag "🔴 CRITICAL" "$name" "Secret in untracked file $file — add to .gitignore and move key to keychain"
            break
          fi
        done
      done <<< "$UNTRACKED"
    fi
  done

done

echo "" | tee -a "$LOG"
echo "[$DATE] Privacy audit complete. Found $FINDING_COUNT finding(s)." | tee -a "$LOG"

# --- Notify ---
if [ "$FINDING_COUNT" -gt 0 ]; then
  DETAILS=$(echo -e "$FINDINGS")
  ISSUE_NUM=$("$CREATE_ISSUE" "Privacy audit: ${FINDING_COUNT} finding(s) ($DATE)" "$DETAILS" "security,auto-detected")
  # Escape characters that break Telegram Markdown mode: _, *, `
  SAFE_DETAILS=$(echo "$DETAILS" | sed 's/_/\\_/g; s/\*/\\*/g; s/`/\\`/g')
  "$NOTIFY" vibe-hq "**hq** · 🔒 Privacy Audit — ${FINDING_COUNT} finding(s)
${SAFE_DETAILS}

📋 $ISSUE_NUM"
else
  echo "[$DATE] All clear — no findings" | tee -a "$LOG"
fi
