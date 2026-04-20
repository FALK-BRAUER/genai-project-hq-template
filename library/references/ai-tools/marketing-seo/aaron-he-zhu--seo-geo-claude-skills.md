---
url: https://github.com/aaron-he-zhu/seo-geo-claude-skills
stars: 980
last_checked: 2026-04-15
last_commit: 2026-04-10
category: marketing-seo
status: active
---
# seo-geo-claude-skills

> 20 SEO & GEO skills for Claude Code, Cursor, Codex, and 35+ AI agents. CORE-EEAT + CITE frameworks.

## What's Inside
- 20 skills across 4 execution phases: Research, Build, Optimize, Monitor + protocol layer
- 4 cross-cutting protocol skills: content-quality-auditor (80-item CORE-EEAT), domain-authority-auditor (40-item CITE), entity-optimizer, memory-management
- 10 one-shot commands for quick tasks (/seo:audit-page, /seo:check-technical, /seo:audit-domain, etc.)
- CORE-EEAT Content Benchmark (80 items with veto gates) + CITE Domain Rating (40 items)
- Three-tier memory model (HOT 80 lines auto-loaded, WARM on-demand, COLD archive) with 90-day staleness
- Inter-skill handoff protocol for context preservation (objective, findings, evidence, open loops, scores)
- 8 languages, 750+ triggers (EN, ZH, JA, KO, ES, PT with formal, casual, misspelling variants)
- Automation hooks: session start, after writing content, session end

## Stack
- Python (54.5%), Shell (45.5%)
- Claude Code, Cursor, Codex, OpenClaw, Windsurf compatible (35+ agents)
- Optional MCP connectors for Ahrefs, SEMrush, Google Analytics, Search Console

## File Tree (key paths)
```
seo-geo-claude-skills/
├── research/
│   ├── keyword-research/
│   ├── competitor-analysis/
│   ├── serp-analysis/
│   └── content-gap-analysis/
├── build/
│   ├── seo-content-writer/
│   ├── geo-content-optimizer/
│   ├── meta-tags-optimizer/
│   └── schema-markup-generator/
├── optimize/
├── monitor/
├── cross-cutting/
├── commands/
├── hooks/
├── references/
└── .claude-plugin/
```

## AI-Readiness
- CLAUDE.md: yes
- .cursorrules: no
- MCP config: yes (.mcp.json with pre-configured servers)
- Skills/agents: yes (20 skills)
- Hooks: yes

## Notable
- Unified operating model with trigger/quick start/skill contract/handoff structure
- 120-item quality frameworks (CORE-EEAT 80 + CITE 40) with veto gates, not narrative guesswork
- Tool-agnostic: works with 35+ AI agents, zero dependencies (pure markdown skills)
- v7.0.0 release (Apr 6, 2026): Wiki Knowledge Layer
- 6 install methods: ClawHub, skills.sh, Claude Code plugin, git submodule, fork, manual
