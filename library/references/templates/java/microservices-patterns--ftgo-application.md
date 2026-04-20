---
url: https://github.com/microservices-patterns/ftgo-application
stars: 3700
last_checked: 2026-04-15
last_commit: 2024-10-09
category: java
status: active
---
# microservices-patterns/ftgo-application

> Example code for the book "Microservices Patterns" by Chris Richardson

## What's Inside
- FTGO (Food To Go) order management system
- 7 microservices: Consumer, Restaurant, Order, Kitchen, Accounting, Order History, API Gateway
- Saga pattern implementation (CreateOrderSaga, CancelOrderSaga, ReviseOrderSaga)
- Event sourcing with Eventuate framework
- CQRS view for order history
- Domain-Driven Design aggregates
- Apache Kafka messaging via Eventuate Tram
- Swagger UI for each service
- Docker Compose and Kubernetes deployments
- End-to-end test suite

## Stack
- Java 8+
- Spring Boot
- Eventuate Tram (sagas, event sourcing)
- Apache Kafka
- MySQL, DynamoDB
- Docker, Kubernetes
- Gradle
- Swagger/OpenAPI

## File Tree (key paths)
```
ftgo-application/
├── ftgo-accounting-service/
├── ftgo-consumer-service/
├── ftgo-order-service/
├── ftgo-kitchen-service/
├── ftgo-restaurant-service/
├── ftgo-order-history-service/
├── ftgo-api-gateway/
├── ftgo-api-gateway-graphql/
├── common-swagger/
├── deployment/kubernetes/
├── buildSrc/
└── docker-compose.yml
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: no
- Hooks: no

## Notable
- Reference implementation from Chris Richardson's "Microservices Patterns" book
- Demonstrates complex patterns: sagas, event sourcing, CQRS, API composition
- Requires significant memory (runs well on 16GB MacBook Pro)
- Chapter-by-chapter code mapping in README
