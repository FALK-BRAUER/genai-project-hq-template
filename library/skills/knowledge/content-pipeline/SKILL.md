---
name: content-pipeline
description: AI content pipeline patterns — RSS ingestion, article extraction, AI summarisation, multi-model routing, and CMS publishing. Reference when building or debugging automated content workflows.
---

## Pipeline Stages

### 1. Ingest (RSS + Web)
```typescript
import Parser from 'rss-parser';
const parser = new Parser();
const feed = await parser.parseURL('https://example.com/feed.xml');
// feed.items[].title, .link, .pubDate, .content
```
- Deduplicate by URL — store seen URLs in DB
- Respect `pubDate` — skip items older than your window
- Use Firecrawl MCP or `@mozilla/readability` for full article extraction from URLs

### 2. Extract (Article Content)
```typescript
import { Readability } from '@mozilla/readability';
import { JSDOM } from 'jsdom';
const dom = new JSDOM(html, { url });
const article = new Readability(dom.window.document).parse();
// article.title, article.textContent, article.content
```

### 3. Summarise (AI)
- Use Claude for synthesis and editorial quality
- Use cheaper models (Haiku, Gemini Flash) for classification and tagging
- Batch requests — don't call AI per-item in a loop; use Promise.all with concurrency limit
- Always include source URLs in the prompt for citation

### 4. Publish (Ghost / LinkedIn / Buffer)
- Write to Ghost first (draft), then trigger social from the Ghost post URL
- Track publish state in DB — never publish twice
- Buffer API for LinkedIn scheduling — respect daily limits

## Error Handling
- Each stage should fail independently — a bad article shouldn't kill the whole run
- Log failures with source URL for manual review
- Implement idempotency — re-running the pipeline should be safe

## Rate Limits to Watch
- OpenAI: tier-dependent TPM limits — add exponential backoff
- Ghost Admin API: no hard rate limit but batch writes cautiously
- Buffer: 2000 posts/month on standard plan
- LinkedIn API: 100 requests/day per user token
