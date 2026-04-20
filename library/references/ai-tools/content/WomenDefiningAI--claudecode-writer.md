---
url: https://github.com/WomenDefiningAI/claudecode-writer
stars: 170
last_checked: 2026-04-15
last_commit: 2025-09-03
category: content
status: active
---
# claudecode-writer

> A Claude Code workspace that transforms ideas into multi-format content: research → long-form articles → platform-specific versions (LinkedIn, newsletter, social media, podcast Q&A).

## What's Inside
- Voice learning: add writing examples, Claude learns your unique style
- Smart research: checks your priority sources first for relevant insights
- Automated workflow: /research, /write, /extract-themes commands
- Platform specialists: built-in agents for LinkedIn, newsletters, Twitter, podcast Q&A
- Magic workflow: rawnotes → extract themes → research → write → repurpose everywhere
- Time savings: what took hours (adapting content per platform) now takes seconds
- Consistency: voice stays authentic across all platforms
- Quality: each piece optimized for its platform's best practices
- Learning system: improves understanding of your style with more use

## Stack
- Claude Code CLI
- Markdown
- Platform-specific agents (LinkedIn, newsletter, Twitter, podcast)

## File Tree (key paths)
```
claudecode-writer/
├── .claude/
│   ├── agents/
│   │   ├── linkedin-repurposer.md
│   │   ├── newsletter-repurposer.md
│   │   └── conversational-repurposer.md
│   └── commands/
│       ├── research.md
│       ├── write.md
│       └── extract-themes.md
├── context/
│   ├── writing-examples.md (your voice samples)
│   └── research-sources.md (priority sources)
├── rawnotes/ (unprocessed ideas & voice notes)
├── drafts/ (work in progress)
├── research/ (research briefs)
├── CLAUDE.md
└── README.md
```

## AI-Readiness
- CLAUDE.md: yes
- .cursorrules: no
- MCP config: no
- Skills/agents: yes (3 platform repurposer agents)
- Hooks: no

## Notable
- Template repository designed for forking
- Complete example walkthrough included (remote work productivity article)
- Troubleshooting section for common issues (voice matching, research specificity)
- Perfect for content creators, thought leadership, newsletter writers
- MIT license
