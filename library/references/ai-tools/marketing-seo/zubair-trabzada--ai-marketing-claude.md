---
url: https://github.com/zubair-trabzada/ai-marketing-claude
stars: 1120
last_checked: 2026-04-15
last_commit: 2026-03-02
category: marketing-seo
status: active
---
# ai-marketing-claude

> AI Marketing Suite for Claude Code. 15 marketing skills with parallel subagents — audit any website, generate copy, email sequences, ad campaigns, content calendars, competitive intelligence, and client-ready PDF reports.

## What's Inside
- 15 marketing commands: /market audit, quick, copy, emails, social, ads, funnel, competitors, landing, launch, proposal, report, report-pdf, seo, brand
- 5 parallel subagents for comprehensive audits: market-content (content & messaging), market-conversion (CRO & funnel), market-competitive (competitive positioning), market-technical (technical SEO & tracking), market-strategy (brand, pricing & growth)
- 14 sub-skills for specific marketing tasks: market-audit, market-copy, market-emails, market-social, market-ads, market-funnel, market-competitors, market-landing, market-launch, market-proposal, market-report, market-report-pdf, market-seo, market-brand
- Scoring methodology across 6 dimensions: Content & Messaging (25%), Conversion Optimization (20%), SEO & Discoverability (20%), Competitive Positioning (15%), Brand & Trust (10%), Growth & Strategy (10%)
- Python utilities: analyze_page.py, competitor_scanner.py, social_calendar.py, generate_pdf_report.py
- Marketing templates: email-welcome.md (5 emails), email-nurture.md (6 emails), email-launch.md (8 emails), proposal-template.md, content-calendar.md (30-day), launch-checklist.md

## Stack
- Python (86.7%), Shell (13.3%)
- Claude Code
- ReportLab (PDF generation)

## File Tree (key paths)
```
ai-marketing-claude/
├── market/
│   └── SKILL.md
├── skills/
│   ├── market-audit/
│   ├── market-copy/
│   ├── market-emails/
│   ├── market-social/
│   ├── market-ads/
│   ├── market-funnel/
│   └── [8 more skills]
├── agents/
│   ├── market-content.md
│   ├── market-conversion.md
│   ├── market-competitive.md
│   ├── market-technical.md
│   └── market-strategy.md
├── scripts/
│   ├── analyze_page.py
│   ├── competitor_scanner.py
│   ├── social_calendar.py
│   └── generate_pdf_report.py
├── templates/
└── install.sh
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: yes (15 skills, 5 agents)
- Hooks: no

## Notable
- Built for agency builders, solopreneurs, content creators who want to sell marketing services powered by AI
- Parallel agent execution for comprehensive audits (5 agents launch simultaneously)
- Professional PDF report generation for client deliverables with ReportLab
- Part of AI Workshop Community ecosystem (Skool platform) - learn AI automations, vibe coding, AI-powered services
- One-command install with curl script, clean uninstall available
