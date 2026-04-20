---
url: https://github.com/go-kratos/kratos-layout
stars: 471
last_checked: 2026-04-15
last_commit: 2025-12-15
category: go
status: active
---
# go-kratos/kratos-layout
> A clean and production-ready project template for building Go microservices with Kratos.

## What's Inside
- Kratos microservices framework project structure
- API definition with protobuf
- Wire dependency injection setup
- Docker containerization
- Makefile automation for code generation
- OpenAPI/Swagger specification
- Config management with YAML

## Stack
- Go (73%)
- Kratos framework
- Protocol Buffers
- Wire (Google DI)
- Makefile
- Docker

## File Tree (key paths)
```
.
├── api/
│   └── helloworld/v1/
├── cmd/
│   └── server/
├── configs/
├── internal/
│   ├── biz/
│   ├── data/
│   ├── conf/
│   ├── server/
│   └── service/
├── third_party/
├── .github/workflows/
├── Dockerfile
├── LICENSE
├── Makefile
├── README.md
├── go.mod
└── openapi.yaml
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: no
- Hooks: no

## Notable
- Official Kratos framework template
- 24 releases (latest v2.9.2 Dec 2025)
- 158 commits
- Used via `kratos new` command for project scaffolding
