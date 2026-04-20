# Scheduled Jobs

All scheduled jobs use **macOS launchd** via plist files in `~/Library/LaunchAgents/`.
Managed with **Lingon Pro 10** — the GUI for viewing, editing, and toggling jobs. Never edit plists by hand unless necessary; Lingon Pro is the management interface.

## How it works

1. A plist file in `~/Library/LaunchAgents/` defines the schedule and script
2. `launchctl load <plist>` activates it, `launchctl unload` deactivates
3. Each script lives in its project's `tools/scripts/` directory
4. Logs go to the project's `tools/logs/` directory
5. Lingon Pro 10 shows all jobs, their status, last run, and lets you edit schedules visually

## Quick checks

```bash
# List all custom jobs
launchctl list | grep -E 'com\.(your-project|hq)'

# Check a specific job
launchctl list com.your-project.daily-brief
```

## Active Jobs

| Job | Project | Schedule | Script | Notes |
|-----|---------|----------|--------|-------|
| `com.your-project.morning-brief` | your-project | Mon-Fri 06:15 SGT | `~/projects/your-project/tools/scripts/run-pipeline.sh morning` | 6-pass: collect US close (31 tickers), macro, SEC filings, news triage, Claude analysis, dashboard. Telegram if alerts. |
| `com.your-project.evening-brief` | your-project | Mon-Fri 21:45 SGT | `~/projects/your-project/tools/scripts/run-pipeline.sh evening` | 3-pass: SGX close + US open, Asia news, Claude analysis. Telegram if SGX >3% or US gap >2%. |
| `com.your-project.watchlist-refresh` | your-project | Mon-Fri 06:45 SGT | `~/projects/your-project/tools/scripts/run-pipeline.sh watchlist` | Update watchlist prices + alert status. Telegram if target hit or stop within 5%. |
| `com.your-project.research-scan` | your-project | Mon-Fri 07:15 SGT | `~/projects/your-project/tools/scripts/run-pipeline.sh research` | Flag stale theses via news scan. Telegram only on thesis-changing events. |
| `com.your-project.reminders` | your-project | Daily 07:30 SGT | `~/projects/your-project/tools/scripts/reminders.sh` | Calendar check: earnings, deadlines, binary events. Telegram if anything due within 3 days. |
| `com.your-project.watchdog` | your-project | Hourly (market hours) | `~/projects/your-project/tools/scripts/watchdog.sh` | Critical alerts only: stop-loss breach, circuit breaker, oil signal. 4h dedup. No commits. |
| `com.your-project.weekend-research` | your-project | Sat 10:15 SGT | `~/projects/your-project/tools/scripts/run-pipeline.sh weekend` | 4-pass: weekly data, thesis stress-test (QwQ), Claude strategy review, dashboard. Always notifies. |
| `com.your-project.monthly-consensus` | your-project | 1st Sat 10:15 SGT | `~/projects/your-project/tools/scripts/run-pipeline.sh monthly` | 3-pass: full data pull, PAL multi-model debate, Claude synthesis. Always notifies. |
| `com.hq.refresh-references` | hq | 03:30 SGT daily | `~/hq/tools/scripts/run-refresh-references.sh` | Qwen refreshes reference library detail pages from `registry.yaml` |
| `com.your-project-2.email-scan` | your-project-2 | 08:00 + 14:00 SGT daily | `~/projects/your-project-2/tools/scripts/run-email-scan.sh` | Claude Sonnet scans Thunderbird via MCP, sends Telegram notification if actionable emails found. Silent on boring success. |
| `com.your-project-2.todo-reminder` | your-project-2 | 08:15 SGT daily | `~/projects/your-project-2/tools/scripts/run-todo-reminder.sh` | Claude Haiku reads TODO.md, sends Telegram reminder of overdue/urgent/next-up items. Always sends. |
| `com.hq.config-drift` | hq | 08:15 SGT daily | `~/hq/tools/scripts/run-config-drift.sh` | Scans active projects for missing hooks, stale CLAUDE.md, missing agents. Telegram notify only if drift found. Loaded. |
| `com.hq.doctor` | hq | Mon 10:15 SGT weekly | `~/hq/tools/scripts/run-doctor.sh` | Checks tools, configs, MCPs, library, templates, Keychain secrets. Silent if healthy, notifies on failures/warnings. Loaded. |
| `com.hq.toolkit-scout` | hq | Sun 10:15 SGT weekly | `~/hq/tools/scripts/run-toolkit-scout.sh` | Claude scans for new tools, MCPs, skills. Notifies only if notable finds. Loaded. |
| `com.hq.learning-harvest` | hq | 02:15 SGT daily | `~/hq/tools/scripts/run-learning-harvest.sh` | Claude compares project configs vs library, flags drift and promotion candidates. Notifies only if changes found. Loaded. |
| `com.hq.heartbeat` | hq | 09:00 SGT daily | `~/hq/tools/scripts/run-heartbeat.sh` | Monitors all scheduled jobs — checks for missing logs, launchd failures. Notifies only if a job didn't run. Loaded. |
| `com.hq.planning-digest` | hq | 08:00 SGT daily | `~/hq/tools/scripts/run-planning-digest.sh` | Morning digest: open planning tasks, GitHub issues count. Always sends. Loaded. |
| `com.hq.privacy-audit` | hq | Sun 09:00 SGT weekly | `~/hq/tools/scripts/run-privacy-audit.sh` | Cross-project privacy audit: repo visibility vs expectation, secrets in tracked files, private data patterns in public repos, .env/credential files, GitHub Pages exposure, large files. Telegram + issue on findings. |

## Adding a new job

1. Create the script in the project's `tools/scripts/`
2. Create a plist in `~/Library/LaunchAgents/` (or use Lingon Pro to create it)
3. `launchctl load ~/Library/LaunchAgents/<plist>`
4. Verify: `launchctl list | grep <label>`
5. **Update this file**
