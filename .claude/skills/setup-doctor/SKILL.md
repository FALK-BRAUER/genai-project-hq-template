---
name: setup-doctor
description: Verify all tools installed, configs valid, MCPs running, and vibe-hq repo healthy. Use with /doctor command.
---

## Checks

### 1. Core Tools
```bash
which node && node --version    # expect v22+
which npm && npm --version
which git && git --version
which gh && gh --version
which claude                    # Claude Code CLI
which docker                    # Docker Desktop
```

### 2. Global Claude Config
- `~/.claude/CLAUDE.md` exists and is non-empty
- `~/.claude/settings.json` exists and is valid JSON
- `~/.claude.json` exists (MCP servers)
- `~/.claude/agents/` has debugger.md, reviewer.md, git.md, refactor.md, architect.md
- `~/.claude/commands/` has commit.md, push.md, branch.md, pr.md, fix-pipeline.md, today.md, architecture.md
- `~/.claude/skills/` has plan, explain-code, handoff, review-security, scaffold-project

### 3. MCP Servers
Check `~/.claude.json` for expected servers:
- memory, sequential-thinking, context7, chrome-devtools, filesystem, github
- Verify each has valid command and args

### 4. Vibe HQ Repo Health
- `~/vibe-hq/` exists and is a git repo
- Working tree is clean (no uncommitted changes)
- On main branch
- Up to date with remote

### 5. Library Populated
- `library/agents/` has files
- `library/skills/` has files
- `library/hooks/` has files
- `library/mcps/` has catalog and recipes
- `library/commands/` has files

### 6. Templates Valid
- `templates/nextjs-app/manifest.json` exists and is valid JSON
- `templates/fastapi-service/manifest.json` exists and is valid JSON
- `templates/consulting-report/manifest.json` exists and is valid JSON
- All manifest references point to existing library files

### 7. Scripts Executable
- `scripts/install-global.sh` exists and is executable
- `scripts/sync-learnings.sh` exists and is executable
- `scripts/audit-all.sh` exists and is executable

## Output Format
```
🩺 Vibe Coding Health Check — YYYY-MM-DD

Core Tools:          ✅ All installed (node v22.x, git 2.x, gh 2.x, claude)
Global Config:       ✅ CLAUDE.md, settings.json, 5 agents, 8 commands, 5 skills
MCP Servers:         ✅ 6/6 configured (memory, context7, github, ...)
Vibe HQ Repo:        ✅ Clean, on main, up to date
Library:             ✅ 12 agents, 6 skills, 11 hooks, 5 MCPs, 7 commands
Templates:           ✅ 3/3 valid manifests
Scripts:             ✅ 3/3 executable

Overall: ✅ Healthy
```
