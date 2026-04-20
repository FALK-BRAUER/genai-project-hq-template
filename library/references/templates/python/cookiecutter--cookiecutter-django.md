---
url: https://github.com/cookiecutter/cookiecutter-django
stars: 13453
last_checked: 2026-04-15
last_commit: 2026-03-11
category: python
status: active
---
# Cookiecutter Django

> Powered by Cookiecutter, Cookiecutter Django is a framework for jumpstarting production-ready Django projects quickly.

## What's Inside
- 100% starting test coverage configuration
- 12-Factor app settings via django-environ
- Secure defaults with SSL/HTTPS configuration
- PostgreSQL database setup
- Celery for async task processing
- Sentry integration for error tracking
- Bootstrap frontend templates
- Docker and Docker Compose configurations
- GitHub Actions CI/CD workflows
- Heroku deployment ready
- Custom user model pre-configured
- Mailhog for local email testing
- Pre-commit hooks for code quality

## Stack
- Python 3.11+
- Django 5.x
- PostgreSQL
- Celery + Redis
- Docker
- Bootstrap 5
- pytest + coverage
- django-environ
- Whitenoise (static files)

## File Tree (key paths)
```
/
├── .github/
├── {{cookiecutter.project_slug}}/
│   ├── compose/
│   ├── config/
│   ├── docs/
│   ├── locale/
│   ├── requirements/
│   ├── tests/
│   ├── utility/
│   └── {{cookiecutter.project_slug}}/
├── cookiecutter.json
├── CONTRIBUTING.md
├── LICENSE
├── pyproject.toml
└── README.md
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: yes (AGENTS.md)
- Hooks: yes (cookiecutter hooks)

## Notable
- One of the most popular Django project templates (13k+ stars)
- Actively maintained with regular Django version updates
- Includes comprehensive documentation and troubleshooting guides
