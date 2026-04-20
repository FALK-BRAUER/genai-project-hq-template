---
url: https://github.com/drivendataorg/cookiecutter-data-science
stars: 9800
last_checked: 2026-04-15
last_commit: 2025-09-04
category: data-science
status: active
---
# Cookiecutter Data Science

> A logical, reasonably standardized but flexible project structure for doing and sharing data science work

## What's Inside
- Cookiecutter template for data science projects
- Standardized directory structure for data, models, notebooks, reports
- Makefile with convenience commands (make data, make train)
- pyproject.toml with package metadata and tool configuration
- Modular source code structure (config, dataset, features, modeling, plots)
- Jupyter notebook naming convention
- Documentation setup with MkDocs
- Support for multiple dataset storage backends (Azure, S3, GCS)
- pytest and unittest scaffolding options
- Ruff, flake8, black, isort linting options

## Stack
- Python 3.9+
- Cookiecutter templating
- MkDocs for documentation
- pytest, unittest for testing
- Ruff, flake8, black, isort for code quality
- pip, uv for package management

## File Tree (key paths)
```
ccds/
docs/
hooks/
tests/
{{ cookiecutter.repo_name }}/
  data/
    external/
    interim/
    processed/
    raw/
  docs/
  models/
  notebooks/
  references/
  reports/
    figures/
  {{ cookiecutter.module_name }}/
    modeling/
.github/workflows/
pyproject.toml
cookiecutter.json
Makefile
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: no
- Hooks: yes (hooks/ directory for cookiecutter hooks)

## Notable
- Version 2 requires new cookiecutter-data-science Python package
- Use `ccds` command instead of `cookiecutter` directly
- 185 commits, 6 releases (latest v2.3.0 on Jul 24, 2025)
- Used by 153+ projects on GitHub
- Supports uv package manager option
