---
url: https://github.com/rohitghatol/spring-boot-microservices
stars: 1800
last_checked: 2026-04-15
last_commit: 2024-07-30
category: java
status: active
---
# rohitghatol/spring-boot-microservices

> Spring Boot Template for Micro services Architecture with Zuul API Gateway, OAuth 2.0, Eureka, and Hystrix

## What's Inside
- Config Server (centralized configuration)
- Eureka Server (service discovery)
- OAuth2 Authorization Server
- User, Task, Comments microservices
- Zuul API Gateway
- Angular web portal (SPA)
- Hystrix circuit breaker implementation
- Docker containerization
- Netflix OSS stack integration

## Stack
- Java 8+
- Spring Boot 1.2.x (outdated)
- Spring Cloud
- Spring OAuth 2.0
- Netflix Eureka, Zuul, Hystrix, Ribbon
- Angular (frontend)
- Docker
- Gradle

## File Tree (key paths)
```
spring-boot-microservices/
├── api-gateway/
├── auth-server/
├── comments-webservice/
├── config-server/
├── task-webservice/
├── user-webservice/
├── web-portal/
├── webservice-registry/
├── images/
├── docker-compose.yml
└── build-all-projects.sh
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: no
- Hooks: no

## Notable
- NO LONGER ACTIVELY MAINTAINED - out-of-sync with latest Spring Boot/Spring Cloud
- Author recommends forking microservices-basics-spring-boot instead
- Historical reference for Netflix OSS stack (Eureka, Zuul, Hystrix)
- Good architectural diagrams in /images folder
