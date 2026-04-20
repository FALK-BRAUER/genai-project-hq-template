---
url: https://github.com/arthurhenrique/cookiecutter-fastapi
stars: 706
last_checked: 2026-04-15
last_commit: 2025-05-02
category: python
status: active
---
# Cookiecutter FastAPI

> Cookiecutter template for FastAPI projects using Machine Learning, uv, GitHub Actions, and Pytests.

## What's Inside
- fastapi-users for authentication and user management
- Pydantic settings management
- CLI tool built with Typer
- Tortoise-ORM with aerich migrations (switchable to Beanie for MongoDB)
- Limit-offset pagination
- Email sending (aiosmtplib or Amazon SES)
- Optional Sentry integration
- Production-ready Dockerfile
- arq/saq for background task queues
- Optional Jinja2 HTML templates
- Health check API endpoints
- Pre-commit hooks configuration

## Stack
- Python 3.10+
- FastAPI
- uv (package manager)
- Tortoise-ORM or Beanie
- Pydantic
- Typer (CLI)
- Docker
- GitHub Actions (CI/CD)
- Pytest

## File Tree (key paths)
```
/
├── .github/
├── docs/example/
├── sample/pregnancy-model/
├── {{cookiecutter.project_slug}}/
│   ├── app/
│   ├── tests/
│   └── Dockerfile
├── cookiecutter.json
├── LICENSE
├── README.md
└── setup.py
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: yes (AGENTS.md)
- Hooks: no

## Notable
- Includes AGENTS.md for AI coding assistants
- Uses `uv` for fast Python package management
- Strong focus on async patterns throughout
- Includes ML project sample structure
