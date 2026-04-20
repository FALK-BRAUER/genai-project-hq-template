---
url: https://github.com/zubair-trabzada/geo-seo-claude
stars: 870
last_checked: 2026-04-15
last_commit: 2026-02-21
category: marketing-seo
status: active
---
# geo-seo-claude

> GEO-first SEO skill for Claude Code — comprehensive AI search optimization tool for websites featuring citability scoring, AI crawler analysis, brand authority, and GEO priority with SEO assistance.

## What's Inside
- 11 specialized sub-skills for GEO auditing, citability scoring, crawler analysis, brand mentions, platform optimization, schema markup, technical SEO, content quality, and report generation
- 5 parallel subagents for simultaneous analysis (AI visibility, platform analysis, technical SEO, content & E-E-A-T, schema markup)
- PDF report generator for professional client deliverables with charts and visualizations
- llms.txt analysis and generation for AI crawler accessibility
- JSON-LD schema templates for organization, local business, article author, software/SaaS, product/e-commerce, and website search
- Python utilities for page fetching, citability scoring, brand scanning, and report generation
- One-command installer for macOS/Linux and Windows

## Stack
- Python 3.8+
- Claude Code CLI
- Playwright (optional, for screenshots)
- ReportLab (for PDF generation)

## File Tree (key paths)
```
geo-seo-claude/
├── geo/                    # Main skill orchestrator
│   └── SKILL.md
├── skills/                 # 11 specialized sub-skills
│   ├── geo-audit/
│   ├── geo-citability/
│   ├── geo-crawlers/
│   ├── geo-llmstxt/
│   ├── geo-brand-mentions/
│   ├── geo-platform-optimizer/
│   ├── geo-schema/
│   ├── geo-technical/
│   ├── geo-content/
│   ├── geo-report/
│   └── geo-report-pdf/
├── agents/                 # 5 parallel subagents
│   ├── geo-ai-visibility.md
│   ├── geo-platform-analysis.md
│   ├── geo-technical.md
│   ├── geo-content.md
│   └── geo-schema.md
├── scripts/                # Python utilities
│   ├── fetch_page.py
│   ├── citability_scorer.py
│   ├── brand_scanner.py
│   ├── llmstxt_generator.py
│   └── generate_pdf_report.py
├── schema/                 # JSON-LD templates
├── install.sh
├── uninstall.sh
└── requirements.txt
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- AGENTS.md: no
- MCP config: no
- Skills/agents: yes
- Hooks: no

## Notable
- Runs full GEO audit in ~60 seconds with parallel subagent architecture
- Checks robots.txt for 14+ AI crawlers (GPTBot, ClaudeBot, PerplexityBot, etc.) with specific allow/block recommendations
- Addresses the finding that only 11% of domains are cited by both ChatGPT and Google AI Overviews for the same query
