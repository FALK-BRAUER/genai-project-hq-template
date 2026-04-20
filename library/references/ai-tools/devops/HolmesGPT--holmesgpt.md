---
url: https://github.com/HolmesGPT/holmesgpt
stars: 2193
last_checked: 2026-04-15
last_commit: 2026-04-10
category: devops
status: active
---
# HolmesGPT/holmesgpt

> Open-source AI agent for investigating production incidents and finding root causes. Works with any stack — Kubernetes, VMs, cloud providers, databases, and SaaS platforms. CNCF Sandbox Project.

## What's Inside
- Operator Mode: 24/7 background health checks with deployment verification and scheduled checks
- 40+ Data Sources: Prometheus, Grafana, Datadog, Kubernetes, Loki, Tempo, AWS, Azure, GCP, GitHub, Sentry, Splunk, Elasticsearch, Kafka, and more
- Bidirectional alert integrations: AlertManager, PagerDuty, OpsGenie, Jira
- Agentic loop for multi-source observability queries
- Memory-safe execution with per-tool limits and streaming
- Server-side filtering and JSON tree traversal for large datasets
- Support for any LLM provider (OpenAI, Anthropic, Azure, Bedrock, Gemini)

## Stack
- Python (81.5%)
- HTML/Jinja (12.3%)
- TypeScript (2.4%)
- Shell (1.4%)
- Poetry for dependency management
- Docker/Kubernetes deployment
- Helm charts

## File Tree (key paths)
```
holmesgpt/
├── .claude/
├── .github/
├── bin/
│   └── go-cve-rebuild/
├── docs/
├── examples/
├── experimental/
│   └── ag-ui/
├── helm/
├── holmes/
├── holmes_operator/
├── images/
├── loki/
├── scripts/
├── specs/
├── tests/
├── .dockerignore
├── .gitignore
├── .pre-commit-config.yaml
├── ADOPTERS.md
├── AGENTS.md
├── CLAUDE.md
├── CODE_OF_CONDUCT.md
├── CONTRIBUTING.md
├── Dockerfile
├── Dockerfile.operator
├── FEATURES.md
├── GOVERNANCE.md
├── LICENSE
├── MAINTAINERS.md
├── Makefile
├── README.md
├── SECURITY.md
├── config.example.yaml
├── datasource-catalog.json
├── docker-compose.yaml
├── holmes_cli.py
├── mkdocs.yml
├── poetry.lock
├── pyproject.toml
└── server.py
```

## AI-Readiness
- CLAUDE.md: yes
- .cursorrules: no
- MCP config: yes (GitHub MCP, Kubernetes Remediation MCP, Sentry MCP, etc.)
- Skills/agents: yes (AGENTS.md present)
- Hooks: yes (.pre-commit-config.yaml)

## Notable
- CNCF Sandbox Project with OpenSSF Best Practices certification
- Originally created by Robusta.Dev, major contributions from Microsoft
- 108 releases, latest 0.23.0 (Mar 26, 2026)
- Read-only by design, respects RBAC permissions
- No Kubernetes required - works with VMs, bare metal, cloud services
