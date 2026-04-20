---
url: https://github.com/vercel/ai-chatbot
stars: 20100
last_checked: 2026-04-15
last_commit: 2026-04-01
category: ai-llm
status: active
---
# Vercel AI Chatbot

> A full-featured, hackable Next.js AI chatbot built by Vercel

## What's Inside
- Next.js App Router with React Server Components and Server Actions
- AI SDK integration for unified LLM API access (OpenAI, Anthropic, Google, xAI)
- shadcn/ui components with Tailwind CSS and Radix UI primitives
- Neon Serverless Postgres for chat history persistence
- Vercel Blob for file storage
- Auth.js for authentication
- Redis for streaming and real-time features
- AI Gateway with Mistral, Moonshot, DeepSeek, OpenAI, xAI support

## Stack
- TypeScript, JavaScript, CSS
- Next.js 15 (App Router)
- AI SDK
- shadcn/ui, Radix UI, Tailwind CSS
- Neon Postgres, Vercel Blob, Redis

## File Tree (key paths)
```
app/
components/
hooks/
lib/
public/
tests/
artifacts/
.cursor/rules/
.github/workflows/
.vscode/
.env.example
drizzle.config.ts
package.json
tsconfig.json
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: yes (.cursor/rules directory)
- MCP config: no
- Skills/agents: no
- Hooks: no

## Notable
- Uses Vercel AI Gateway for unified model provider access with OIDC authentication
- Supports artifact generation and persistent chat shells
- Built by Vercel as an official template with 633 commits
- Playwright end-to-end tests included
