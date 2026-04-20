---
url: https://github.com/crewAIInc/crewAI-examples
stars: 2100
last_checked: 2026-04-15
last_commit: 2025-08-12
category: finance
status: active
---
# crewAI-examples

> A collection of examples that show how to use CrewAI framework to automate workflows.

## What's Inside
- Full CrewAI applications across multiple domains (content creation, business, research, travel, recruitment)
- Flows for multi-crew orchestration with state management and dynamic routing
- Integration examples (LangGraph, Azure OpenAI, NVIDIA models)
- Industry-specific implementations including stock analysis with SEC EDGAR data integration
- Complete project structures with YAML configuration for agents and tasks
- Training capabilities for agents with custom knowledge bases
- Jupyter notebooks for interactive exploration and learning
- Starter template for new CrewAI projects

## Stack
- Python (10.1%), Jupyter Notebook (82.5%), HTML (7.2%)
- CrewAI framework (v0.152.0)
- UV package management
- External APIs (SEC EDGAR, various business APIs)

## File Tree (key paths)
```
crewAI-examples/
├── crews/
│   ├── stock_analysis/
│   ├── marketing_strategy/
│   ├── job-posting/
│   ├── recruitment/
│   ├── game-builder-crew/
│   └── [20+ more examples]
├── flows/
│   ├── content_creator_flow/
│   ├── email_auto_responder_flow/
│   ├── lead-score-flow/
│   ├── meeting_assistant_flow/
│   └── [6 flow examples]
├── integrations/
│   ├── CrewAI-LangGraph/
│   ├── azure_model/
│   └── nvidia_models/
└── notebooks/
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: yes (CrewAI agents)
- Hooks: no

## Notable
- Official CrewAI examples repository with structured learning path (beginners → intermediate → advanced)
- Demonstrates real-world patterns: multi-agent collaboration, external API integration, human-in-the-loop
- Uses YAML for agent/task definitions, showcases Tools integration with APIs, databases, file systems
- GitHub Actions workflows for CI/CD automation
