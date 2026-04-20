# Global Skills & Commands — Reference

*Claude Code skills: `~/.claude/skills/` | OpenCode skills: `~/.config/opencode/skills/`*
*OpenCode commands: `~/.config/opencode/commands/`*

---

## Planning Skill

**Location:** `~/.claude/skills/plan/SKILL.md`
**Type:** Orchestration
**Triggers:** New feature requests, refactoring tasks, system design decisions, ambiguous prompts, any task touching 3+ files.

**Workflow:**
1. **Understand** — Restate the task clearly. Confirm constraints. Identify missing information.
2. **Plan** — Produce a structured execution roadmap. Keep it concise but complete.
3. **Execute** — Follow the plan step by step.
4. **Verify** — Check the result against the original request.

Always produces the plan BEFORE starting implementation. If unclear, asks one clarifying question then plans.

**When to use:** This should be your default for anything non-trivial. The global CLAUDE.md rule triggers it automatically for tasks touching 3+ files.

---

## Explain Code Skill

**Location:** `~/.claude/skills/explain-code/SKILL.md`
**Type:** Task
**Triggers:** "How does this work?", "Explain this code", understanding unfamiliar code.

**What it does:**
1. Starts with an **analogy** — compares the code to something from everyday life
2. Draws a **diagram** — ASCII art showing flow, structure, relationships
3. **Walks through** the code step-by-step
4. Highlights a **gotcha** — common mistakes or misconceptions

**When to use:** Onboarding onto a new codebase, reviewing unfamiliar code, preparing explanations for others.

---

## Architecture Diagram Skill

**Location:** `~/.claude/skills/architecture/SKILL.md`
**Type:** Orchestration
**Triggers:** Before starting feature work, after completing features, adding new modules/routes/data models.

**Before starting work:**
1. Reads ARCHITECTURE.md in the project root
2. Understands current system structure, data model, and flows
3. Checks if planned changes are consistent with existing architecture

**After completing work:**
1. Updates relevant Mermaid diagrams in ARCHITECTURE.md:
   - System Overview (flowchart)
   - Data Model (erDiagram)
   - User Flows (sequenceDiagram)
   - API Route Map (flowchart)
   - Component Tree (graph)
2. Only updates diagrams affected by changes
3. Commits ARCHITECTURE.md alongside code changes

**If no ARCHITECTURE.md exists:** Generates one by analyzing the codebase.

**When to use:** Every project should have an ARCHITECTURE.md. This skill maintains it automatically.

---

## Handoff Skill

**Location:** `~/.claude/skills/handoff/SKILL.md`
**Type:** Task
**Triggers:** Before `/clear` on long-running work, ending a work session, switching to a different task.

**Generates a handoff document with:**
- What We Did — summary of changes
- Decisions Made — architectural/design decisions with rationale
- Current State — what works, what's partial, what's broken
- What's Left — remaining tasks in priority order
- Context That Matters — domain knowledge, gotchas, constraints for next session
- Files Changed — list with one-line descriptions

Saves as `HANDOFF-{feature-name}.md` in the project root.

**When to use:** Before ending any significant work session. Critical for session continuity — Claude loses context on `/clear`, but the handoff document preserves it.

---

## Security Review Skill

**Location:** `~/.claude/skills/review-security/SKILL.md`
**Type:** Task
**Triggers:** PR reviews, pre-deployment, working with auth/payments/user data.

**Checks for:**
1. Input validation — Zod or equivalent for all user inputs
2. Auth boundaries — protected routes actually protected
3. Secrets — no API keys, passwords, or tokens in code
4. SQL injection — parameterized queries / ORM only
5. XSS — user-generated content sanitized
6. CSRF — state-changing endpoints protected
7. Dependencies — `npm audit` for known vulnerabilities
8. Error handling — no internal details leaked
9. Rate limiting — public endpoints protected
10. Logging — sensitive values excluded

Reports findings as ✅ pass, ⚠️ warning, or ❌ critical.

**When to use:** Before every deployment. Before merging PRs that touch auth, payments, or user data.

---

## Scaffold Project Skill (from Vibe HQ)

**Location:** Symlinked from `~/hq/.claude/skills/scaffold-project/`
**Type:** Orchestration
**Triggers:** `/new-project` command

Bootstraps new projects from templates in `~/hq/templates/`. Inherits best practices, CLAUDE.md structure, recommended MCPs, and skill configuration from the HQ.

**When to use:** Every time you start a new project. Don't configure from scratch — use the template.

---

## UI UX Pro Max (from scouting — March 25)

**Location:** `~/.claude/skills/ui-ux-pro-max/SKILL.md`
**Type:** Task
**Source:** @tenfoldmarc / @claudeprotips, 3,639 likes, MIT license

Design intelligence — searchable database of UI styles, color palettes, font pairings, chart types, and UX guidelines. Build beautiful interfaces with AI-powered design recommendations.

**When to use:** Any frontend work where you need design decisions. "What color palette works for a fintech dashboard?" "Which chart type for time-series data?" "Font pairing for a professional SaaS app."

**Pairs with:**
- **Frontend Design plugin** — for generating the actual components
- **Magic MCP** — for AI-powered component generation
- **Playground plugin** — for interactive design exploration

---

## Self-Improvement — claude-reflect plugin (recommended for Claude Code)

**Install:**
```bash
claude plugin marketplace add bayramannakov/claude-reflect
claude plugin install claude-reflect@claude-reflect-marketplace
```
**Type:** Plugin (always active)
**Source:** bayramannakov/claude-reflect, MIT license.

Purpose-built for Claude Code's self-improvement loop. During sessions, it captures corrections ("No, that's wrong..."), patterns, and learnings. You review queued items with `/reflect` and approve what should persist — approved learnings are written directly into `CLAUDE.md`, so every future session benefits automatically.

**Why this over ClawdHub's self-improving-agent:** claude-reflect writes to `CLAUDE.md` which Claude Code reads natively on every session start. The ClawdHub skill writes to `.learnings/` files that Claude Code doesn't auto-load — the loop doesn't close without extra plumbing. Use ClawdHub's version for OpenClaw only.

**Workflow:**
1. Work normally — claude-reflect observes corrections and patterns in the background
2. Run `/reflect` to review queued learnings
3. Approve or reject each item
4. Approved items are written to `CLAUDE.md` and optionally generate custom commands

---

## self-improving-agent (ClawdHub — OpenClaw only)

**Source:** ClawdHub v1.0.2, by @pskoett. #1 recommended ClawdHub skill.
**Status:** Skipped for Claude Code. Use claude-reflect instead (see above).

Designed for OpenClaw. Logs to `.learnings/` files (ERRORS.md, LEARNINGS.md, FEATURE_REQUESTS.md). Works technically in Claude Code but the `.learnings/` directory isn't auto-loaded, so learnings don't feed back into future sessions without manual intervention.

Keep this for the your agent account only.

---

---

## OpenCode Commands

OpenCode doesn't auto-trigger skills from AGENTS.md the same way Claude Code does. Skills are invoked by prompt. Commands (`~/.config/opencode/commands/`) are the equivalent of Claude Code's slash commands.

### Global Commands

| Command | What It Does | Notes |
|---------|-------------|-------|
| `/handoff` | Generate session handoff doc | Invokes handoff skill |
| `/architecture` | Regenerate/update/check ARCHITECTURE.md | Mirrors Claude Code command |
| `/branch` | Create feature branch from main | Mirrors Claude Code command |
| `/commit` | Conventional commit with auto message | Uses haiku model for speed |
| `/fix-pipeline` | Fetch CI logs and fix failing pipeline | Mirrors Claude Code command |
| `/pr` | Create PR with auto title/description | Mirrors Claude Code command |
| `/push` | Stage + commit + push in one step | Mirrors Claude Code command |
| `/today` | Daily context setup | Reads zz_handoffs/ instead of HANDOFF-*.md |

### GSD Commands

57 commands in `~/.config/opencode/commands/gsd/` — full GSD workflow suite. Invoke as `/gsd/do`, `/gsd/next`, `/gsd/plan-phase`, etc.

---

## Skills Quick Reference

### Claude Code

| Skill | Type | Trigger |
|-------|------|---------|
| plan | Orchestration | New features, design decisions, 3+ file tasks |
| architecture | Orchestration | Before/after feature work |
| explain-code | Task | "How does this work?" |
| handoff | Task | Before /clear, end of session |
| review-security | Task | PR review, pre-deployment, auth/payments |
| scaffold-project | Orchestration | /new-project command |
| ui-ux-pro-max | Task | Frontend design decisions |
| pdf-screenshot | Task | PDF pages with charts/diagrams |
| claude-reflect | Plugin | Always active — captures corrections, /reflect to review |

### OpenCode

| Skill | Trigger |
|-------|---------|
| plan | "plan this", 3+ file tasks |
| explain-code | "how does this work", "explain this" |
| handoff | `/handoff` command or "generate handoff" |
| review-security | "review security", before deployment |
| scaffold-project | "new project", "scaffold" |
| ui-ux-pro-max | Frontend design questions |
| pdf-screenshot | PDFs with visual content |
