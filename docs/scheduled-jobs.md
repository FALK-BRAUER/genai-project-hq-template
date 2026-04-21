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
launchctl list | grep com.hq

# Check a specific job
launchctl list com.hq.heartbeat
```

## HQ Jobs (built-in)

| Job | Schedule | Script | Purpose |
|-----|----------|--------|---------|
| `com.hq.heartbeat` | Daily 09:00 | `tools/scripts/run-heartbeat.sh` | Monitors all scheduled jobs — checks for missing logs, launchd failures. Notifies if a job didn't run. |
| `com.hq.config-drift` | Daily 08:15 | `tools/scripts/run-config-drift.sh` | Scans active projects for missing hooks, stale CLAUDE.md, missing agents. Telegram notify only if drift found. |
| `com.hq.learning-harvest` | Daily 02:15 | `tools/scripts/run-learning-harvest.sh` | Compares project configs vs library, flags drift and promotion candidates. Notifies only if changes found. |
| `com.hq.refresh-references` | Daily 03:30 | `tools/scripts/run-refresh-references.sh` | Refreshes reference library detail pages from registry.yaml. |
| `com.hq.doctor` | Mon 10:15 weekly | `tools/scripts/run-doctor.sh` | Checks tools, configs, MCPs, library, templates, Keychain secrets. Silent if healthy, notifies on failures. |
| `com.hq.toolkit-scout` | Sun 10:15 weekly | `tools/scripts/run-toolkit-scout.sh` | Scans for new tools, MCPs, skills. Notifies only if notable finds. |
| `com.hq.privacy-audit` | Sun 09:00 weekly | `tools/scripts/run-privacy-audit.sh` | Cross-project privacy audit: repo visibility, secrets in tracked files, private data in public repos. |
| `com.hq.planning-digest` | Daily 08:00 | `tools/scripts/run-planning-digest.sh` | Morning digest: open planning tasks, GitHub issues count. |

## Project Jobs (examples — add your own)

| Job | Schedule | Script | Purpose |
|-----|----------|--------|---------|
| `com.your-project.daily-brief` | Daily 07:00 | `~/projects/your-project/tools/scripts/run-pipeline.sh` | Daily analysis pipeline. Telegram notification on completion. |
| `com.your-project.weekly-review` | Sat 10:00 | `~/projects/your-project/tools/scripts/run-pipeline.sh weekly` | Weekly summary. Always notifies. |

## Adding a new job

1. Create the script in the project's `tools/scripts/`
2. Create a plist in `~/Library/LaunchAgents/` (or use Lingon Pro to create it)
3. `launchctl load ~/Library/LaunchAgents/<plist>`
4. Verify: `launchctl list | grep <label>`
5. **Update this file**
