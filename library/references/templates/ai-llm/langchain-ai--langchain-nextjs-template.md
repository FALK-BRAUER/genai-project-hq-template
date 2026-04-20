---
url: https://github.com/langchain-ai/langchain-nextjs-template
stars: 2500
last_checked: 2026-04-15
last_commit: 2023-07-28
category: ai-llm
status: active
---
# langchain-nextjs-template
> LangChain.js + Next.js starter template showcasing chat, structured outputs, agents, and RAG

## What's Inside
- Simple chat interface with Vercel AI SDK streaming
- Structured LLM output generation
- Multi-step agent questions with LangGraph.js
- RAG with chains and vector stores
- RAG with agents and vector stores
- Preconfigured helpers (replaceable with custom LangGraph.js workflows)
- Bundle analysis tooling (ANALYZER=true yarn build)
- Hosted demo at langchain-nextjs-template.vercel.app

## Stack
- Next.js (App Router)
- TypeScript (96.7%)
- LangChain.js
- Vercel AI SDK
- LangGraph.js for agents
- OpenAI API integration

## File Tree (key paths)
```
langchain-nextjs-template/
├── app/
│   ├── api/
│   │   └── chat/
│   │       ├── route.ts
│   │       └── agents/
│   │           └── route.ts
│   ├── ai_sdk/
│   │   ├── agent/
│   │   └── tools/
│   ├── page.tsx
│   └── layout.tsx
├── .env.example
├── package.json
└── README.md
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: no
- Hooks: no

## Notable
- Free-tier compatible (RAG bundle ~37.32 KB, under Vercel's 1 MB limit)
- Last commit March 24, 2026 - actively maintained
- Uses gpt-4o-mini for cost-effective demonstrations
