# Privacy Audit — Cross-Project Scheduled Job

**Date:** 2026-03-30
**Status:** Partially implemented — needs review and hardening
**Owner:** hq (runs across all projects)

---

## Problem

Private data can leak in multiple ways:
- A private repo gets flipped to public (GitHub settings accident)
- Secrets committed to tracked files (API keys, tokens, passwords)
- Financial/personal data in public repos (account numbers, NRIC, large amounts)
- GitHub Pages enabled on a private-expected repo (content becomes publicly accessible)
- Credential files (.pem, .key, id_rsa) committed
- .env files with secrets committed

The your-project repo contains investment strategy, capital amounts, and references Telegram bot tokens. This must never be public. Similar concerns apply to your-project-2 (business data) and other private repos.

---

## What's Been Built (2026-03-30)

### Script: `~/hq/tools/scripts/run-privacy-audit.sh`

7 checks per project:

| # | Check | Severity | What It Catches |
|---|-------|----------|-----------------|
| 1 | Repo visibility vs expectation | CRITICAL | Private repo accidentally made public |
| 2 | Secret patterns in tracked files | CRITICAL | API keys, tokens, passwords in git |
| 3 | Private data patterns (public repos only) | WARNING | Account numbers, NRIC, SSN, large SGD amounts |
| 4 | .env files committed | CRITICAL | Environment files with secrets |
| 5 | GitHub Pages on private-expected repos | CRITICAL | Content publicly accessible |
| 6 | Large tracked files (>1MB) | WARNING | Potential data dumps, exports |
| 7 | Credential files committed | CRITICAL | .pem, .key, .p12, id_rsa |

### Projects Covered

```bash
PROJECTS=(
  "$HOME/projects/your-project|your-project|private"
  "$HOME/projects/blogs|blogs|public"
  "$HOME/projects/LinkedInOrganiser|LinkedInOrganiser|private"
  "$HOME/projects/camel-cpq-integration-framework|camel-cpq|private"
  "$HOME/projects/your-project-2|your-project-2|private"
  "$HOME/hq|hq|private"
)
```

### Schedule

- **Plist:** `com.hq.privacy-audit` — loaded in launchd
- **When:** Sunday 09:00 SGT (weekly)
- **Notify:** Telegram + GitHub issue on findings. Silent if all clear.

### Registry

`scheduled-jobs.md` updated with the new job entry.

---

## What Still Needs Doing

### Must-Have (before trusting it)

1. **Run it once manually and verify output** — `~/hq/tools/scripts/run-privacy-audit.sh`
2. **Review false positives** — the regex patterns may match legitimate content (e.g., the script itself contains the patterns). Self-exclusion exists but needs testing.
3. **Add `blogs` content check** — blogs is the only public repo. Verify it doesn't contain personal info that shouldn't be published.
4. **Verify `gh` CLI auth works in launchd context** — the script uses `gh api` to check repo visibility and Pages status. May need `GITHUB_TOKEN` in the plist environment.

### Should-Have

5. **Git history scan** — current script only checks HEAD. A secret committed and then deleted is still in git history. Consider `trufflehog` or `gitleaks` integration for deep history scan.
6. **New project auto-discovery** — currently hardcoded project list. Should scan `~/projects/` for any git repo not in the list and flag it.
7. **Gitignore audit** — check that each project's `.gitignore` excludes `.env`, `*.key`, `*.pem`, `credentials*`.
8. **Branch scan** — check non-main branches too (feature branches may have secrets that never hit main).

### Nice-to-Have

9. **Dashboard/report** — write a `~/hq/docs/privacy-audit-latest.md` summary after each run for reference.
10. **Integration with config-drift** — the config-drift job already checks for trufflehog hooks. Privacy audit could verify that trufflehog actually runs and catches things.
11. **Webhook on repo visibility change** — GitHub can notify on settings changes. More immediate than weekly scan.

---

## Open Questions

1. **Should the audit run more frequently?** Weekly catches most things, but a daily lightweight check (just visibility + Pages) would catch accidents faster.
2. **What about non-GitHub repos?** If any projects move to GitLab or self-hosted, the `gh` CLI checks won't work.
3. **Notification escalation** — should CRITICAL findings go to a different Telegram channel or trigger a louder alert?
