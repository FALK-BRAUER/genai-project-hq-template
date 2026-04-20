---
url: https://github.com/microsoft/cookiecutter-rust-actix-clean-architecture
stars: 220
last_checked: 2026-04-15
last_commit: 2023-02-08
category: rust
status: active
---
# Cookiecutter Rust Actix Clean Architecture

> Cookiecutter template for Rust projects using Actix Web with clean/onion architecture patterns.

## What's Inside
- Onion/clean architecture structure
- Actix Web framework
- Diesel ORM for database operations
- Database migrations setup
- Docker support for local PostgreSQL
- Test containers integration
- Maintenance window support pattern
- Layered architecture (domain, application, infrastructure, presentation)
- Dependency injection patterns
- Error handling with custom error types

## Stack
- Rust (latest stable)
- Actix Web
- Diesel ORM
- PostgreSQL
- Docker
- Test containers
- Serde (serialization)
- Tokio (async runtime)

## File Tree (key paths)
```
/
├── {{cookiecutter.project_slug}}/
│   ├── src/
│   │   ├── domain/
│   │   ├── application/
│   │   ├── infrastructure/
│   │   └── presentation/
│   ├── migrations/
│   ├── tests/
│   └── Dockerfile
├── cookiecutter.json
├── docs/
├── SUPPORT.md
└── README.md
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: no
- Hooks: no

## Notable
- Microsoft Open Source project
- Good reference for clean architecture in Rust
- Last commit from 2023 — may need updates for latest Rust/Actix versions
- Includes documentation on onion architecture patterns
