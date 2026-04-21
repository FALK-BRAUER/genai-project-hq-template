# Ghost CMS

- **Type:** Skill (Library)
- **Command:** N/A (loaded contextually)
- **Source:** hq library
- **Scope:** Library — install in any content/Next.js project
- **Category:** Knowledge
- **Status:** Active

## What It Does
Ghost Admin API patterns reference for creating, updating, and publishing posts via `@tryghost/admin-api`. Covers setup with v5.0 API, core operations (create draft post, publish immediately, schedule a post, upload images), and key gotchas specific to the Ghost API.

## Used By
| Project | How Loaded |
|---------|------------|
| your-content-project | Symlinked from library |

## Tips & Gotchas
- Always pass `{ source: 'html' }` as second arg to `edit()` -- without it Ghost converts HTML to Lexical and corrupts formatting.
- `published_at` must be in the future for scheduling -- Ghost rejects past timestamps silently.
- Feature images must be uploaded to Ghost first -- external URLs work but may break on theme changes.
- Tags are matched by name (case-insensitive) -- new tags are auto-created.
- API key format is `id:secret` -- never split or modify it.
