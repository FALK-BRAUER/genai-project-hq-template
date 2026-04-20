---
url: https://github.com/AgriciDaniel/claude-seo
stars: 4600
last_checked: 2026-04-15
last_commit: 2026-04-11
category: marketing-seo
status: active
---
# claude-seo

> Universal SEO skill for Claude Code. 19 sub-skills, 12 subagents, 3 extensions (DataForSEO, Firecrawl, Banana).

## What's Inside
- 19 sub-skills covering technical SEO, on-page, content, schema, GEO/AEO, local SEO, maps intelligence
- 12 specialized subagents for parallel analysis
- Google SEO APIs integration (Search Console, PageSpeed, CrUX, GA4, Indexing) with 4-tier credential system
- PDF/Excel report generation with charts (WeasyPrint + matplotlib)
- Local SEO & Maps Intelligence (GBP optimization, geo-grid rank tracking, NAP consistency, map pack)
- Programmatic SEO analysis and competitor comparison page generation
- Video & Live schema types (VideoObject, BroadcastEvent, Clip, SeekToAction, SoftwareSourceCode)
- Extensions: DataForSEO (22 commands), Banana AI image generation, Firecrawl backlink analysis
- MCP integrations: Ahrefs, Semrush, Google Search Console, PageSpeed Insights, DataForSEO

## Stack
- Python (85.0%), Shell (6.0%), PowerShell (5.4%), HTML (3.6%)
- Claude Code CLI
- Playwright (optional for screenshots)
- WeasyPrint, matplotlib (PDF reports)

## File Tree (key paths)
```
claude-seo/
├── skills/
├── agents/
├── extensions/
│   ├── dataforseo/
│   ├── banana/
│   └── firecrawl/
├── schema/
├── pdf/
├── hooks/
├── docs/
├── scripts/
└── .claude-plugin/
```

## AI-Readiness
- CLAUDE.md: yes
- .cursorrules: no
- MCP config: yes (DataForSEO, Ahrefs, Semrush, GSC, PSI)
- Skills/agents: yes (19 skills, 12 agents)
- Hooks: yes

## Notable
- 4-tier credential system for Google APIs (API key → OAuth/SA → GA4 config → Ads token)
- Quality gates: warning at 30+ location pages, hard stop at 50+
- Current Core Web Vitals metrics (LCP <2.5s, INP <200ms, CLS <0.1 - INP replaced FID March 2024)
- E-E-A-T analysis updated to September 2025 Quality Rater Guidelines
- v1.8.1 release (Apr 6, 2026): Google Images SERP, Image Optimization, Standards Compliance
