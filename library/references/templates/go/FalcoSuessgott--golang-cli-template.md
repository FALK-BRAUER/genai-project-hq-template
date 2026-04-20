---
url: https://github.com/FalcoSuessgott/golang-cli-template
stars: 76
last_checked: 2026-04-15
last_commit: 2023-02-03
category: go
status: active
---
# golang-cli-template

> A general purpose golang CLI template for Github and Gitlab

## What's Inside
- goreleaser with .deb, .rpm, and container releases
- Manpages and shell completions auto-generated
- golangci-lint for linting and formatting
- GitHub Actions (Lint, Test, Build, Release)
- GitLab CI configuration included
- Cobra CLI setup with tests
- Pre-commit hooks for validation
- GitHub Pages with jekyll-theme-minimal
- Makefile with documented targets
- Tools directory for dependency management

## Stack
- Go, Cobra
- goreleaser, golangci-lint
- GitHub Actions, GitLab CI
- Docker, pre-commit
- Jekyll (docs)

## File Tree (key paths)
```
/
├── .github/
├── assets/
├── cmd/
├── completions/
├── internal/
│   └── convert/
├── pkg/
│   └── example/
├── scripts/
├── tools/
├── Makefile
└── main.go
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: no
- Hooks: yes (pre-commit)

## Notable
- Follows standard Go project layout (cmd/, pkg/, internal/)
- Releases to Docker Hub and GHCR
- One-command install via curl script
- Demo app included: `golang-cli-template example 2 5 --add`
- Requires CODECOV_TOKEN, DOCKERHUB_TOKEN, DOCKERHUB_USERNAME secrets
