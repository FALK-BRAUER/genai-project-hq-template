---
name: prisma-domain
description: Prisma schema design patterns and query optimization. Reference when designing data models or writing database queries.
---

## Schema Design

### Naming Conventions
- Models: PascalCase singular (User, not Users)
- Fields: camelCase
- Enums: PascalCase with UPPER_SNAKE values
- Relations: descriptive names (authoredPosts, not posts when ambiguous)

### Relations
- Always define both sides of a relation
- Use `@relation` with explicit field and reference names
- Prefer `onDelete: Cascade` for child records, `SetNull` for optional refs

### Indexes
- Add `@@index` for fields used in WHERE clauses and ORDER BY
- Add `@@unique` for natural keys and business constraints
- Compound indexes: put the most selective field first

## Query Patterns

### Avoid N+1
- Use `include` for eager loading related data
- Use `select` to fetch only needed fields
- For complex queries, use `$queryRaw` with proper parameterization

### Transactions
- Use `$transaction` for multi-step operations that must succeed together
- Keep transactions short — don't do API calls inside transactions

### Migrations
- Always review generated SQL before applying: `npx prisma migrate dev --create-only`
- Name migrations descriptively: `add_user_email_index`
- Never edit applied migrations — create new ones
