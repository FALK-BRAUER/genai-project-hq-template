# Setup Guide

Complete setup instructions for GenAI Project HQ.

---

## Prerequisites

- macOS (Sonoma or later recommended)
- [Claude Code](https://claude.ai/code) installed and authenticated
- [Homebrew](https://brew.sh) installed
- Node.js 18+ (via nvm or Homebrew)
- GitHub CLI: `brew install gh && gh auth login`

---

## 1. Clone and Configure

```bash
git clone https://github.com/YOUR_USERNAME/genai-project-hq-template.git ~/projects/hq
cd ~/projects/hq
```

Edit `tools/scripts/env.sh` — set `NODE_VERSION` to match `node --version` output.

---

## 2. Store API Keys in Keychain

All secrets are stored in macOS Keychain — never in `.env` files or code. launchd jobs inherit nothing from your shell, so Keychain is the correct injection point.

### Anthropic API Key

```bash
security add-generic-password -a "$USER" -s ANTHROPIC_API_KEY_HQ -w "sk-ant-YOUR_KEY"
```

Verify it works:

```bash
security find-generic-password -a "$USER" -s ANTHROPIC_API_KEY_HQ -w
```

### Per-Project API Keys (Optional but Recommended)

Use separate keys per project to track costs on the Anthropic dashboard:

```bash
security add-generic-password -a "$USER" -s ANTHROPIC_API_KEY_MYPROJECT -w "sk-ant-..."
```

Reference in your project's pipeline script:

```bash
export ANTHROPIC_API_KEY=$(security find-generic-password -a "$USER" -s ANTHROPIC_API_KEY_MYPROJECT -w)
```

---

## 3. Set Up Telegram Notifications

### Create a Telegram Bot

1. Open Telegram and message [@BotFather](https://t.me/BotFather)
2. Send `/newbot` and follow the prompts
3. BotFather gives you a token like `7123456789:AAF...` — save it

### Get Your Chat ID

1. Send any message to your new bot
2. Fetch your chat ID:

```bash
curl -s "https://api.telegram.org/bot<YOUR_TOKEN>/getUpdates" | python3 -m json.tool | grep '"id"'
```

The numeric ID in `"chat": {"id": ...}` is your chat ID.

For group notifications: add the bot to a group, send a message, and use the group chat ID (starts with `-`).

### Store in Keychain

The account name you use here determines the Keychain service name convention.
For the HQ repo itself, use `hq`:

```bash
security add-generic-password -a "hq" -s HQ_TELEGRAM_BOT_TOKEN -w "7123456789:AAF..."
security add-generic-password -a "hq" -s HQ_TELEGRAM_CHAT_ID -w "987654321"
```

For a project called `my-project`:

```bash
security add-generic-password -a "my-project" -s MYPROJECT_TELEGRAM_BOT_TOKEN -w "..."
security add-generic-password -a "my-project" -s MYPROJECT_TELEGRAM_CHAT_ID -w "..."
```

The naming rule: account `my-project` → strips hyphens → uppercases → `MYPROJECT_TELEGRAM_BOT_TOKEN`.

### Test It

```bash
./tools/scripts/notify-telegram.sh hq "Test notification from GenAI HQ"
```

---

## 4. Schedule Automation with launchd

### Option A: Lingon Pro (Recommended)

[Lingon Pro 10](https://www.peterborgapps.com/lingon/) provides a GUI for creating and managing LaunchAgents. Create one job per script using the table below.

### Option B: Manual Plist

Create LaunchAgent plists in `~/Library/LaunchAgents/`. Example for the daily heartbeat:

**`~/Library/LaunchAgents/com.hq.heartbeat.plist`**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.hq.heartbeat</string>
    <key>ProgramArguments</key>
    <array>
        <string>/bin/bash</string>
        <string>/Users/YOUR_USER/projects/hq/tools/scripts/run-heartbeat.sh</string>
    </array>
    <key>RunAtLoad</key>
    <false/>
    <key>KeepAlive</key>
    <false/>
    <key>StandardOutPath</key>
    <string>/Users/YOUR_USER/projects/hq/tools/logs/heartbeat-launchd.log</string>
    <key>StandardErrorPath</key>
    <string>/Users/YOUR_USER/projects/hq/tools/logs/heartbeat-launchd.log</string>
    <key>StartCalendarInterval</key>
    <dict>
        <key>Hour</key>
        <integer>9</integer>
        <key>Minute</key>
        <integer>0</integer>
    </dict>
</dict>
</plist>
```

Replace `YOUR_USER` with your macOS username (`whoami`).

Load it:

```bash
launchctl load ~/Library/LaunchAgents/com.hq.heartbeat.plist
```

Verify it loaded:

```bash
launchctl list com.hq.heartbeat
```

### Scheduled Jobs Reference

| Script | Label | Hour | Day | Purpose |
|--------|-------|------|-----|---------|
| `run-heartbeat.sh` | `com.hq.heartbeat` | 9:00 daily | — | Check all jobs ran, auto-commit repos |
| `run-config-drift.sh` | `com.hq.config-drift` | 10:00 daily | — | Detect projects missing CLAUDE.md/hooks |
| `run-learning-harvest.sh` | `com.hq.learning-harvest` | 11:00 daily | — | Harvest learnings from active projects |
| `run-refresh-references.sh` | `com.hq.refresh-references` | 12:00 daily | — | Refresh the GitHub reference library |
| `run-doctor.sh` | `com.hq.doctor` | 9:00 Mon | Weekday=1 | Full health check of tools and configs |
| `run-toolkit-scout.sh` | `com.hq.toolkit-scout` | 9:00 Sun | Weekday=7 | Discover new AI tools |
| `run-cost-report.sh` | `com.hq.cost-report` | 18:00 Sun | Weekday=7 | Weekly AI cost summary |

For weekly jobs, use `StartCalendarInterval` with both `Hour` and `Weekday`:

```xml
<key>StartCalendarInterval</key>
<dict>
    <key>Hour</key>
    <integer>9</integer>
    <key>Minute</key>
    <integer>0</integer>
    <key>Weekday</key>
    <integer>1</integer>
</dict>
```

### Running from a Secondary User Account (SSH Pattern)

If your automated agent runs as a different macOS user (e.g., a dedicated `agent` account), launchd LaunchAgents can't be loaded from an SSH session (no GUI session). Use the wrapper pattern:

1. Create a LaunchAgent under **your** main account
2. The plist runs a wrapper script that SSHes to the agent account

**`~/Library/LaunchAgents/com.hq.agent-triage.plist`**

```xml
<key>ProgramArguments</key>
<array>
    <string>/bin/bash</string>
    <string>/Users/YOUR_USER/projects/hq/tools/scripts/run-agent-triage.sh</string>
</array>
```

**`tools/scripts/run-agent-triage.sh`**

```bash
#!/bin/bash
exec ssh \
  -o StrictHostKeyChecking=no \
  -o BatchMode=yes \
  -i /Users/YOUR_USER/.ssh/id_ed25519 \
  agent@localhost \
  'export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin"; /Users/AGENT_USER/projects/agent-pa/tools/scripts/run-triage.sh'
```

---

## 5. Set Up GitHub Issues Integration

`run-heartbeat.sh`, `run-config-drift.sh`, and `run-privacy-audit.sh` auto-create GitHub issues for detected problems.

Set your repo in `tools/scripts/create-issue.sh`:

```bash
REPO="${GITHUB_REPO:-YOUR_GITHUB_USER/your-hq-repo}"
```

Or export it in your shell profile:

```bash
echo 'export GITHUB_REPO="YOUR_GITHUB_USER/your-hq-repo"' >> ~/.zprofile
```

Ensure `gh` is authenticated: `gh auth status`

---

## 6. Verify Everything Works

Run the doctor script manually:

```bash
bash tools/scripts/run-doctor.sh
```

Check the output at `tools/logs/doctor-YYYY-MM-DD.log`.

Run a heartbeat manually:

```bash
bash tools/scripts/run-heartbeat.sh
```

Test a notification:

```bash
bash tools/scripts/notify-telegram.sh hq "Setup complete"
```
