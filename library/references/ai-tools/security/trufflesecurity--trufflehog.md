---
url: https://github.com/trufflesecurity/trufflehog
stars: 25600
last_checked: 2026-04-15
last_commit: 2026-03-23
category: security
status: active
---
# trufflehog

> Find, verify, and analyze leaked credentials across Git repos, chats, wikis, logs, API platforms, object stores, and filesystems. Supports over 800 secret types with classification, validation via API logins, and detailed analysis.

## What's Inside
- 800+ credential detectors with active API verification
- Secret classification (AWS, Stripe, Cloudflare, Postgres, SSL keys, etc.)
- Validation against live APIs (removes false positives)
- Deep analysis for 20+ common credential types (permissions, resources, access)
- Multi-source scanning (Git, GitHub, GitLab, S3, GCS, Docker, filesystem, Jenkins, Elasticsearch, Postman, Hugging Face)
- GitHub Action and pre-commit hook support
- Driftwood technology for private key verification against millions of GitHub users and billions of TLS certificates
- Custom regex detector support (alpha)
- Generic JWT detection and verification
- Cross Fork Object Reference scanning (deleted commits)
- Binary, document, and other file format scanning
- Circle CI and Travis CI native support

## Stack
- Go (complete v3 rewrite)
- Docker
- GitHub Actions
- pre-commit hooks
- Cosign (artifact verification)

## File Tree (key paths)
```
trufflehog/
├── .captain/
├── .github/
├── assets/
├── docs/
├── examples/
├── hack/
├── pkg/
│   ├── detectors/
│   ├── engine/
│   └── sources/
├── proto/
├── scripts/
├── .goreleaser.yml
├── .pre-commit-config.yaml
├── Dockerfile
├── Makefile
├── action.yml
├── go.mod
└── main.go
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- AGENTS.md: no
- MCP config: no
- Skills/agents: no
- Hooks: yes (pre-commit)

## Notable
- 250K+ daily runs, 22.9K+ GitHub stars
- Enterprise version available (scans Jira, Slack, Confluence, Teams, SharePoint)
- Static canary token detection
- Exit code 183 for CI/CD failure on findings
- Pre-commit hooks prevent leaked keys before commits with `--since-commit HEAD --results=verified,unknown --fail`
