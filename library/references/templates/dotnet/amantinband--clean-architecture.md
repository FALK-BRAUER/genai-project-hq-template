---
url: https://github.com/amantinband/clean-architecture
stars: 1900
last_checked: 2026-04-15
last_commit: 2024-03-04
category: dotnet
status: active
---
# clean-architecture

> The ultimate clean architecture template for .NET applications — a reminder service demonstrating production-ready Clean Architecture.

## What's Inside
- Complete Clean Architecture with domain, application, infrastructure layers
- Role-based, permission-based, and policy-based authorization
- Domain Events with eventual consistency pattern
- Background services for email reminders
- Subcutaneous and integration test suites
- Docker Compose setup for local development

## Stack
- C# (99.3%), Dockerfile
- .NET Core
- Entity Framework Core
- FluentEmail for notifications

## File Tree (key paths)
```
.github/
.template.config/
.vscode/
assets/
requests/
src/
tests/
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: no
- Hooks: no

## Notable
- Comprehensive authorization system with mixing capability
- Eventual consistency middleware for domain event processing
- HTTP request files for API testing with REST Client extension
- Available as NuGet template package (Amantinband.CleanArchitecture.Template)
