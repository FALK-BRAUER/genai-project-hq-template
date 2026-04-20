---
url: https://github.com/thombergs/buckpal
stars: 2500
last_checked: 2026-04-15
last_commit: 2024-10-09
category: java
status: active
---
# thombergs/buckpal

> An example approach for implementing a Clean/Hexagonal Architecture - companion to "Get Your Hands Dirty on Clean Architecture"

## What's Inside
- Complete web application in Hexagonal Architecture style
- Domain layer independent of database/web concerns
- Use case implementations
- Web adapter (Spring MVC controllers)
- Persistence adapter (JPA repositories)
- Architecture boundary enforcement examples
- Testing strategies for architecture elements
- Mapping between boundaries
- Multi-module Gradle setup
- Updated to 2nd edition of the book

## Stack
- Java 17
- Spring Boot
- Spring MVC
- JPA, Hibernate
- Lombok
- Gradle (multi-module)
- JUnit 5, Mockito

## File Tree (key paths)
```
buckpal/
├── .github/workflows/
├── gradle/wrapper/
├── img/
├── src/
│   ├── account/
│   ├── common/
│   └── web/
├── build.gradle
├── gradlew
└── README.md
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: no
- Hooks: no

## Notable
- Companion code for Tom Hombergs' Clean Architecture book
- Practical, production-ready implementation (not just theory)
- Updated for 2nd edition (2024)
- Companion articles on reflectoring.io
- Endorsed by Spring contributors and architecture experts
