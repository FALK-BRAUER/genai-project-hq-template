---
url: https://github.com/kostja94/marketing-skills
stars: 166
last_checked: 2026-04-15
last_commit: 2026-04-08
category: marketing-seo
status: active
---
# marketing-skills

> Agent Skills for Marketing — SEO, Social, Influencer & More. 160+ open-source skills for SEO, content, 40+ page types, paid ads, channels, and strategies.

## What's Inside
- 160+ skills in 9 categories: SEO (technical, on-page, content, off-page, local, tactics), Content (copywriting, video, visual, translation), Paid Ads (strategy + 12 platforms), Pages (40+ types), Components (nav, breadcrumb, footer, hero, CTA, logo, testimonials), Channels (affiliate, email, influencer, referral, directories, PR), Platforms (X, Reddit, LinkedIn, TikTok, YouTube, Medium, GitHub, Grokipedia), Strategies (launch), Analytics (traffic, tracking, GSC, AI traffic)
- 40+ page type generators: brand pages, content pages, marketing pages, legal pages, utility pages, Features vs Use cases vs Solutions pages
- Project context system for tailored output (project-context.md, project-task-tracker.md)
- 12 paid ad platform skills: Google Ads, Meta Ads, LinkedIn Ads, TikTok Ads, Twitter/X Ads, Pinterest Ads, Snapchat Ads, Reddit Ads, Quora Ads, Bing Ads, CTV, Programmatic
- Technical SEO skills: robots.txt, xml-sitemap, canonical-tag, indexing, indexnow, crawlability, core-web-vitals, mobile-friendly, rendering
- On-page SEO skills: title-tag, meta-description, schema-markup, heading-structure, internal-links, image-optimization, video-optimization, url-structure

## Stack
- Markdown skill files (pure markdown, no executable code)
- Works with Cursor, Claude Code, OpenClaw, Lovable, v0, Bolt
- Agent Skills spec compatible (.agents/skills/, .cursor/skills/, .claude/skills/)

## File Tree (key paths)
```
marketing-skills/
├── skills/
│   ├── seo/
│   │   ├── technical/
│   │   ├── on-page/
│   │   ├── content/
│   │   ├── off-page/
│   │   ├── local/
│   │   └── tactics/
│   ├── content/
│   ├── paid-ads/
│   ├── pages/
│   ├── components/
│   ├── channels/
│   ├── platforms/
│   ├── strategies/
│   └── analytics/
├── templates/
│   ├── project-context.md
│   └── project-task-tracker.md
└── docs/
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: yes (160+ skills)
- Hooks: no

## Notable
- SkillsBench cited (arXiv:2602.12670): +16.2pp task success with human-curated skills, vertical domains benefit most
- Pure Markdown skills - no executable code, scope limited to SEO/content/marketing, no data exfiltration
- Project context required for tailored output (product, audience, brand, keywords) - stale context degrades quality
- Partnership program for vibe coding product/AI marketing agent integration
- v1.0.0 release (Mar 11, 2026): First Official Release
