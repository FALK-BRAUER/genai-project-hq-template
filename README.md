# GenAI Project HQ Template

A meta-project template for managing GenAI-assisted development infrastructure. Fork this to get:

- **Project registry** — track all your active projects in one place
- **Shared library** — reusable Claude agents, skills, hooks, and MCP recipes
- **Project templates** — scaffold new projects with pre-wired AI tooling
- **Scheduled automation** — daily health checks, config drift detection, learning harvest, toolkit discovery
- **Cost tracking** — monitor AI API spend across projects

Designed for use with [Claude Code](https://claude.ai/code) and [OpenCode](https://opencode.ai).

---

## What Problem This Solves

When you run multiple AI-assisted projects, you end up with:
- Duplicate agent/skill definitions in every repo
- No visibility into which projects are drifting from your standards
- API costs you can't explain because keys are shared
- Context loss between Claude Code sessions

This repo is the single source of truth that manages all of that.

---

## Directory Structure

```
├── registry/
│   ├── active/          — One .md file per active project (path, stack, agents, notes)
│   └── archived/        — Projects you've wound down
│
├── library/             — Reusable components (copy into projects as needed)
│   ├── agents/          — Subagent definitions by role (coding, content, devops, etc.)
│   ├── skills/          — Claude Code skill definitions
│   ├── hooks/           — Pre-commit gates, quality formatters, hints
│   ├── commands/        — Custom slash command templates
│   └── mcps/            — MCP install recipes and catalog
│
├── templates/           — Project scaffolding templates
│   ├── nextjs-app/      — Next.js + Prisma + Tailwind
│   ├── fastapi-service/ — Python FastAPI + PostgreSQL
│   └── consulting-report/ — Client deliverable template
│
├── global-config/       — Source-of-truth tool configs
│   ├── claude-code/     — settings.json, MCP config, global agents/commands/hooks
│   └── opencode/        — OpenCode MCP config
│
├── tools/
│   ├── scripts/         — Scheduled maintenance scripts
│   └── prompts/         — Prompts used by scheduled Claude jobs
│
├── planning/            — Project plans, backlog
├── learnings/           — Knowledge harvested from projects
├── costs/               — AI spending tracker (gitignored by default)
└── docs/                — Architecture and setup documentation
```

---

## Quick Start

### 1. Fork and Clone

```bash
git clone https://github.com/YOUR_USERNAME/genai-project-hq-template.git ~/projects/hq
cd ~/projects/hq
```

### 2. Store Your Anthropic API Key in Keychain

```bash
security add-generic-password -a "$USER" -s ANTHROPIC_API_KEY_HQ -w "sk-ant-YOUR_KEY_HERE"
```

> **Why Keychain?** launchd jobs run without shell environment. Keychain is the macOS-native way to inject secrets into scheduled scripts without hardcoding them.

### 3. Configure env.sh

Edit `tools/scripts/env.sh`:
- Set `NODE_VERSION` to match your Node.js version (`node --version`)
- The Keychain entry name `ANTHROPIC_API_KEY_HQ` matches what you set in step 2

### 4. Set Your GitHub Repo for Issue Tracking

Edit `tools/scripts/create-issue.sh` and set `GITHUB_REPO`:

```bash
REPO="${GITHUB_REPO:-YOUR_GITHUB_USER/your-hq-repo}"
```

Or export `GITHUB_REPO` in your shell profile.

### 5. Register Your First Project

Copy `registry/active/example-project.md`, rename it, and fill in your project's details. The `Path:` field is used by heartbeat and config-drift to find and auto-commit your projects.

### 6. Schedule the Automation (macOS)

Use [Lingon Pro](https://www.peterborgapps.com/lingon/) or create LaunchAgent plists manually.

The scripts in `tools/scripts/` are designed to run via launchd:

| Script | Suggested Schedule | Purpose |
|--------|-------------------|---------|
| `run-heartbeat.sh` | Daily 09:00 | Check all jobs ran, auto-commit dirty repos |
| `run-config-drift.sh` | Daily 10:00 | Detect projects missing CLAUDE.md, hooks, agents |
| `run-learning-harvest.sh` | Daily 11:00 | Harvest learnings from active projects |
| `run-refresh-references.sh` | Daily 12:00 | Refresh the reference library from GitHub |
| `run-doctor.sh` | Monday 09:00 | Full health check of tools and configs |
| `run-toolkit-scout.sh` | Sunday 09:00 | Discover new AI tools and integrations |
| `run-cost-report.sh` | Sunday 18:00 | Weekly AI cost summary |

See `docs/SETUP.md` for full launchd setup instructions.

### 7. Set Up Telegram Notifications (Optional)

Notifications are sent via `tools/scripts/notify-telegram.sh`, which reads credentials from Keychain.

```bash
# Store your Telegram bot token and chat ID
security add-generic-password -a "hq" -s HQ_TELEGRAM_BOT_TOKEN -w "YOUR_BOT_TOKEN"
security add-generic-password -a "hq" -s HQ_TELEGRAM_CHAT_ID -w "YOUR_CHAT_ID"
```

The Keychain service names are derived from the account name you pass to `notify-telegram.sh`:
- Account `hq` → looks for `HQ_TELEGRAM_BOT_TOKEN` and `HQ_TELEGRAM_CHAT_ID`
- Account `my-project` → looks for `MYPROJECT_TELEGRAM_BOT_TOKEN` and `MYPROJECT_TELEGRAM_CHAT_ID`

---

## Project Registry Format

Each file in `registry/active/` follows this format:

```markdown
# project-name

- **Status:** active
- **Template:** nextjs-app
- **Created:** 2026-01-01
- **Last Activity:** 2026-01-01
- **Path:** ~/projects/project-name
- **Repo:** github.com/YOUR_USER/project-name
- **Visibility:** private

## Purpose
What does this project do and why does it exist?

## Stack
- Frontend: ...
- Backend: ...
- Database: ...

## Agents / Skills / Hooks / MCPs
(list what's wired to this project)
```

The `Path:` field is read by heartbeat (auto-commit), config-drift, and privacy-audit to locate your project on disk.

---

## Slash Commands

These are available when you open Claude Code in this repo:

| Command | Purpose |
|---------|---------|
| `/new-project` | Scaffold a project from a template |
| `/list-projects` | Show all active projects from the registry |
| `/doctor` | Run a health check on your setup |
| `/sync` | Pull learnings from projects, check for drift |
| `/archive` | Move a project to `registry/archived/` |

---

## Multi-Pass Pipeline Pattern

If you run scheduled AI jobs (analysis pipelines, data collection, etc.), use the pipeline runner pattern in your projects:

```bash
# In your project's tools/scripts/run-pipeline.sh
if [[ "$PASS_MODEL" == anthropic/* ]]; then
  CLAUDE_MODEL="${PASS_MODEL#anthropic/}"
  claude --print \
    --output-format text \
    --model "$CLAUDE_MODEL" \
    --max-budget-usd 1.00 \
    --dangerously-skip-permissions \
    "$PROMPT_TEXT"
else
  opencode run -m "$PASS_MODEL" --dir "$PROJECT_DIR" "$PROMPT_TEXT"
fi
```

**Key insight:** `claude --print` reads only files your prompt explicitly requests (via tools). `opencode run --dir $PROJECT` snapshots the entire project tree. Use `claude --print` for analysis passes to keep costs low; use opencode for data collection passes that need tool calls.

---

## Per-Project API Keys

Use separate Anthropic API keys per project to track costs:

```bash
# In each project's run-pipeline.sh
export ANTHROPIC_API_KEY=$(security find-generic-password -a "$USER" -s ANTHROPIC_API_KEY_MYPROJECT -w)
```

This lets you see exactly how much each project costs by filtering the Anthropic usage dashboard by API key.

---

## Library

The `library/` directory contains reusable components you can copy into any project:

- **`library/agents/`** — Subagent markdown files by role. Drop into `.claude/agents/`.
- **`library/skills/`** — Skill definitions. Install via `claude skills install`.
- **`library/hooks/`** — Hook configs (JSON). Copy into `.claude/hooks/`.
- **`library/mcps/recipes/`** — Shell scripts to install and configure MCP servers.
- **`library/references/`** — Curated GitHub repo catalog organized by tech category.

---

## Project Templates

Templates in `templates/` define what gets installed when you run `/new-project`:

```json
// templates/nextjs-app/manifest.json
{
  "name": "nextjs-app",
  "agents": ["coding/backend", "coding/frontend"],
  "skills": ["nextjs-patterns", "prisma-domain"],
  "hooks": ["gates/secret-scanner", "gates/test-before-commit"],
  "mcps": []
}
```

---

## Cost Tracking

The `costs/` directory (gitignored) holds CSV files tracking AI API spend:

```
costs/
└── 2026-04.csv  — date, service, project, model, amount_usd, source
```

Populated by `run-cost-report.sh` which collects billing emails via Gmail MCP and parses them.

---

## Contributing

If you extend the library (new agents, skills, MCP recipes), consider contributing back via PR. The goal is a shared, community-maintained library of reusable GenAI development components.

---

## License

MIT
