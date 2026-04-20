---
url: https://github.com/anthropics/financial-services-plugins
stars: 7300
last_checked: 2026-04-15
last_commit: 2026-02-23
category: finance
status: active
---
# financial-services-plugins

> Plugins that turn Claude into a specialist for financial services — investment banking, equity research, private equity, and wealth management.

## What's Inside
- Core financial analysis plugin with DCF, LBO, and comparable company analysis tools
- 11 MCP integrations (Daloopa, Morningstar, S&P Global, FactSet, Moody's, LSEG, PitchBook, Chronograph, Egnyte)
- Specialized add-on plugins: investment banking, equity research, private equity, wealth management
- 41 skills and 38 commands for financial workflows
- Excel workbook generation with live formulas, sensitivity tables, and industry-standard formatting
- PowerPoint template integration for pitch decks, CIMs, teasers, and process letters
- Partner-built plugins from LSEG (bond pricing, FX, options) and S&P Global (tearsheets, earnings previews)
- Office add-in deployment for Microsoft 365 with direct cloud access to Vertex AI, Bedrock, or LLM gateway

## Stack
- Python (90.1%), JavaScript (9.9%)
- Claude Cowork and Claude Code compatible
- MCP (Model Context Protocol) for data connectors

## File Tree (key paths)
```
financial-services-plugins/
├── financial-analysis/
├── investment-banking/
├── equity-research/
├── private-equity/
├── wealth-management/
├── partner-built/
│   ├── lseg/
│   └── spglobal/
├── claude-in-office/
├── .claude-plugin/
└── .mcp.json
```

## AI-Readiness
- CLAUDE.md: yes
- .cursorrules: no
- MCP config: yes (11 providers)
- Skills/agents: yes (41 skills)
- Hooks: no

## Notable
- Official Anthropic repository for financial services
- End-to-end workflows from research to Excel/PPT outputs without context-switching
- Customizable plugin structure - swap connectors, add firm context, bring templates
- Microsoft 365 add-in with interactive setup wizard and Azure admin consent flow
