---
url: https://github.com/TheCraigHewitt/seomachine
stars: 6000
last_checked: 2026-04-15
last_commit: 2026-04-13
category: marketing-seo
status: active
---
# seomachine

> A specialized Claude Code workspace for creating long-form, SEO-optimized blog content for any business.

## What's Inside
- Custom commands: /research, /write, /rewrite, /optimize, /analyze-existing, /performance-review, /publish-draft, /article, /priorities
- 10 specialized agents: Content Analyzer, SEO Optimizer, Meta Creator, Internal Linker, Keyword Mapper, Editor, Performance, Headline Generator, CRO Analyst, Landing Page Optimizer
- 26 marketing skills (copywriting, CRO, A/B testing, email sequences, pricing strategy, schema markup, programmatic SEO)
- 5 Python SEO analysis modules: search intent analyzer, keyword analyzer, SEO quality rater, content length comparator, readability scorer
- 6 CRO analysis modules for landing pages (above_fold, cta, trust_signal, landing_page_scorer, landing_performance, cro_checker)
- Google Analytics 4, Search Console, DataForSEO integrations for real-time performance insights
- WordPress REST API integration with Yoast SEO metadata
- Additional modules: opportunity_scorer, content_scorer, engagement_analyzer, competitor_gap_analyzer, article_planner, section_writer, social_research_aggregator

## Stack
- Python
- Claude Code workspace
- NLTK, textstat, scikit-learn, beautifulsoup4
- Google APIs, DataForSEO API

## File Tree (key paths)
```
seomachine/
├── .claude/
│   ├── commands/
│   ├── agents/
│   └── skills/
├── data_sources/
│   ├── modules/
│   ├── config/
│   └── utils/
├── context/
│   ├── brand-voice.md
│   ├── style-guide.md
│   ├── target-keywords.md
│   └── internal-links-map.md
├── topics/
├── research/
├── drafts/
├── published/
├── rewrites/
├── landing-pages/
└── wordpress/
```

## AI-Readiness
- CLAUDE.md: yes
- .cursorrules: no
- MCP config: no
- Skills/agents: yes (26 skills, 10 agents)
- Hooks: no

## Notable
- Originally developed for Castos (podcast hosting SaaS) - complete real-world example in examples/castos/
- Content quality standards: 2000-3000+ words, 8th-10th grade reading level, 1-2% keyword density
- Automated agent execution after /write command (SEO Optimizer, Meta Creator, Internal Linker, Keyword Mapper)
- 8-factor opportunity scoring for content prioritization using real analytics data
