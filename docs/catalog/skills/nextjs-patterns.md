# Next.js Patterns

- **Type:** Skill (Library)
- **Command:** N/A (loaded contextually)
- **Source:** hq library
- **Scope:** Library — used by LinkedInOrganiser
- **Category:** Knowledge
- **Status:** Active

## What It Does
Next.js App Router patterns and conventions reference. Covers file conventions (page.tsx, layout.tsx, loading.tsx, error.tsx, not-found.tsx), server vs client component decision rules, data fetching patterns (fetch in server components, Server Actions for mutations, revalidatePath/revalidateTag), route handler conventions (app/api/*/route.ts with named exports), and metadata management.

## Used By
| Project | How Loaded |
|---------|------------|
| LinkedInOrganiser | Symlinked from library |

## Tips & Gotchas
- Default to server components -- they do not ship JS to the browser.
- Add `"use client"` only when you need useState, useEffect, event handlers, or browser APIs.
- Fetch data in server components and pass as props to client components.
- Never import server-only code in client components.
- Validate request body with Zod in route handlers.
- Avoid client-side fetching (useEffect + fetch) unless real-time updates are needed.
