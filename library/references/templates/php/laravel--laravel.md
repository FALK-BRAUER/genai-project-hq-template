---
url: https://github.com/laravel/laravel
stars: 84100
last_checked: 2026-04-15
last_commit: 2025-05-15
category: php
status: active
---
# Laravel

> The official Laravel application skeleton — a clean, minimal starting point for new Laravel projects.

## What's Inside
- Standard Laravel directory structure (app, bootstrap, config, database, public, resources, routes, tests)
- Pre-configured service providers and middleware
- Default authentication scaffolding
- Environment configuration templates
- Vite bundler configuration for assets
- SQLite default for local development
- PHPUnit configuration with factory setup

## Stack
- PHP 8.4+
- Laravel 12.x
- Tailwind CSS 4.x
- Vite
- SQLite (local) / PostgreSQL, MySQL (production)
- Composer for dependency management

## File Tree (key paths)
```
/
├── .github/workflows/
├── app/
├── bootstrap/
├── config/
├── database/
├── public/
├── resources/
├── routes/
├── storage/
├── tests/
├── artisan
├── composer.json
├── package.json
├── phpunit.xml
└── vite.config.js
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: no
- Hooks: no

## Notable
- Source repository for `composer create-project laravel/laravel`
- Minimal by design — intentionally bare to avoid imposing architecture decisions
- Updated annually to match major Laravel releases
