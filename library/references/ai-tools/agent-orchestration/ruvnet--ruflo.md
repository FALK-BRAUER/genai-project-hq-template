---
url: https://github.com/ruvnet/ruflo
stars: 31800
last_checked: 2026-04-15
last_commit: 2026-04-11
category: agent-orchestration
status: active
---
# ruflo

> The leading agent orchestration platform for Claude — deploy intelligent multi-agent swarms, coordinate autonomous workflows, and build conversational AI systems with enterprise-grade architecture.

## What's Inside
- 60+ specialized agents across coding, testing, security, and DevOps domains
- Queen-led hierarchical swarm coordination for distributed agent management
- SONA self-optimization with sub-0.05ms adaptation and ReasoningBank pattern storage
- HNSW vector search with sub-millisecond retrieval
- RuVector PostgreSQL integration (61 microsecond search at 16,400 QPS)
- Three consensus algorithms: Raft, Byzantine Fault Tolerant, Gossip
- Agent Booster (WASM) enabling task execution under 1ms without LLM calls (352x speedup)
- Multi-provider LLM support: Claude, GPT, Gemini, Ollama with intelligent failover
- Flash Attention providing 2.49-7.47x speedup for attention-heavy workloads
- Native Claude Code / Codex integration
- RAG integration with enterprise-grade architecture

## Stack
- TypeScript, Node.js
- PostgreSQL, RuVector, HNSW
- WASM (Agent Booster)
- Claude, GPT, Gemini, Ollama APIs

## File Tree (key paths)
```
ruflo/
├── agents/ (60+ specialized agents)
├── swarm/ (swarm intelligence coordination)
├── consensus/ (Raft, BFT, Gossip implementations)
├── vector/ (HNSW, RuVector integration)
├── wasm/ (Agent Booster)
├── integrations/ (Claude Code, Codex)
├── docs/
└── examples/
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: yes (60+ agents)
- Hooks: no

## Notable
- 16K+ stars, highly active development (5939 commits since June 2025)
- Enterprise-grade with distributed swarm intelligence
- 30-50% token cost reduction through intelligent routing
- Gource visualization available showing full development history
