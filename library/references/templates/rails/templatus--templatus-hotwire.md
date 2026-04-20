---
url: https://github.com/templatus/templatus-hotwire
stars: 232
last_checked: 2026-04-15
last_commit: 2026-04-15
category: rails
status: active
---
# Templatus Hotwire

> An opinionated template to build web applications with Ruby on Rails and Hotwire, following best practices.

## What's Inside
- Ruby on Rails 8.0 with Ruby 3.4
- Hotwire stack (Turbo + Stimulus)
- Phlex-Rails for object-oriented views
- Tailwind CSS 4
- ActionCable for WebSocket communication
- Sidekiq for background jobs
- PostgreSQL database
- Redis for caching and ActionCable
- TypeScript support
- Heroicons SVG icons
- Vite bundler with HMR
- Lookbook for ViewComponent documentation
- Cypress E2E testing
- Puma-dev for HTTPS development
- Honeybadger error tracking
- RorVsWild performance monitoring
- Plausible analytics integration
- PWA ready

## Stack
- Ruby 3.4
- Rails 8.0
- Hotwire (Turbo, Stimulus)
- Phlex-Rails
- Tailwind CSS 4
- TypeScript
- Vite
- PostgreSQL
- Redis
- Sidekiq
- RSpec + Cypress

## File Tree (key paths)
```
/
├── .github/
├── app/
│   ├── components/
│   ├── controllers/
│   ├── models/
│   ├── views/
│   └── javascript/
├── config/
├── db/
├── lib/
├── spec/
├── cypress/
├── Dockerfile
├── docker-compose.yml
├── Gemfile
├── package.json
└── vite.config.mts
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: no
- Hooks: no

## Notable
- Uses Phlex-Rails instead of traditional ERB views (class-based view objects)
- Live demo available at templatus-hotwire.ledermann.dev
- Very recent commits (active development)
- Docker-ready for production deployment
