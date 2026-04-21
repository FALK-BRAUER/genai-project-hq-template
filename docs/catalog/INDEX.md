# Catalog Index

*Complete inventory of MCPs, skills, plugins, and agents. Update this when you add or remove tools.*
*Last generated: 2026-04-22*

---

## MCP Servers

### Global — Claude Code (9)

| MCP | Package | Status | Doc |
|-----|---------|--------|-----|
| Chrome DevTools | `chrome-devtools-mcp` | Active | [chrome-devtools.md](mcps/chrome-devtools.md) |
| Claude Peers | `claude-peers-mcp` | Active | — |
| Context7 | `@upstash/context7-mcp@latest` | Active | [context7.md](mcps/context7.md) |
| Filesystem | `@modelcontextprotocol/server-filesystem` | Active | [filesystem.md](mcps/filesystem.md) |
| GitHub | `@modelcontextprotocol/server-github` | Active | [github.md](mcps/github.md) |
| Jina Reader | `mcp-remote` → jina.ai | Active | [jina-reader.md](mcps/jina-reader.md) |
| Memory | `@modelcontextprotocol/server-memory` | Active | [memory.md](mcps/memory.md) |
| PAL | `pal-mcp-server` (uvx) | Active | [pal.md](mcps/pal.md) |
| Sequential Thinking | `@modelcontextprotocol/server-sequential-thinking` | Active | [sequential-thinking.md](mcps/sequential-thinking.md) |

### Global — OpenCode (5)

| MCP | Package | Status | Doc |
|-----|---------|--------|-----|
| ArXiv | `arxiv-mcp-server` (uv) | Active | [arxiv.md](mcps/arxiv.md) |
| Claude Peers | `claude-peers-mcp` | Active | — |
| OSP Marketing Tools | `osp_marketing_tools` (uvx/git) | Active | [osp-marketing-tools.md](mcps/osp-marketing-tools.md) |
| PAL | `pal-mcp-server` (uvx/git) | Active | [pal.md](mcps/pal.md) |
| Perplexity | `@perplexity-ai/mcp-server` (npx) | Active | [perplexity.md](mcps/perplexity.md) |

### Project-Specific (examples)

| MCP | When to Use | Doc |
|-----|-------------|-----|
| FRED | Macro data projects | [fred.md](mcps/fred.md) |
| Interactive Brokers | Trading / brokerage projects | [interactive-brokers.md](mcps/interactive-brokers.md) |
| SEC EDGAR | Financial research projects | [sec-edgar.md](mcps/sec-edgar.md) |
| SignNow | Document signing projects | [signnow.md](mcps/signnow.md) |
| Yahoo Finance | Finance / market data projects | [yahoo-finance.md](mcps/yahoo-finance.md) |

---

## Plugins (7)

All global scope, installed via Claude plugin marketplace.

| Plugin | Source | Commands | Doc |
|--------|--------|----------|-----|
| Claude Reflect | bayramannakov/claude-reflect | `/claude-reflect:reflect`, `/claude-reflect:reflect-skills` | [claude-reflect.md](plugins/claude-reflect.md) |
| Code Review | claude-plugins-official | `/code-review:code-review` | [code-review.md](plugins/code-review.md) |
| Code Simplifier | claude-plugins-official | `/code-simplifier:code-simplifier` | [code-simplifier.md](plugins/code-simplifier.md) |
| Frontend Design | claude-plugins-official | `/frontend-design:frontend-design` | [frontend-design.md](plugins/frontend-design.md) |
| Playground | claude-plugins-official | `/playground:playground` | [playground.md](plugins/playground.md) |
| PR Review Toolkit | claude-plugins-official | `/pr-review-toolkit:review-pr` | [pr-review-toolkit.md](plugins/pr-review-toolkit.md) |
| Ralph Loop | claude-plugins-official | `/ralph-loop:ralph-loop` | [ralph-loop.md](plugins/ralph-loop.md) |

---

## Agents (9)

Built-in agent types available via the Agent tool.

| Agent | Subagent Type | Purpose | Doc |
|-------|--------------|---------|-----|
| Claude Code Guide | `claude-code-guide` | Answer questions about Claude Code itself | [claude-code-guide.md](agents/claude-code-guide.md) |
| Debugger | `debugger` | Root-cause analysis | [debugger.md](agents/debugger.md) |
| Explore | `explore` | Fast codebase search | [explore.md](agents/explore.md) |
| General Purpose | `general-purpose` | Default — research, multi-step tasks | [general-purpose.md](agents/general-purpose.md) |
| Git | `git` | Branching, commits, PRs | [git.md](agents/git.md) |
| Plan | `plan` | Architecture and implementation planning | [plan.md](agents/plan.md) |
| Refactor | `refactor` | Code restructuring | [refactor.md](agents/refactor.md) |
| Reviewer | `reviewer` | Code review (correctness, security, perf) | [reviewer.md](agents/reviewer.md) |
| Statusline Setup | `statusline-setup` | Configure status line | [statusline-setup.md](agents/statusline-setup.md) |

---

## Skills

### Global Skills — Claude Code (9)

| Skill | Command | Type | Doc |
|-------|---------|------|-----|
| Architecture | `/architecture` | Task | [architecture.md](skills/architecture.md) |
| Explain Code | `/explain-code` | Task | [explain-code.md](skills/explain-code.md) |
| Handoff | `/handoff` | Task | [handoff.md](skills/handoff.md) |
| PDF Screenshot | — | Task | [pdf-screenshot.md](skills/pdf-screenshot.md) |
| Plan | `/plan` | Orchestration | [plan.md](skills/plan.md) |
| Review Security | `/review-security` | Task | [review-security.md](skills/review-security.md) |
| Scaffold Project | `/scaffold-project` | Orchestration | [scaffold-project.md](skills/scaffold-project.md) |
| Today | `/today` | Task | [today.md](skills/today.md) |
| UI UX Pro Max | — | Task | [ui-ux-pro-max.md](skills/ui-ux-pro-max.md) |

### Global Commands — Claude Code

| Command | What It Does | Doc |
|---------|-------------|-----|
| `/architecture` | Regenerate ARCHITECTURE.md | [architecture.md](skills/architecture.md) |
| `/branch` | Create feature branch from main | [branch.md](skills/branch.md) |
| `/commit` | Conventional commit | [commit.md](skills/commit.md) |
| `/fix-pipeline` | Fetch CI logs and fix | [fix-pipeline.md](skills/fix-pipeline.md) |
| `/handoff` | Generate session handoff doc | [handoff.md](skills/handoff.md) |
| `/pr` | Create pull request | [pr.md](skills/pr.md) |
| `/push` | Stage, commit, push | [push.md](skills/push.md) |
| `/today` | Daily context setup | [today.md](skills/today.md) |
| `/gsd/*` | Full GSD suite (57 commands) | [gsd.md](skills/gsd.md) |

### HQ Project Skills (7)

| Skill | Command | What It Does | Doc |
|-------|---------|-------------|-----|
| Archive | `/archive` | Move project to archived state | [archive.md](skills/archive.md) |
| Audit Configs | `/audit-configs` | Detect config drift | [audit-configs.md](skills/audit-configs.md) |
| List Projects | `/list-projects` | Show registry with status | [list-projects.md](skills/list-projects.md) |
| Manage Registry | `/manage-registry` | Project registry CRUD | [manage-registry.md](skills/manage-registry.md) |
| Manage Skills | `/manage-skills` | Skill lifecycle management | [manage-skills.md](skills/manage-skills.md) |
| Setup Doctor | `/doctor` | Full setup health check | [setup-doctor.md](skills/setup-doctor.md) |
| Sync Learnings | `/sync` | Pull learnings, detect drift | [sync-learnings.md](skills/sync-learnings.md) |

### GSD Plugin (57 commands)

| Doc | Description |
|-----|-------------|
| [gsd.md](skills/gsd.md) | Full GSD workflow — plan, execute, verify, ship. 57 `/gsd:*` commands. |

### Library Skills — Knowledge (8)

| Skill | Category | When to Use | Doc |
|-------|----------|-------------|-----|
| Apache Camel | knowledge | Integration / routing projects | [apache-camel.md](skills/apache-camel.md) |
| Claude API | knowledge | Projects using Claude API directly | [claude-api.md](skills/claude-api.md) |
| Content Pipeline | knowledge | Content publishing / blog projects | [content-pipeline.md](skills/content-pipeline.md) |
| Ghost CMS | knowledge | Ghost CMS projects | [ghost-cms.md](skills/ghost-cms.md) |
| Next.js Patterns | knowledge | Next.js projects | [nextjs-patterns.md](skills/nextjs-patterns.md) |
| Pricing Domain | knowledge | CPQ / pricing engine projects | [pricing-domain.md](skills/pricing-domain.md) |
| Prisma Domain | knowledge | Prisma ORM projects | [prisma-domain.md](skills/prisma-domain.md) |
| Supabase Domain | knowledge | Supabase backend projects | [supabase-domain.md](skills/supabase-domain.md) |

### Library Skills — Task & Orchestration (5)

| Skill | Category | Notes | Doc |
|-------|----------|-------|-----|
| Dependency Audit | task | Any project with dependencies | [dependency-audit.md](skills/dependency-audit.md) |
| Markitdown | task | (global) | [markitdown.md](skills/markitdown.md) |
| Today | task | (global) | [today.md](skills/today.md) |
| PRD to Tickets | orchestration | (global) | [prd-to-tickets.md](skills/prd-to-tickets.md) |
| TDD | orchestration | (global) | [tdd.md](skills/tdd.md) |

---

## Cross-Reference: What's Installed Where

| Project | Client | MCPs | Skills/Commands |
|---------|--------|------|-----------------|
| **Global** | Claude Code | 9 (memory, sequential-thinking, context7, chrome-devtools, filesystem, github, jina-reader, pal, claude-peers) | 9 skills + 9 workflow commands |
| **Global** | OpenCode | 5 (perplexity, arxiv, osp-marketing-tools, pal, claude-peers) | 9 skills + 9 commands + 57 gsd commands |
| **hq** | Claude Code | Inherits global | 7 project skills + GSD (57 commands) |
| **your-project** | Claude Code | Project-specific + global | Library skills relevant to stack |
