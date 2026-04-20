---
url: https://github.com/ThreeDotsLabs/wild-workouts-go-ddd-example
stars: 6300
last_checked: 2026-04-15
last_commit: 2022-06-08
category: go
status: active
---
# wild-workouts-go-ddd-example

> Go DDD example application. Complete project to show how to apply DDD, Clean Architecture, and CQRS by practical refactoring

## What's Inside
- Complete Go DDD (Domain-Driven Design) example
- Clean Architecture implementation
- CQRS (Command Query Responsibility Segregation)
- Event-driven architecture
- gRPC + OpenAPI definitions
- Frontend (Vue.js)
- Terraform for GCP infrastructure
- Docker configuration
- Integration tests with docker-compose
- 15+ accompanying articles on refactoring journey

## Stack
- Go, gRPC
- Firebase (Auth, Firestore)
- Google Cloud Run (serverless)
- Terraform, Docker
- Vue.js (frontend)

## File Tree (key paths)
```
/
├── .github/
├── api/
├── docker/
├── internal/
│   ├── common/
│   ├── trainer/
│   ├── trainings/
│   └── users/
├── scripts/
├── sql/
├── terraform/
├── tools/c4/
├── web/
└── docker-compose.yml
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: no
- Hooks: no

## Notable
- From ThreeDotsLabs - 15+ article series on refactoring
- Live demo: https://threedotslabs-wildworkouts.web.app/
- Shows evolution from "too modern" to DDD/CQRS architecture
- Includes C4 architecture diagrams
- Active Discord community for modern Go applications
- Uses go.work for multi-module workspace
