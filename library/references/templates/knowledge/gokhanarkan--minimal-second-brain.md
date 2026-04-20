---
url: https://github.com/gokhanarkan/minimal-second-brain
stars: 12
last_checked: 2026-04-15
last_commit: 2025-01-03
category: knowledge
status: active
---
# gokhanarkan/minimal-second-brain

> A minimal, AI-native Obsidian vault template. 3 folders, manifest files for Claude/Copilot, automated maintenance

## What's Inside
- Three-folder structure: Inbox, Projects, Knowledge
- MANIFEST.md auto-generation for AI discovery
- Claude Code hooks for real-time updates
- GitHub Copilot instructions
- AGENTS.md universal agent format
- Automated project archiving with summaries
- GitHub Activity Summary skill
- Weekly vault cleaning automation
- Python scripts for manifest sync and cleaning
- Example pillar (Personal) with full structure

## Stack
- Obsidian (markdown vault)
- Python (automation scripts)
- GitHub Actions
- Claude Code hooks
- pytest (testing)

## File Tree (key paths)
```
minimal-second-brain/
├── .claude/
│   ├── hooks/update-manifest.py
│   ├── settings.local.json
│   └── skills/
├── .github/
│   ├── copilot-instructions.md
│   ├── scripts/
│   └── workflows/
├── Personal/
│   ├── Inbox/
│   ├── Projects/
│   └── Knowledge/
├── CLAUDE.md
├── AGENTS.md
└── README.md
```

## AI-Readiness
- CLAUDE.md: yes
- .cursorrules: no
- MCP config: no
- Skills/agents: yes (archive-project, github-summary)
- Hooks: yes (update-manifest.py)

## Notable
- Truly AI-native design - manifests let AI navigate notes without scanning every file
- Real-time hook updates MANIFEST.md on file changes
- Automated project archiving creates AI-generated summaries
- GitHub Activity Summary skill writes narrative prose from commits/PRs/issues
- Weekly cleaning creates issues for stale content, assignable to AI agents
