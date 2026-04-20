# Catalog Index

*Complete inventory of MCPs, skills, plugins, and agents across all projects.*
*Last generated: 2026-03-30*

---

## MCP Servers (16)

### Global — Claude Code (8)

| MCP | Package | Status | Doc |
|-----|---------|--------|-----|
| Chrome DevTools | `chrome-devtools-mcp` | Active | [chrome-devtools.md](mcps/chrome-devtools.md) |
| Context7 | `@upstash/context7-mcp@latest` | Active | [context7.md](mcps/context7.md) |
| Filesystem | `@modelcontextprotocol/server-filesystem` | Active | [filesystem.md](mcps/filesystem.md) |
| GitHub | `@modelcontextprotocol/server-github` | Active | [github.md](mcps/github.md) |
| Jina Reader | `mcp-remote` → jina.ai | Broken | [jina-reader.md](mcps/jina-reader.md) |
| Memory | `@modelcontextprotocol/server-memory` | Active | [memory.md](mcps/memory.md) |
| PAL | `pal-mcp-server` (uvx) | Active | [pal.md](mcps/pal.md) |
| Sequential Thinking | `@modelcontextprotocol/server-sequential-thinking` | Active | [sequential-thinking.md](mcps/sequential-thinking.md) |

### Global — OpenCode (4)

| MCP | Package | Status | Doc |
|-----|---------|--------|-----|
| ArXiv | `arxiv-mcp-server` (uv) | Active | [arxiv.md](mcps/arxiv.md) |
| OSP Marketing Tools | `osp_marketing_tools` (uvx/git) | Active | [osp-marketing-tools.md](mcps/osp-marketing-tools.md) |
| PAL | `pal-mcp-server` (uvx/git) | Active | [pal.md](mcps/pal.md) |
| Perplexity | `@perplexity-ai/mcp-server` (npx) | Active | [perplexity.md](mcps/perplexity.md) |

### Project: your-project (4)

| MCP | Status | Doc |
|-----|--------|-----|
| FRED | Active | [fred.md](mcps/fred.md) |
| Interactive Brokers | Active (paper) | [interactive-brokers.md](mcps/interactive-brokers.md) |
| SEC EDGAR | Active | [sec-edgar.md](mcps/sec-edgar.md) |
| Yahoo Finance | Active | [yahoo-finance.md](mcps/yahoo-finance.md) |

### Project: your-project-2-gdrive (1)

| MCP | Status | Doc |
|-----|--------|-----|
| SignNow | Planned | [signnow.md](mcps/signnow.md) |

---

## Plugins (7)

All global scope, installed via Claude plugin marketplace.

| Plugin | Source | Commands | Doc |
|--------|--------|----------|-----|
| Claude Reflect | bayramannakov/claude-reflect | `/claude-reflect:reflect`, `/claude-reflect:reflect-skills`, `/claude-reflect:view-queue`, `/claude-reflect:skip-reflect` | [claude-reflect.md](plugins/claude-reflect.md) |
| Code Review | claude-plugins-official | `/code-review:code-review` | [code-review.md](plugins/code-review.md) |
| Code Simplifier | claude-plugins-official | `/code-simplifier:code-simplifier` | [code-simplifier.md](plugins/code-simplifier.md) |
| Frontend Design | claude-plugins-official | `/frontend-design:frontend-design` | [frontend-design.md](plugins/frontend-design.md) |
| Playground | claude-plugins-official | `/playground:playground` | [playground.md](plugins/playground.md) |
| PR Review Toolkit | claude-plugins-official | `/pr-review-toolkit:review-pr` | [pr-review-toolkit.md](plugins/pr-review-toolkit.md) |
| Ralph Loop | claude-plugins-official | `/ralph-loop:ralph-loop`, `/ralph-loop:cancel-ralph`, `/ralph-loop:help` | [ralph-loop.md](plugins/ralph-loop.md) |

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

## Skills (38)

### Global Skills — Claude Code (7)

| Skill | Command | Type | Doc |
|-------|---------|------|-----|
| Explain Code | `/explain-code` | Task | [explain-code.md](skills/explain-code.md) |
| Handoff | `/handoff` | Task | [handoff.md](skills/handoff.md) |
| Plan | `/plan` | Orchestration | [plan.md](skills/plan.md) |
| Review Security | `/review-security` | Task | [review-security.md](skills/review-security.md) |
| Scaffold Project | `/scaffold-project` | Orchestration | [scaffold-project.md](skills/scaffold-project.md) |
| UI UX Pro Max | — | Task | [ui-ux-pro-max.md](skills/ui-ux-pro-max.md) |
| PDF Screenshot | — | Task | [pdf-screenshot.md](skills/pdf-screenshot.md) |

### Global Skills — OpenCode (~/.config/opencode/skills/)

| Skill | Command | Notes |
|-------|---------|-------|
| Explain Code | invoked by prompt | Mirrors Claude Code global |
| Handoff | `/handoff` | Mirrors Claude Code global — now wired as command |
| PDF Screenshot | invoked by prompt | Mirrors Claude Code global |
| Plan | invoked by prompt | Mirrors Claude Code global |
| Review Security | invoked by prompt | Mirrors Claude Code global |
| Scaffold Project | invoked by prompt | Mirrors Claude Code global |
| UI UX Pro Max | invoked by prompt | Mirrors Claude Code global |

### OpenCode Global Commands (~/.config/opencode/commands/)

| Command | What It Does | Doc |
|---------|-------------|-----|
| `/handoff` | Generate session handoff doc | [handoff.md](skills/handoff.md) |
| `/architecture` | Regenerate ARCHITECTURE.md | [architecture.md](skills/architecture.md) |
| `/branch` | Create feature branch from main | [branch.md](skills/branch.md) |
| `/commit` | Conventional commit | [commit.md](skills/commit.md) |
| `/fix-pipeline` | Fetch CI logs and fix | [fix-pipeline.md](skills/fix-pipeline.md) |
| `/pr` | Create pull request | [pr.md](skills/pr.md) |
| `/push` | Stage, commit, push | [push.md](skills/push.md) |
| `/today` | Daily context setup | [today.md](skills/today.md) |
| `/gsd/*` | Full GSD suite (57 commands) | [gsd.md](skills/gsd.md) |

### Vibe-HQ Project Skills (7)

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

### Library Skills — Business Ops (6)

| Skill | Category | Used By | Doc |
|-------|----------|---------|-----|
| Accounting | business-ops | your-project-2-gdrive, contracts-work | [accounting.md](skills/accounting.md) |
| Branded Docs | business-ops | your-project-2-ventures | [branded-docs.md](skills/branded-docs.md) |
| Contracts | business-ops | LinkedInOrganiser, camel-cpq | [contracts.md](skills/contracts.md) |
| HR | business-ops | your-project-2-gdrive, contracts-work | [hr.md](skills/hr.md) |
| Legal Ops | business-ops | your-project-2-gdrive, contracts-work | [legal-ops.md](skills/legal-ops.md) |
| Solo Ops | business-ops | your-project-2-gdrive, contracts-work | [solo-ops.md](skills/solo-ops.md) |

### Library Skills — Knowledge (8)

| Skill | Category | Used By | Doc |
|-------|----------|---------|-----|
| Apache Camel | knowledge | camel-cpq | [apache-camel.md](skills/apache-camel.md) |
| Claude API | knowledge | LinkedInOrganiser | [claude-api.md](skills/claude-api.md) |
| Content Pipeline | knowledge | LinkedInOrganiser | [content-pipeline.md](skills/content-pipeline.md) |
| Ghost CMS | knowledge | LinkedInOrganiser | [ghost-cms.md](skills/ghost-cms.md) |
| Next.js Patterns | knowledge | LinkedInOrganiser | [nextjs-patterns.md](skills/nextjs-patterns.md) |
| Pricing Domain | knowledge | camel-cpq | [pricing-domain.md](skills/pricing-domain.md) |
| Prisma Domain | knowledge | LinkedInOrganiser | [prisma-domain.md](skills/prisma-domain.md) |
| Supabase Domain | knowledge | LinkedInOrganiser | [supabase-domain.md](skills/supabase-domain.md) |

### Library Skills — Task & Orchestration (4)

| Skill | Category | Used By | Doc |
|-------|----------|---------|-----|
| Dependency Audit | task | LinkedInOrganiser, camel-cpq | [dependency-audit.md](skills/dependency-audit.md) |
| Markitdown | task | Available globally | [markitdown.md](skills/markitdown.md) |
| PRD to Tickets | orchestration | Available globally | [prd-to-tickets.md](skills/prd-to-tickets.md) |
| TDD | orchestration | Available globally | [tdd.md](skills/tdd.md) |

### Project-Specific Skills (1)

| Skill | Project | Doc |
|-------|---------|-----|
| PAL (Investment Research) | your-project | [pal-your-project.md](skills/pal-your-project.md) |

---

## Cross-Reference: What's Installed Where

| Project | Client | MCPs | Skills/Commands | Hooks |
|---------|--------|------|-----------------|-------|
| **Global** | Claude Code | 8 (memory, sequential-thinking, context7, chrome-devtools, filesystem, github, jina-reader, pal) | 7 skills + 7 workflow commands | None |
| **Global** | OpenCode | 4 (perplexity, arxiv, osp-marketing-tools, pal) | 7 skills + 8 commands + 57 gsd commands | None |
| **hq** | Claude Code | Inherits global | 7 project skills + GSD (57 commands) | None |
| **blogs** | OpenCode | Inherits global | content-pipeline skill (pending) | None |
| **your-project** | Claude Code | 4 (yahoo-finance, IBKR, SEC EDGAR, FRED) + global | PAL investment research | None |
| **LinkedInOrganiser** | Claude Code | Inherits global | 6 library skills (claude-api, dependency-audit, ghost-cms, content-pipeline, nextjs-patterns, supabase-domain) | Prettier auto-format, Trufflehog pre-commit |
| **camel-cpq** | Claude Code | Inherits global | 3 library skills (pricing-domain, dependency-audit, apache-camel) | Trufflehog pre-commit |
| **contracts-work** | Claude Code | Inherits global | 5 business-ops skills | None |
| **your-project-2-ventures** | Claude Code | 1 (document-edit) + global | 6 business-ops skills (incl. branded-docs) | None |
| **your-project-2** (ops) | Claude Code | 3 (thunderbird-mcp, signnow, document-edit) + global | 6 business-ops skills (incl. branded-docs) | None |
