# Apache Camel

- **Type:** Skill (Library)
- **Command:** N/A (loaded contextually)
- **Source:** hq library
- **Scope:** Library — used by camel-cpq
- **Category:** Knowledge
- **Status:** Active

## What It Does
Apache Camel YAML route design and Groovy transform patterns for Spring Boot. Covers route structure (YAML DSL), common endpoints (timer, direct, rest, file, http), Groovy transform blocks, error handling with onException, and project conventions specific to the camel-cpq-integration-framework (app_* directory structure, env.properties for credentials, reusable route templates).

## Used By
| Project | How Loaded |
|---------|------------|
| camel-cpq | Symlinked from library |

## Tips & Gotchas
- Each `app_*/` is a standalone integration task with `main.camel.yaml` as the entry point.
- Credentials live in `env.properties` -- never put them in routes or templates.
- Add `<log>` steps liberally -- Camel's log output is your debugger.
- Check `${body}` vs `${header.X}` -- body mutations are cumulative across steps.
- Use `repeatCount=1&delay=1000` on timers to avoid race conditions on startup.
- Test a new route by copying `_app_example/` and wiring in your route.
