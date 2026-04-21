# Content Pipeline

- **Type:** Skill (Library)
- **Command:** N/A (loaded contextually)
- **Source:** hq library
- **Scope:** Library — install in any content/Next.js project
- **Category:** Knowledge
- **Status:** Active

## What It Does
AI content pipeline patterns reference covering the full automated content workflow: RSS ingestion (rss-parser, deduplication by URL), article extraction (@mozilla/readability + JSDOM), AI summarisation (Claude for synthesis, cheaper models for classification, batched with concurrency limits), and multi-platform publishing (Ghost CMS first, then LinkedIn/Buffer from the Ghost post URL).

## Used By
| Project | How Loaded |
|---------|------------|
| your-content-project | Symlinked from library |

## Tips & Gotchas
- Each pipeline stage should fail independently -- a bad article should not kill the whole run.
- Track publish state in DB -- never publish twice.
- Implement idempotency so re-running the pipeline is safe.
- Respect rate limits: LinkedIn API is 100 requests/day per user token; Buffer is 2000 posts/month on standard plan.
- Batch AI requests with Promise.all and a concurrency limit rather than calling per-item in a loop.
