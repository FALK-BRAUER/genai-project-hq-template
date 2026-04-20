# Global Setup — Reference Handbook

*What's installed globally on the your macOS account and how to use it effectively.*
*Copy this folder to `~/hq/global-setup/` on your machine.*

---

## What This Folder Is

This is the user manual for your global Claude Code productivity stack. Everything here is available in every project — you don't configure it per project.

For **install instructions**, see `execution/001_basic_setup.md`.
For **planning docs** that explain the architecture decisions, see `planning/`.

---

## Documents

| File | What It Covers |
|------|---------------|
| [mcps.md](mcps.md) | Global MCP servers — what each does, when to use, tips |
| [plugins.md](plugins.md) | Workflow plugins — GSD, Ralph Wiggum, Superpowers, Frontend Design, etc. |
| [skills.md](skills.md) | Global skills — plan, explain-code, architecture, security review, handoff, UI UX Pro Max, self-improving-agent |
| [hooks.md](hooks.md) | Global hooks and settings.json — what fires when, how to customize |

---

## Quick Decision Guide

| I want to... | Use |
|--------------|-----|
| Build a full feature from requirements | GSD (`/gsd:new-project`) |
| Batch-process a mechanical task (migrations, docs, tests) | Ralph Wiggum (`/ralph-loop:ralph-loop`) |
| Brainstorm or debug with structure | Superpowers |
| Generate production UI components | Frontend Design plugin + UI UX Pro Max skill |
| Explore a design interactively | Playground plugin |
| Search the web | Brave Search MCP |
| Look up library docs (latest version) | Context7 MCP or plugin |
| Review a PR | Code Review plugin |
| Plan before coding | Planning skill (auto-triggers on 3+ file tasks) |
| Hand off session state | Handoff skill |
| Maintain architecture diagrams | Architecture skill (auto-reads/updates ARCHITECTURE.md) |
| Check security before deploy | Security Review skill |
| Learn from mistakes over time | self-improving-agent skill |

---

## What's Global vs. Project-Level

**Global** (installed once, available everywhere):
- All MCPs in `mcps.md`
- All plugins in `plugins.md`
- All skills in `skills.md`

**Project-level** (configure per project):
- PostgreSQL MCP (different DB per project)
- TDD skill (not every project needs strict TDD)
- Domain-specific skills (pricing rules, content workflow, etc.)
- Project-specific agents (backend, frontend, docs)
- Google Stitch MCP (frontend projects only)
