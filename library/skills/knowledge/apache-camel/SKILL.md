---
name: apache-camel
description: Apache Camel YAML route design and Groovy transform patterns for Spring Boot. Reference when building or modifying Camel routes in the CPQ integration framework.
---

## Route Structure (YAML)
```yaml
- route:
    id: my-route
    from:
      uri: timer:start?repeatCount=1&delay=1000
      steps:
        - log: "Starting"
        - to: direct:fetch-data
        - to: direct:transform
        - to: direct:write-output
```

## Common Endpoints
| Endpoint | Use |
|---|---|
| `timer:name?repeatCount=1` | Run once at startup |
| `direct:name` | Synchronous in-process call |
| `rest:GET:/path` | REST endpoint |
| `file:output?fileName=result.json` | Write to file |
| `http:hostname/path` | HTTP call |

## Groovy Transform
```yaml
- transform:
    groovy: |
      def data = body
      // transform here
      return groovy.json.JsonOutput.toJson(result)
```

## Error Handling
```yaml
- onException:
    exception: java.lang.Exception
    steps:
      - log: "Error: ${exception.message}"
    handled:
      constant: true
```

## Project Conventions (camel-cpq-integration-framework)
- Each `app_*/` is a standalone integration task — `main.camel.yaml` is the entry point
- Credentials live in `env.properties` — never in routes or templates
- Reusable routes go in `templates/routes-generic/` — keep them parameterised
- Object-specific logic goes in `templates/routes-object-specific/`
- Test a new route by copying `_app_example/` and wiring in your route
- Run via `./exec-*.sh` which triggers Gradle build + Spring Boot launch

## Debugging Tips
- Add `<log>` steps liberally — Camel's log output is your debugger
- Use `direct:debug-dump` pattern to write intermediate state to a file
- Check `${body}` vs `${header.X}` — body mutations are cumulative
- `repeatCount=1&delay=1000` on timers avoids race conditions on startup
