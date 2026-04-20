# MCP Server Catalog

All project-specific MCP recipes install for **both Claude Code and OpenCode**. Recipes use `opencode-mcp-helper.sh` to write `.opencode/opencode.json` alongside `claude mcp add`.

## Global MCPs (installed on your account)

| MCP Server | Package | Key Required | Purpose |
|------------|---------|-------------|---------|
| GitHub | `@modelcontextprotocol/server-github` | GITHUB_TOKEN | Full GitHub integration — issues, PRs, branches, search |
| Memory | `@modelcontextprotocol/server-memory` | None | Persistent knowledge graph across sessions |
| Sequential Thinking | `@modelcontextprotocol/server-sequential-thinking` | None | Structured step-by-step reasoning |
| Context7 | `@upstash/context7-mcp` | Optional (free) | Live library documentation — eliminates hallucinated APIs |
| Chrome DevTools | `chrome-devtools-mcp` | None | Interactive browser debugging via DevTools Protocol |
| Filesystem | `@modelcontextprotocol/server-filesystem` | None (path-based) | Explicit file system access scoped to directories |

## Project-Specific MCPs (install per project)

| MCP Server | Package | Key Required | When to Use |
|------------|---------|-------------|-------------|
| PostgreSQL | `@modelcontextprotocol/server-postgres` | DATABASE_URL | Projects with PostgreSQL databases |
| Prisma | `npx prisma mcp` (built-in, Prisma CLI v6.6+) | None | Schema awareness, migrations, query execution, Prisma Studio — use in all Prisma projects |
| Supabase | `supabase-mcp` | SUPABASE_URL + KEY | Projects using Supabase backend |
| Vercel | `@vercel/mcp` | VERCEL_TOKEN | Projects deployed to Vercel |
| Notion | `@notionhq/mcp` | NOTION_TOKEN | Projects integrating with Notion |
| Firecrawl | `firecrawl-mcp` | FIRECRAWL_API_KEY | Projects that need web scraping/crawling |
| Next.js DevTools | `vercel/next-devtools-mcp` | None | Next.js projects — upgrades, cache components, docs search, browser testing, runtime diagnostics |

## Optional Global MCPs (not currently installed)

| MCP Server | Package | Key Required | Purpose |
|------------|---------|-------------|---------|
| Brave Search | `@brave/brave-search-mcp-server` | BRAVE_API_KEY (free) | Web search for docs, errors, news |
| Playwright | `@anthropic/mcp-server-playwright` | None | Headless browser automation and testing |
| Omnisearch | `mcp-omnisearch` | Per-backend | Multi-search aggregator (Tavily, Brave, Kagi, etc.) |
| SkillBoss | `@skillboss/mcp-server` | SKILLBOSS_API_KEY | Gateway to 95+ AI models and services |
