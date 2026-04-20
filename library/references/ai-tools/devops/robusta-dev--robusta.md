---
url: https://github.com/robusta-dev/robusta
stars: 3000
last_checked: 2026-04-15
last_commit: 2026-04-06
category: devops
status: active
---
# robusta-dev/robusta

> Better Prometheus alerts for Kubernetes - smart grouping, AI enrichment, and automatic remediation. Note: This is Robusta Classic (rule-based engine). For AI-powered root cause analysis, see HolmesGPT.

## What's Inside
- Smart Grouping: Reduce notification spam with Slack threads
- AI Investigation: HolmesGPT integration for alert analysis
- Alert Enrichment: Pod logs and contextual data alongside alerts
- Self-Healing: Auto-remediation rules for common issues
- Advanced Routing: Team, namespace-based routing
- Problem-Detection without PromQL: Kubernetes-native alerts (OOMKills, failing Jobs)
- Change-Tracking: Correlate alerts with Kubernetes rollouts
- Auto-Resolve: Update Jira and external systems when alerts resolve
- 25+ Integrations: Slack, Teams, Jira, PagerDuty, Opsgenie, ServiceNow, Email, Webhook, Kafka, etc.

## Stack
- Python (98.8%)
- Poetry for dependency management
- Helm charts for Kubernetes deployment
- Docker containers
- pre-commit hooks

## File Tree (key paths)
```
robusta/
├── .claude/
│   └── skills/
│       └── patch-cves/
├── .github/
├── docs/
├── helm/
├── logos/
├── playbooks/
├── research/
│   └── volume_backups/
├── scripts/
├── src/
├── tests/
├── .flake8
├── .gitignore
├── .pre-commit-config.yaml
├── .python-version
├── ATTRIBUTION.md
├── CHANGELOG.md
├── CODING-CONVENTIONS.md
├── CONTRIBUTING.md
├── Dockerfile
├── LICENSE
├── README.md
├── build_and_test.sh
├── build_on_apple_m1.sh
├── build_release.sh
├── build_with_arm.sh
├── docs.Dockerfile
├── docs_autobuild.sh
├── mirrord.json
├── poetry.lock
├── pyproject.toml
├── run_runner_locally.sh
└── skaffold.yaml
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: yes (.claude/skills/patch-cves/)
- Hooks: yes (.pre-commit-config.yaml)

## Notable
- 272 releases, latest 0.34.1 (Mar 23, 2026)
- Part of Robusta platform (free Robusta UI available)
- Compatible with kube-prometheus-stack and Prometheus Operator
- MIT license
- Includes mirrord.json for local development with remote Kubernetes
