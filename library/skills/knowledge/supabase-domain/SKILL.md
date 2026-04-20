---
name: supabase-domain
description: Supabase patterns — auth, database queries, real-time subscriptions, storage, RLS. Reference when working with Supabase in any project.
---

## Setup
- Client: `@supabase/supabase-js`
- Store credentials in a secret manager (AWS Secrets Manager, env vars) — never hardcode
- Supabase MCP available for direct DB queries when needed

## Query Patterns
- Use the Supabase JS client for all queries — not raw `pg`
- Chain `.select()`, `.eq()`, `.order()`, `.limit()` for filtered queries
- Use `.single()` when expecting exactly one row — throws on zero or multiple
- Use `.maybeSingle()` when zero rows is a valid outcome
- Use `.upsert()` for insert-or-update patterns
- Handle errors explicitly: `const { data, error } = await supabase.from(...)`
- Use `.rpc()` for calling Postgres functions

## Auth
- Use Supabase Auth for session management: `supabase.auth.getSession()` server-side
- Row Level Security (RLS) is on by default — queries respect the session's user context
- For OAuth providers, handle via custom auth routes or Supabase's built-in OAuth flow
- Server-side: use `createServerClient()` from `@supabase/ssr` in Next.js

## Row Level Security (RLS)
- Always enable RLS on tables with user data
- Policies use `auth.uid()` to scope rows to the current user
- Service role key bypasses RLS — only use server-side for admin operations
- Test policies: query as anon, authenticated, and service role

## Real-time
- Use `supabase.channel()` for real-time subscriptions
- Prefer polling for admin/cron tasks — real-time for user-facing live updates
- Unsubscribe on component unmount to prevent memory leaks

## Storage
- Use Supabase Storage for file uploads (images, documents)
- Set bucket policies (public vs private) based on access requirements
- Use signed URLs for private files with expiry

## Migrations
- Use `supabase migration new` for schema changes
- Run `supabase db push` for development, `supabase db reset` to replay all migrations
- Keep migrations small and reversible
