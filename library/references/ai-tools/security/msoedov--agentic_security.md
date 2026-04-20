---
url: https://github.com/msoedov/agentic_security
stars: 1800
last_checked: 2026-04-15
last_commit: 2024-04-26
category: security
status: active
---
# agentic_security

> Agentic LLM Vulnerability Scanner / AI red teaming kit for detecting vulnerabilities in Agent Workflows and Large Language Models (LLMs), including protection against jailbreaks, fuzzing, and multimodal attacks.

## What's Inside
- Multimodal attack probing (text, images, audio inputs)
- Multi-step jailbreak simulation
- Comprehensive LLM fuzzing
- API integration and stress testing (HTTP/scan endpoints with POST /scan)
- RL-based adaptive attacks
- Self-probe API for testing
- Custom dataset support (CSV with prompt column)
- CI/CD integration for automated security checks
- MCP server support with OWASP MCP Risk Scanner integration
- Interactive UI dashboard with themes and toasts
- Crew agent support for multi-agent workflows
- Pydantic AI integration
- Error handling improvements and multimodal support

## Stack
- Python
- FastAPI
- Uvicorn
- Vue.js (UI)
- Poetry (dependency management)
- Hugging Face Datasets integration
- Docker support
- pytest (testing)

## File Tree (key paths)
```
agentic_security/
├── .github/
├── agentic_security/
│   ├── probe_data/
│   ├── probe_actor/
│   └── routes/
├── docs/
├── tests/
├── ui/
├── .pre-commit-config.yaml
├── CODE_OF_CONDUCT.md
├── Dockerfile
├── mkdocs.yml
├── pyproject.toml
├── Readme.md
└── test.http
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- AGENTS.md: no
- MCP config: yes
- Skills/agents: no
- Hooks: no

## Notable
- Integrations with Garak, InspectAI, llm-adaptive-attacks
- Dynamic dataset mutations (stenography, encoding, obfuscation)
- Image and audio modality probing support
- 1,979 workflow runs with active development
- Apache 2.0 license
