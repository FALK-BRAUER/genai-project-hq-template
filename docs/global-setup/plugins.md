# Global Plugins — Reference

*All plugins installed globally on the your macOS account. Available in every Claude Code session.*

---

## Workflow & Automation

### Ralph Wiggum — Autonomous Iteration Loop

**Install:** `claude /plugin install ralph-wiggum@claude-plugins-official`
**Status:** Installed (2026-03-25)
**Installs:** 57K+
**What:** A Stop hook that re-feeds the prompt after Claude tries to exit. Creates a self-improving feedback loop — each iteration sees file changes from previous iterations.

**Known issue:** Stop hook has a permission error after install. Fix with:
```bash
chmod +x ~/.claude/plugins/marketplaces/claude-plugins-official/plugins/ralph-loop/hooks/stop-hook.sh
```

**Usage:**

```bash
# Basic batch task
/ralph-loop:ralph-loop "Add JSDoc to all functions in src/utils/" \
  --max-iterations 15 --completion-promise "DONE"

# TDD loop
/ralph-loop:ralph-loop "Implement user authentication.
Requirements:
- Email/password login with bcrypt
- JWT token generation and validation
- Refresh token rotation
- Rate limiting on login endpoint

Process: Write failing test → implement → run tests → fix → repeat.
Output <promise>DONE</promise> when all tests pass." \
  --max-iterations 30 --completion-promise "DONE"

# Bug fix loop
/ralph-loop:ralph-loop "Fix bug: checkout.submit times out after 5000ms.
Steps: 1. Reproduce 2. Root cause 3. Fix 4. Regression test 5. Verify
After 15 iterations if not fixed: document blocking issues.
Output <promise>FIXED</promise> when resolved." \
  --max-iterations 20 --completion-promise "FIXED"

# Overnight migration
/ralph-loop:ralph-loop "Migrate all API routes from Express to Next.js App Router.
For each route in src/api/:
1. Create equivalent route.ts in app/api/
2. Convert handler to Next.js format
3. Run tests
4. Delete old Express route
Output <promise>MIGRATION_COMPLETE</promise> when all routes migrated." \
  --max-iterations 50 --completion-promise "MIGRATION_COMPLETE"
```

**Best practices:**
- Always set `--max-iterations` — this is your real safety net
- Start conservative (10-15), increase after you see the pattern work
- Pick mechanical tasks with clear completion criteria: migrations, test coverage, documentation, type annotations
- Cost warning: 50-iteration loop on a large codebase can cost $50-100+ in API credits
- Monitor with `frankbria/ralph-claude-code` for dashboard, rate limiting, and intelligent exit detection

**Best for:** Well-defined, mechanical tasks. "Add tests for all uncovered functions." "Migrate from framework X to Y." "Add JSDoc to every file."

---

### GSD (Get Shit Done) — Spec-Driven Development

**Install:** `npx get-shit-done-cc --claude --global`
**Status:** Installed (2026-03-25) — 19 agents, 50+ commands
**What:** Meta-prompting and context engineering system. Prevents context rot by externalizing state into `.planning/` files, splitting work into small plans, executing each in fresh context, verifying against explicit goals.

**Core workflow:**

```
/gsd:new-project          → Define what you're building
  ↓
/gsd:discuss-phase N      → Lock in product decisions (Claude asks questions)
  ↓
/gsd:plan-phase N         → Research domain, create execution plan
  ↓
/gsd:execute-phase N      → Build it (atomic commits per task)
  ↓
/gsd:verify-work N        → Test and validate (creates fix plans if broken)
  ↓
Loop until done           → /gsd:complete-milestone
  ↓
/gsd:new-milestone        → Start next version
```

**All commands:**

```
/gsd:new-project          — Initialize with requirements discussion
/gsd:discuss-phase N      — Product decisions before planning (crucial)
/gsd:plan-phase N         — Research + execution plan
/gsd:execute-phase N      — Build with atomic commits per task
/gsd:verify-work N        — Test + UAT + fix plans
/gsd:complete-milestone   — Archive milestone, tag release
/gsd:new-milestone        — Start next version
/gsd:do "task"            — Ad-hoc task with GSD guarantees
/gsd:do "task" --full     — With plan-checking and verification
/gsd:do "task" --discuss  — Gather context first
/gsd:settings             — Configure models, workflow toggles
/gsd:health               — Check GSD project state
/gsd:health --repair      — Fix corrupted state
/gsd:map-codebase         — Use on existing projects first
```

**Why GSD matters:**
- **Context rot prevention:** Each phase runs in fresh context. State lives in `.planning/` files.
- **Atomic commits:** Every task gets its own commit. `git bisect` finds the exact failing change.
- **Discuss phase:** The non-obvious killer feature. Locks in product decisions BEFORE planning. Prevents Claude from making assumptions.
- **Model routing:** Assign different models to planning (Opus), execution (Sonnet), and verification (Sonnet) via `.planning/config.json`.

**Best for:** Complex multi-phase projects with product decisions. "Build a complete feature from requirements."

**GSD notes:**
- On existing projects, run `/gsd:map-codebase` first
- GSD installs its own CLAUDE.md rules — if they conflict with your project CLAUDE.md, yours wins
- Also works with OpenCode (`npx get-shit-done-cc --opencode --global`) and Codex (`npx get-shit-done-cc --codex --global`)

---

### Superpowers — Brainstorming, TDD, Debugging

**Install:** `claude /plugin install superpowers@obra`
**Status:** Skipped — redundant with current stack
**What:** Collection of enhanced capabilities — structured brainstorming, TDD workflows, systematic debugging, and skill authoring tools.

**Why skipped:** GSD's discuss-phase covers brainstorming, GSD's execute-phase + plan skill cover TDD, the debugger agent handles systematic debugging, and claude-reflect handles pattern discovery/skill authoring. No unique value-add.

---

### claude-reflect — Self-Improving Learning Loop

**Install:**
```bash
claude plugin marketplace add bayramannakov/claude-reflect
claude plugin install claude-reflect@claude-reflect-marketplace
```
**Status:** Installed (2026-03-25)
**Source:** bayramannakov/claude-reflect, MIT license
**What:** Captures corrections, patterns, and learnings during sessions. Queues them for review. Approved items are written directly to `CLAUDE.md` — so every future session benefits automatically. Can also auto-generate custom commands from patterns.

**Usage:**
- Works passively during normal sessions — no special invocation needed
- Run `/reflect` to review queued learnings
- Approve or reject each item
- Approved items persist in `CLAUDE.md`

**Why this over ClawdHub self-improving-agent:** claude-reflect writes to `CLAUDE.md` (which Claude Code reads natively). The ClawdHub skill writes to `.learnings/` files that Claude Code doesn't auto-load. Use ClawdHub version for OpenClaw only.

---

## When to Use Which Workflow

| Situation | Use | Why |
|-----------|-----|-----|
| Well-defined mechanical task | **Ralph Wiggum** | Iterate until done, no human in loop |
| Full feature from requirements | **GSD** | Structured phases prevent context rot |
| Quick TDD or brainstorm | **GSD** (`/gsd:fast`, `/gsd:quick`) | Lightweight GSD modes, no full ceremony |
| Multiple parallel workstreams | **Agent Teams** (native) | Build auth + frontend + tests simultaneously |
| Ralph inside GSD | **Both** | Use Ralph for mechanical subtasks within a GSD execution phase |
| Architecture or design decisions | **Manual** | Judgment-heavy work needs human oversight |

---

## Design & Frontend

### Frontend Design

**Install:** `claude /plugin install frontend-design@claude-plugins-official`
**Installs:** 96K+
**What:** Production-grade UI generation. Creates complete, styled components and pages.

**Best for:** "Build me a dashboard page" or "Create a settings form with validation."

---

### Playground

**Install:** `claude /plugin install playground@claude-plugins-official`
**Installs:** 96K+
**What:** Generates interactive HTML explorers with visual controls, live preview, and copyable prompt output. Templates: design playground, data explorer, concept map, document critique, diff review, code map.

**Usage:** `/playground create a design explorer for card components` — Claude generates a single HTML file, opens it in your browser. Adjust sliders and controls, see live preview, copy the generated prompt back into Claude for execution.

**Best for:** Client presentations, design exploration, architecture visualization. When text is a poor interface for decisions.

---

### Context7 Plugin

**Install:** `claude /plugin install context7@claude-plugins-official`
**Installs:** 71K+
**What:** Adds slash commands for live documentation lookup. Complements the Context7 MCP (which provides the raw tools).

**Tips:** Having both the MCP and the plugin gives you programmatic access (MCP) plus convenient slash commands (plugin).

---

## Code Quality

### Code Review

**Install:** `claude /plugin install code-review@claude-plugins-official`
**Installs:** 50K+
**What:** Multi-agent PR review. Security lens + performance lens + correctness lens.

**Best for:** Before merging PRs. Catches issues that single-pass review misses.

---

## Multi-Model Integration

Plugins that let Claude Code delegate tasks to external AI models (Qwen, Codex, Gemini, etc.) rather than doing everything on Claude.

### pal-mcp-server — Universal Model Bridge

**Repo:** github.com/BeehiveInnovations/pal-mcp-server
**Stars:** 11K+ | **Status:** Installed (2026-03-26)
**What:** MCP server that lets Claude Code call external models as tools. Currently wired to Alibaba DashScope (Qwen).
**Config:** `global-config/claude-code/mcp-servers.json` → `pal` entry. API key: `ALIBABA_CODING_PLAN_KEY` secret.

**Available models:**

| Alias | Resolves to | Context | Notes |
|-------|-------------|---------|-------|
| `qwen-plus` | qwen-plus | 131K | Primary. Use this by default. |
| `qwen` | qwen-plus | 131K | Short alias |
| `dashscope` | qwen-plus | 131K | Provider alias |

To add providers: set `GEMINI_API_KEY`, `OPENAI_API_KEY`, or `OPENROUTER_API_KEY` in the MCP env config. Run `mcp__pal__listmodels` to verify.

**Tools and when to use them:**

| Tool | What | When to reach for it |
|------|------|---------------------|
| `chat` | General conversation with external model | Second opinion on architecture, brainstorming alternatives, cross-checking Claude's reasoning |
| `codereview` | Structured multi-step code review | Independent review perspective before merging — catches blind spots Claude shares with itself |
| `debug` | Systematic debugging with external model | Stuck on a bug after Claude's own debugging — fresh eyes from a different model |
| `thinkdeep` | Extended reasoning on hard problems | Complex algorithm design, system architecture trade-offs, anything requiring deep deliberation |
| `challenge` | Force critical pushback on a claim | Sanity-check a contentious decision before committing — prevents groupthink |
| `planner` | Task planning and breakdown | Get an alternative implementation plan to compare against Claude's approach |
| `apilookup` | Live API/SDK documentation search | When Context7 doesn't have the library, or you need cutting-edge release notes |
| `clink` | Delegate to external CLI (Gemini, Codex) | Cross-AI review, or leveraging a CLI's unique strengths (Gemini for search, Codex for sandboxed execution) |
| `consensus` | Multi-model agreement check | High-stakes decisions — get multiple models to weigh in |
| `precommit` | Pre-commit validation | Final check before committing — external model reviews the diff |
| `listmodels` | Show configured models | Verify what's available after config changes |

**When NOT to use PAL:**
- Routine coding tasks — Claude handles these fine alone
- Simple file reads, searches, or edits — overhead of an external call isn't worth it
- When latency matters — external API round-trip adds seconds

**Best for:** Second opinions, cross-model validation, breaking out of Claude's reasoning patterns, and leveraging Qwen's strengths (Chinese language content, Alibaba ecosystem APIs).

### dispatch — Background AI Worker Farm

**Repo:** github.com/bassimeledath/dispatch
**Stars:** 320 | **Status:** Evaluate
**What:** Skill that dispatches subtasks to background AI workers. Multiplies effective context window by farming out work to cheaper models in parallel.
**Mechanism:** Slash command that spawns background worker processes calling external AI APIs.
**Why evaluate first:** Good for parallelizing mechanical tasks (tests, docs, boilerplate) on flat-rate Alibaba models.

### HydraTeams — Model-Agnostic Agent Teams

**Repo:** github.com/Pickle-Pixel/HydraTeams
**Stars:** 48 | **Status:** Watch
**What:** Translation proxy that makes Claude Code Agent Teams model-agnostic. Any model (GPT, Gemini, Ollama, DashScope) can be a teammate with full Claude Code tooling.
**Mechanism:** Proxy layer for the Agent Teams feature — real API calls to external models as team members.
**Why watch:** Small but architecturally interesting. Worth revisiting when Agent Teams becomes a primary workflow.

---

## Plugins to Evaluate Later

| Plugin | What It Does | When to Try |
|--------|-------------|-------------|
| `feature-dev` | Guided feature workflow (explorer + architect + reviewer agents) | Complex features |
| `hookify` | Create custom hooks from conversation patterns | Repetitive behavior to automate |
| `claude-code-templates` | 100+ pre-built agents, commands, hooks (aitmpl.com) | Bootstrapping new projects |

**Already installed (removed from evaluate list):**
- `code-simplifier` — installed 2026-03-25
- `pr-review-toolkit` — installed 2026-03-25
