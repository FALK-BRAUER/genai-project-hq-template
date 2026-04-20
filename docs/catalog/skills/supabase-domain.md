# Supabase Domain

- **Type:** Skill (Library)
- **Command:** N/A (loaded contextually)
- **Source:** hq library
- **Scope:** Library — used by LinkedInOrganiser
- **Category:** Knowledge
- **Status:** Active

## What It Does
Supabase patterns — auth, database queries, real-time subscriptions, storage, RLS. Covers JS client usage, query chaining, Row Level Security policies, OAuth/session auth, real-time channels, storage buckets, and migrations.

## Used By
| Project | How Loaded |
|---------|------------|
| LinkedInOrganiser | Symlinked from library |

## Key Patterns
- Use `@supabase/supabase-js` client, not raw `pg`
- Chain `.select()`, `.eq()`, `.order()`, `.limit()`; use `.single()` or `.maybeSingle()`
- Handle errors: `const { data, error } = await supabase.from(...)`
- Server-side in Next.js: use `createServerClient()` from `@supabase/ssr`
- RLS enabled by default — service role key bypasses (admin only)

## Tips & Gotchas
- Always enable Row Level Security on tables that hold user data.
- Use the Supabase client library rather than raw SQL for standard operations.
- Check the Supabase documentation via Context7 MCP for current API patterns.
