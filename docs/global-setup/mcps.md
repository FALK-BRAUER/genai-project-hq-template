# Global MCP Servers — Reference

*MCPs installed globally on the your macOS account. Available in every session.*
*Claude Code: `~/.claude.json` | OpenCode: `~/.config/opencode/opencode.json`*

---

## GitHub

**Package:** `@modelcontextprotocol/server-github`
**Key:** `GITHUB_TOKEN` (fine-grained personal access token)

Full GitHub integration — issues, PRs, file contents, branches, search. 15 tools including `list_issues`, `create_issue`, `list_pull_requests`, `get_file_contents`, `create_branch`, `push_files`, `search_repositories`.

**When to use:** Any time you're working with GitHub — creating issues, reviewing PRs, searching repos, pushing code. Claude will use this automatically when you mention GitHub tasks.

**Tips:**
- Use fine-grained tokens with minimum permissions per org
- Don't use classic tokens

---

## Brave Search

**Package:** `@brave/brave-search-mcp-server`
**Key:** `BRAVE_API_KEY` (free — subscribe to "Data for AI" plan first, then generate key)
**Status:** Not installed — moved to backlog (not needed currently; Claude Code has built-in WebSearch)

Web search from Claude Code. 4 tools: `brave_web_search`, `brave_news_search`, `brave_image_search`, `brave_local_search`.

**When to use:** Looking up error messages, checking documentation, finding examples, researching tools, current events.

**Tips:**
- Subscribe to "Data for AI" plan BEFORE generating key — key without plan returns 401
- Free tier is generous for individual use

---

## Memory

**Package:** `@modelcontextprotocol/server-memory`
**Key:** None

Persistent knowledge graph that survives across sessions. Tools: `create_entities`, `create_relations`, `search_nodes`, `open_nodes`, `delete_entities`.

**When to use:** Project decisions, learned patterns, user preferences that should carry over between sessions. Architecture decisions, tech stack choices, naming conventions.

**Tips:**
- Store architectural decisions as entities with relations
- Use for cross-session context that CLAUDE.md is too static for
- Memory persists in `~/.claude/memory/` — back it up

---

## Sequential Thinking

**Package:** `@modelcontextprotocol/server-sequential-thinking`
**Key:** None

Forces step-by-step structured reasoning. Changes HOW Claude thinks, not WHAT it can access. Tools: `create_thought`, `thought_chain`.

**When to use:** Architecture decisions, complex debugging, multi-step planning, any situation where Claude's first instinct might be wrong.

**Tips:**
- Mention "think step by step" or "use sequential thinking" when you want Claude to engage this deliberately
- Most useful for architecture and debugging, less useful for simple code generation

---

## Context7

**Package:** `@upstash/context7-mcp`
**Key:** Optional (free at context7.com/dashboard for higher rate limits)

Fetches up-to-date, version-specific library documentation. Injects current APIs into the prompt so Claude doesn't hallucinate deprecated methods. Tools: `resolve-library-id`, `query-docs`.

**When to use:** Every time you're working with a library or framework. Eliminates the #1 vibe coding failure: hallucinated deprecated APIs.

**Tips:**
- Add `use context7` to prompts, or rely on the global CLAUDE.md rule: "Always use Context7 MCP when you need library/API documentation"
- Also available as a plugin (`/plugin install context7@claude-plugins-official`) which adds slash commands
- Remote HTTP option available (no npx needed): `claude mcp add --scope user --transport http context7 https://mcp.context7.com/mcp`

---

## Playwright

**Package:** `@anthropic/mcp-server-playwright`
**Key:** None

Browser automation — navigate, click, fill, screenshot. Uses accessibility snapshots (semantic), not visual screenshots. 7 tools: `playwright_navigate`, `playwright_screenshot`, `playwright_click`, `playwright_fill`, `playwright_evaluate`, `playwright_get_text`, `playwright_resize`.

**When to use:** Automated testing, TDD loops with browser verification, scraping, UI validation. Best for headless/CI use cases.

**Tips:**
- Mention "playwright mcp" explicitly in your first request — otherwise Claude may try to use bash to run Playwright CLI
- Pairs with Ralph Wiggum for automated test loops: Ralph iterates, Playwright verifies in the browser
- Headless by default — works headlessly without a display

---

## Chrome DevTools

**Package:** `chrome-devtools-mcp`
**Key:** None

Direct Chrome browser access via DevTools Protocol — navigate, read console, capture errors, fill forms, execute JS, inspect DOM. Runs in its own managed browser context (separate from your personal Chrome).

**When to use:** Interactive debugging — navigate to localhost:3000, submit forms, check console errors, inspect network requests. "Why is this page broken?" sessions.

**Tips:**
- Operates in its own browser context — cannot see your personal Chrome tabs
- Complements Playwright: **Playwright** = headless automated tests, **Chrome DevTools** = visible interactive debugging
- Claude Code also has a native `/chrome` command for the Claude in Chrome extension

---

## Filesystem

**Package:** `@modelcontextprotocol/server-filesystem`
**Key:** None (path-based)

Controlled file access — read, write, search, list directories. Scoped to `~/projects` and `~/hq`.

**When to use:** When Claude needs explicit file system access beyond the current project directory.

**Tips:**
- Only lists directories you've granted — never set `/`
- Paths configured at install time: `~/projects ~/hq`

---

## Magic MCP (from scouting — March 25)

**Package:** `@21st-dev/magic-mcp`
**Key:** API key from 21st.dev

AI-powered UI component generation. Generates production-ready components directly in Claude Code.

**When to use:** Any frontend project where you need UI components generated from descriptions.

**Tips:**
- Pairs well with UI UX Pro Max skill (design decisions) and Frontend Design plugin (full page generation)
- Source: @tenfoldmarc, 3,639 likes

---

## Perplexity

**Package:** `@perplexity-ai/mcp-server`
**Key:** `PERPLEXITY_API_KEY` (console.perplexity.ai)
**Installed in:** OpenCode (`~/.config/opencode/opencode.json`)
**Status:** Configured — API key pending

4 tools: `perplexity_search` (web search), `perplexity_ask` (conversational + web, sonar-pro), `perplexity_research` (deep research with citations, sonar-deep-research), `perplexity_reason` (step-by-step reasoning, sonar-reasoning-pro).

**When to use:** Cited research for blog posts, current events/news context, deep research queries that need source attribution. Replaces ad-hoc web search for content work. Also useful across consulting deliverables.

**Tips:**
- `perplexity_research` is the one to use for blog post research — it returns citations you can actually link to
- `perplexity_ask` for quick factual lookups
- Costs per query — don't use for things Perplexity isn't better at than built-in web search

---

## ArXiv

**Package:** `arxiv-mcp-server` (Python, via `uv tool run`)
**Key:** None
**Installed in:** OpenCode (`~/.config/opencode/opencode.json`)
**Storage:** `~/.config/opencode/mcp-storage/arxiv`

4 tools: `search_papers` (query with date/category filters), `download_paper` (by arXiv ID), `read_paper` (access downloaded content), `list_papers` (view local cache). Plus a `deep-paper-analysis` research prompt.

**When to use:** AI/tech blog posts referencing research, consulting work that needs paper citations, validating claims about model performance or architecture decisions.

**Tips:**
- Filter by `cs.AI`, `cs.LG` categories to stay in scope
- Papers are cached locally in `~/.config/opencode/mcp-storage/arxiv` — no re-download needed
- Pairs with Perplexity: ArXiv for academic citations, Perplexity for industry/news context

---

## OSP Marketing Tools

**Package:** `osp_marketing_tools` (Python, via `uvx --from git+...`)
**Key:** None
**Installed in:** OpenCode (`~/.config/opencode/opencode.json`)

5 tools: value map generator, meta information generator (title/description/slug), content editing codes (OSP semantic review), technical writing guide, on-page SEO guide.

**When to use:** Blog post editing passes, generating Ghost metadata (title, slug, excerpt), SEO optimization, any content that needs structured quality review.

**Tips:**
- Use "Apply OSP editing codes to this draft" for a structured content review
- Use "Generate OSP meta for this post" for title/slug/excerpt generation
- The editing codes system gives specific, actionable feedback — not vague suggestions
- Source: Open Strategy Partners' proven B2B tech content methodology

---

## Claude Peers

**Package:** `claude-peers-mcp` (Bun, stdio transport)
**Repo:** https://github.com/louislva/claude-peers-mcp
**Key:** None
**Installed:** Global (`~/.claude.json`, user scope)

Inter-session communication — Claude Code instances discover each other and exchange messages in real-time. SQLite broker on localhost:7899. Each session auto-registers and polls for inbound messages.

**When to use:** Running multiple Claude Code sessions across different projects (hq, your-project, your-project). Any instance can `list_peers` and `send_message` to coordinate without copy-paste.

**Tips:**
- Requires Bun runtime and `--dangerously-load-development-channels` flag (channels are dev feature)
- Localhost only — no cross-machine support
- Peers auto-set summaries of their work context (directory, branch, recent files)

---

## Optional MCPs (not installed by default)

| MCP | What | Key | When to install |
|-----|------|-----|----------------|
| Omnisearch | Multi-engine search (Tavily, Brave, Kagi, Perplexity, Jina) | Per-backend | If you need search diversity beyond Brave |
| SkillBoss | Gateway to 95+ AI models and services | SKILLBOSS_API_KEY | If you need model diversity (video gen, etc.) |
| Google Stitch MCP | Google's AI design-to-code | TBD | Frontend-heavy projects |

---

## Quick Reference

| MCP | Client | Key Required | What For |
|-----|--------|-------------|----------|
| GitHub | Claude Code | GITHUB_TOKEN | Issues, PRs, code search |
| Memory | Claude Code | None | Persistent knowledge graph |
| Sequential Thinking | Claude Code | None | Step-by-step reasoning |
| Context7 | Claude Code | Optional (free) | Live library docs |
| Playwright | Claude Code | None | Headless browser automation |
| Chrome DevTools | Claude Code | None | Interactive browser debugging |
| Filesystem | Claude Code | None | Controlled file access |
| PAL | Claude Code | None | Personal assistant |
| Jina Reader | Claude Code | None | Web page reading |
| Markitdown | Claude Code | None | Doc conversion |
| Perplexity | OpenCode | PERPLEXITY_API_KEY | Cited research, current context |
| ArXiv | OpenCode | None | Academic paper search |
| OSP Marketing Tools | OpenCode | None | Content editing, SEO metadata |
| Brave Search | — | BRAVE_API_KEY (free) | Web search (backlog) |
| Claude Peers | Claude Code | None | Inter-session communication |
| Magic MCP | — | 21st.dev key | AI component generation (backlog) |
| Google Search Console | blogs project | OAuth | SEO rankings (add when blog has traffic) |
