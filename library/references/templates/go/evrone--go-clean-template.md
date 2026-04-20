---
url: https://github.com/evrone/go-clean-template
stars: 7500
last_checked: 2026-04-15
last_commit: 2026-04-05
category: go
status: active
---
# evrone/go-clean-template
> Clean Architecture template for Golang services

## What's Inside
- Clean Architecture implementation (Uncle Bob principles)
- Four server types: AMQP RPC, NATS RPC, gRPC, REST API (Fiber)
- Three complete domains: User Authentication, Task Management, Translation
- Dependency injection via constructors
- Database migrations with golang-migrate
- Integration test setup with Docker Compose
- Swagger documentation auto-generation
- Metrics integration with Prometheus

## Stack
- Go (97.7%)
- Fiber (web framework)
- gRPC/protobuf
- RabbitMQ, NATS
- PostgreSQL
- Squirrel (SQL query builder)
- Zerolog (logging)
- Testify (testing)

## File Tree (key paths)
```
.
├── cmd/app/
├── config/
├── docs/
│   └── proto/
├── integration-test/
├── internal/
│   ├── app/
│   ├── controller/
│   ├── entity/
│   ├── usecase/
│   └── repo/
├── migrations/
├── nginx/
├── pkg/
├── .github/
├── .env.example
├── .golangci.yml
├── docker-compose.yml
├── Dockerfile
├── Makefile
├── README.md
└── go.mod
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: no
- Hooks: no

## Notable
- 50 releases showing active maintenance (latest v1.16.0 Apr 2026)
- Multi-transport architecture (REST, gRPC, AMQP, NATS)
- Clean separation of business logic from infrastructure
- 537 commits with consistent updates
