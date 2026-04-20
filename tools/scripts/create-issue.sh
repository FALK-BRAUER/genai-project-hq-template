#!/bin/bash
# create-issue.sh — Create a GitHub issue on vibe-hq for auto-detected problems
source "$(dirname "$0")/env.sh"
# Deduplicates: won't create if an open issue with the same title exists
#
# Usage:
#   create-issue.sh <title> <body> [label1,label2]
#
# Examples:
#   create-issue.sh "Config drift: my-project missing hooks" "Details..." "monitoring,auto-detected"
#   create-issue.sh "Heartbeat: daily-brief failed" "Exit code 128..." "monitoring,auto-detected"

set -euo pipefail

TITLE="${1:?Usage: create-issue.sh <title> <body> [labels]}"
BODY="${2:?Usage: create-issue.sh <title> <body> [labels]}"
LABELS="${3:-auto-detected,monitoring}"
REPO="YOUR_GITHUB_USER/genai-project-hq-template"

# Deduplicate — check if open issue with same title exists
EXISTING=$(gh issue list --repo "$REPO" --state open --search "$TITLE" --json title,number --jq ".[] | select(.title == \"$TITLE\") | .number" 2>/dev/null || true)

if [ -n "$EXISTING" ]; then
  # Add a comment instead of creating a duplicate
  DATE=$(TZ=${TZ:-UTC} date '+%Y-%m-%d %H:%M local')
  gh issue comment "$EXISTING" --repo "$REPO" --body "Still occurring as of $DATE.

$BODY" >/dev/null 2>&1
  echo "#$EXISTING (commented)"
else
  # Create new issue
  NUMBER=$(gh issue create --repo "$REPO" --title "$TITLE" --body "$BODY" --label "$LABELS" 2>&1 | grep -o '[0-9]*$')
  echo "#$NUMBER"
fi
