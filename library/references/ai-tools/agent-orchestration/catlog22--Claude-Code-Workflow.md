---
url: https://github.com/catlog22/Claude-Code-Workflow
stars: 1800
last_checked: 2026-04-15
last_commit: 2026-04-12
category: agent-orchestration
status: active
---
# Claude-Code-Workflow

> JSON-driven multi-agent cadence-team development framework with intelligent CLI orchestration (Gemini/Qwen/Codex/Claude), context-first architecture, and automated workflow execution.

## What's Inside
- Skill-based workflows: lite-plan, multi-cli-plan, workflow-plan, tdd-plan, test-fix, brainstorm
- Multi-CLI orchestration: auto-select between Gemini, Qwen, Codex, Claude based on task
- Team Architecture v2: role-based agents with inner loop execution and message bus protocol
- Queue scheduler: background execution service with API endpoints
- Terminal dashboard: multi-terminal grid with real-time execution monitoring
- Orchestrator Editor: React Flow-based visual workflow template editor
- A2UI: Agent-to-User interactive interface for communication
- Beat model: event-driven team cadence control with dynamic pipelines and parallel execution
- CodexLens: local semantic code search (FTS + semantic + hybrid + reranking)
- ACE Tool: Augment Context Engine for semantic code search integration

## Stack
- TypeScript (92.3%), HTML, JavaScript
- Node.js, React, React Flow
- Gemini CLI, Codex CLI, Qwen CLI, Claude Code
- SQLite (CodexLens FTS5), MCP server

## File Tree (key paths)
```
Claude-Code-Workflow/
├── .claude/
│   ├── agents/ (22 specialized agents)
│   ├── commands/ (5 categories: ccw, cli, issue, memory, workflow)
│   └── skills/ (37 modular skills)
├── ccw/
│   ├── src/
│   │   ├── commands/
│   │   ├── core/ (a2ui, auth, hooks, routes)
│   │   ├── mcp-server/
│   │   └── tools/
│   └── frontend/ (Terminal Dashboard, Orchestrator Editor)
├── codex-lens/ (local semantic search engine)
├── .codex/ (Codex skills)
├── .gemini/ (Gemini config)
├── .qwen/ (Qwen config)
├── templates/
└── docs/
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: yes (custom MCP server)
- Skills/agents: yes (37 skills, 22 agents)
- Hooks: yes (custom hook handlers)

## Notable
- 100 releases with active development (v7.2.29 as of March 2026)
- npm package available: `claude-code-workflow`
- Chinese documentation available (README_CN.md)
- Wisdom accumulation system for learnings/decisions/conventions
