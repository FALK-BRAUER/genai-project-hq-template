# Global CLAUDE.md

## Identity
- I'm YOUR_NAME. YOUR_ROLE.
- Direct, technical communication. No buzzwords.
- YOUR_LOCATION-based, building YOUR_COMPANY.

## Coding Standards (Universal)
- TypeScript strict mode by default (production bugs from implicit any)
- Functional components with hooks (no class components)
- Conventional Commits for all git messages
- No console.log in production code — use structured logging
- Tests alongside source files: `*.test.ts`
- All code comments in English

## Behavior Rules
- When uncertain, ask — don't guess
- Update CLAUDE.md after significant architectural decisions
- Use the Planning Skill for any task touching 3+ files
- Write a FOR_ME.md explaining what you did and why after major features
- Never commit secrets, .env files, or API keys
- Always use Context7 MCP when you need library/API documentation, code generation, or setup steps

## Preferred Stack (Default)
- Frontend: Next.js (App Router), TypeScript, Tailwind CSS, shadcn/ui, Lucide icons
- Backend: Node.js, Next.js API routes or Express
- Database: PostgreSQL + Prisma, Redis for caching
- Testing: Vitest + React Testing Library, JSDOM
- Validation: Zod
- Animation: Framer Motion
- State: Zustand (lightweight) or Context API (minimal)
