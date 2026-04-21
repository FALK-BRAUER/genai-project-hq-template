# Quick Reference — "I want to..."

*Decision guide: what tool/skill/MCP to use for common tasks.*

---

## Build & Ship

| I want to... | Use | Type |
|--------------|-----|------|
| Plan before coding | `/plan` | Skill |
| Build a full feature from requirements | `/gsd:new-project` | GSD |
| Execute a planned phase | `/gsd:execute-phase` | GSD |
| Create a feature branch | `/branch` | Skill |
| Commit with conventional message | `/commit` | Skill |
| Stage, commit, and push in one step | `/push` | Skill |
| Create a pull request | `/pr` | Skill |
| Fix a failing CI pipeline | `/fix-pipeline` | Skill |
| Ship (PR + review + merge prep) | `/gsd:ship` | GSD |

## Review & Quality

| I want to... | Use | Type |
|--------------|-----|------|
| Review a PR | `/code-review:code-review` | Plugin |
| Comprehensive PR review (6 agents) | `/pr-review-toolkit:review-pr` | Plugin |
| Security audit (OWASP Top 10) | `/review-security` | Skill |
| Simplify messy code | `/code-simplifier:code-simplifier` | Plugin |
| Run tests in a loop | `/ralph-loop:ralph-loop` | Plugin |

## Understand & Debug

| I want to... | Use | Type |
|--------------|-----|------|
| Explain how code works | `/explain-code` | Skill |
| Debug a failing feature | `/gsd:debug` | GSD |
| Search the codebase quickly | `explore` agent | Agent |
| Get a second opinion from another AI | PAL `challenge` or `consensus` | MCP |
| Deep reasoning on a hard problem | PAL `thinkdeep` or Sequential Thinking MCP | MCP |

## Project Management

| I want to... | Use | Type |
|--------------|-----|------|
| Set up daily context | `/today` | Skill |
| Check project progress | `/gsd:progress` | GSD |
| Save session state before /clear | `/handoff` | Skill |
| Resume from a previous session | `/gsd:resume-work` | GSD |
| Scaffold a new project | `/scaffold-project` or `/new-project` | Skill |
| Health check the setup | `/doctor` | Skill |
| Sync learnings across projects | `/sync` | Skill |
| Manage the project registry | `/manage-registry` | Skill |
| Review and improve CLAUDE.md | `/claude-reflect:reflect` | Plugin |

## Frontend & Design

| I want to... | Use | Type |
|--------------|-----|------|
| Build production UI components | `/frontend-design:frontend-design` | Plugin |
| Explore a design interactively | `/playground:playground` | Plugin |
| Debug in the browser | Chrome DevTools MCP | MCP |
| Generate UI design spec | `/gsd:ui-phase` | GSD |
| Audit implemented UI | `/gsd:ui-review` | GSD |

## Research & Documentation

| I want to... | Use | Type |
|--------------|-----|------|
| Look up library docs (latest version) | Context7 MCP (`use context7`) | MCP |
| Read a web page | WebFetch (built-in) or Jina Reader MCP | Tool/MCP |
| Search the web | WebSearch (built-in) | Tool |
| Update architecture diagrams | `/architecture` | Skill |
| Convert PDF/DOCX to markdown | Markitdown skill | Library Skill |
| Generate a branded PDF (quote, invoice, SOW) | `branded-docs` skill | Library Skill |
| Break a PRD into tickets | PRD to Tickets skill | Library Skill |

## Domain-Specific (examples — install skills per project)

| I want to... | Use | Type |
|--------------|-----|------|
| Investment research (multi-model) | PAL MCP + investment research skill | MCP + Skill |
| Stock prices / fundamentals | Yahoo Finance MCP | MCP |
| SEC filings | SEC EDGAR MCP | MCP |
| Economic data (CPI, rates) | FRED MCP | MCP |
| Accounting / tax | Accounting skill (Singapore defaults, adaptable) | Library Skill |
| Contract drafting | Contracts skill | Library Skill |
| Ghost CMS publishing | Ghost CMS skill | Library Skill |
| Apache Camel routes | Apache Camel skill | Library Skill |
| Pricing engine / CPQ | Pricing Domain skill | Library Skill |
