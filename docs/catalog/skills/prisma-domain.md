# Prisma Domain

- **Type:** Skill (Library)
- **Command:** N/A (loaded contextually)
- **Source:** hq library
- **Scope:** Library — used by LinkedInOrganiser
- **Category:** Knowledge
- **Status:** Active

## What It Does
Prisma schema design patterns and query optimization reference. Covers naming conventions (PascalCase models, camelCase fields), relation design (always define both sides, explicit @relation), indexing strategy (@@index for WHERE/ORDER BY, @@unique for business constraints, compound indexes with most selective field first), query patterns to avoid N+1 (use include/select), transaction best practices, and migration workflow.

## Used By
| Project | How Loaded |
|---------|------------|
| LinkedInOrganiser | Symlinked from library |

## Tips & Gotchas
- Always review generated SQL before applying: `npx prisma migrate dev --create-only`.
- Name migrations descriptively (e.g., `add_user_email_index`).
- Never edit applied migrations -- create new ones instead.
- Keep transactions short -- do not make API calls inside transactions.
- Use `$queryRaw` with proper parameterization for complex queries.
