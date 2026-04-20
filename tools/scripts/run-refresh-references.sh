#!/bin/bash
# run-refresh-references.sh — Batch reference library refresh
# Parent process: parses registry, decides init vs update, feeds Qwen batches.
# Qwen only generates markdown — no discovery, no git, no decisions.
source "$(dirname "$0")/env.sh"
set -euo pipefail

VIBE_HQ="$HQ_DIR"
DATE=$(date +%Y-%m-%d)
LOG="$VIBE_HQ/tools/logs/refresh-references-$DATE.log"
REGISTRY="$VIBE_HQ/library/references/registry.yaml"
REFS_DIR="$VIBE_HQ/library/references"
PROMPT_TEMPLATE="$VIBE_HQ/tools/prompts/refresh-references.md"
BATCH_SIZE="${BATCH_SIZE:-10}"
STALE_DAYS="${STALE_DAYS:-7}"
DRY_RUN="${DRY_RUN:-0}"

mkdir -p "$VIBE_HQ/tools/logs"

log() { echo "[$DATE] $*" | tee -a "$LOG"; }

log "Starting reference library refresh (batch_size=$BATCH_SIZE, stale_days=$STALE_DAYS, dry_run=$DRY_RUN)"

# ─── Step 1: Parse registry.yaml into a flat list ───
# Output: section|category|url|owner--repo
# Pure awk — no python/pyyaml dependency
parse_registry() {
  awk '
    /^templates:/ { section="templates"; next }
    /^ai-tools:/  { section="ai-tools"; next }
    /^[a-z]/ && /:/ && !/^ / { section=""; next }
    section == "" { next }
    /- url:/ {
      url = $NF
      gsub(/\/+$/, "", url)
      # extract owner--repo from github url
      n = split(url, parts, "/")
      if (n >= 5) {
        owner = parts[4]
        repo = parts[5]
        filename = owner "--" repo
      }
      next
    }
    /category:/ {
      category = $NF
      if (filename != "") {
        print section "|" category "|" url "|" filename
      }
      filename = ""
      next
    }
  ' "$REGISTRY"
}

# ─── Step 2: Classify each repo as init, update, or skip ───
classify_repos() {
  local cutoff
  cutoff=$(date -v-${STALE_DAYS}d +%Y-%m-%d 2>/dev/null || date -d "$STALE_DAYS days ago" +%Y-%m-%d)

  while IFS='|' read -r section category url filename; do
    filepath="$REFS_DIR/$section/$category/$filename.md"

    if [ ! -f "$filepath" ]; then
      echo "init|$section|$category|$url|$filename"
      continue
    fi

    # Extract last_checked from frontmatter
    last_checked=$(grep -m1 '^last_checked:' "$filepath" 2>/dev/null | awk '{print $2}' || echo "")
    if [ -z "$last_checked" ] || [[ "$last_checked" < "$cutoff" ]]; then
      echo "update|$section|$category|$url|$filename"
    fi
    # else: skip (fresh enough)
  done
}

# ─── Step 3: Parse and classify ───
ALL_REPOS=$(parse_registry | classify_repos)

if [ -z "$ALL_REPOS" ]; then
  log "Nothing to process — all repos are fresh"
  exit 0
fi

INIT_COUNT=$(echo "$ALL_REPOS" | grep -c '^init|' || true)
UPDATE_COUNT=$(echo "$ALL_REPOS" | grep -c '^update|' || true)
TOTAL=$((INIT_COUNT + UPDATE_COUNT))

log "Found: $INIT_COUNT to initialize, $UPDATE_COUNT to update, $TOTAL total"

if [ "$TOTAL" -eq 0 ]; then
  log "Nothing to process — all repos are fresh"
  exit 0
fi

# Prioritize init over update
SORTED_REPOS=$(echo "$ALL_REPOS" | sort -t'|' -k1,1)

# ─── Dry run: just print the plan ───
if [ "$DRY_RUN" = "1" ]; then
  log "DRY RUN — would process $TOTAL repos in $(( (TOTAL + BATCH_SIZE - 1) / BATCH_SIZE )) batches:"
  echo ""
  BATCH=0
  COUNT=0
  while IFS='|' read -r mode section category url filename; do
    if [ $((COUNT % BATCH_SIZE)) -eq 0 ]; then
      BATCH=$((BATCH + 1))
      echo "── Batch $BATCH ──"
    fi
    printf "  %-6s %-10s %-20s %s\n" "$mode" "$section" "$category" "$filename"
    COUNT=$((COUNT + 1))
  done <<< "$SORTED_REPOS"
  echo ""
  log "DRY RUN complete. Run without DRY_RUN=1 to execute."
  exit 0
fi

# ─── Step 4: Build batches and call Qwen ───
WORK_FILE=$(mktemp)
echo "$SORTED_REPOS" > "$WORK_FILE"
TOTAL_LINES=$(wc -l < "$WORK_FILE" | tr -d ' ')

BATCH_NUM=0
PROCESSED=0
ERRORS=0
OFFSET=0

while [ "$OFFSET" -lt "$TOTAL_LINES" ]; do
  BATCH_NUM=$((BATCH_NUM + 1))
  BATCH_ITEMS=$(tail -n +$((OFFSET + 1)) "$WORK_FILE" | head -n "$BATCH_SIZE")
  BATCH_ACTUAL=$(echo "$BATCH_ITEMS" | wc -l | tr -d ' ')

  log "── Batch $BATCH_NUM: $BATCH_ACTUAL repos (offset $OFFSET/$TOTAL_LINES) ──"

  # Build the repo list for Qwen
  REPO_LIST=""
  while IFS='|' read -r mode section category url filename; do
    mkdir -p "$REFS_DIR/$section/$category"
    REPO_LIST="${REPO_LIST}
- mode: $mode
  url: $url
  section: $section
  category: $category
  filename: $filename
  output_path: library/references/$section/$category/$filename.md"
  done <<< "$BATCH_ITEMS"

  # Build the prompt for this batch
  BATCH_PROMPT="$(cat "$PROMPT_TEMPLATE")

## Repos to Process This Batch
$REPO_LIST"

  log "Calling Qwen for batch $BATCH_NUM..."
  if opencode run -m alibaba/qwen3.5-plus --dir "$VIBE_HQ" "$BATCH_PROMPT" 2>&1 | tee -a "$LOG"; then
    PROCESSED=$((PROCESSED + BATCH_ACTUAL))
    log "Batch $BATCH_NUM complete ($BATCH_ACTUAL repos)"
  else
    ERRORS=$((ERRORS + 1))
    log "ERROR: Batch $BATCH_NUM failed (exit $?)"
  fi

  OFFSET=$((OFFSET + BATCH_SIZE))
done

rm -f "$WORK_FILE"

# ─── Step 5: Git commit + push (only if changes) ───
cd "$VIBE_HQ"
git add library/references/
if git diff --cached --quiet library/references/; then
  log "No file changes — skipping commit"
else
  CHANGED=$(git diff --cached --stat --shortstat | tail -1)
  git commit -m "chore: refresh reference library ($DATE)"
  git push
  log "Committed and pushed: $CHANGED"
fi

# ─── Step 6: Notify ───
NOTIFY="$VIBE_HQ/tools/scripts/notify-telegram.sh"
CREATE_ISSUE="$VIBE_HQ/tools/scripts/create-issue.sh"

if [ "$ERRORS" -gt 0 ]; then
  "$CREATE_ISSUE" "Reference refresh had $ERRORS failed batches ($DATE)" "Check log: $LOG" "monitoring,auto-detected" 2>/dev/null || true
  "$NOTIFY" vibe-hq "**hq** · ⚠️ Reference refresh: $PROCESSED processed, $ERRORS batch errors" 2>/dev/null || true
elif [ "$PROCESSED" -gt 0 ]; then
  "$NOTIFY" vibe-hq "**hq** · 📚 Reference refresh: $PROCESSED repos processed ($INIT_COUNT init, $UPDATE_COUNT update)" 2>/dev/null || true
fi

log "Done. Processed: $PROCESSED, Errors: $ERRORS"
