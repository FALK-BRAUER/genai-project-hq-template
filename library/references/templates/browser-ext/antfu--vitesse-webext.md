---
url: https://github.com/antfu-collective/vitesse-webext
stars: 3400
last_checked: 2026-04-15
last_commit: 2025-01-23
category: browser-ext
status: active
---
# Vitesse WebExt

> WebExtension Vite Starter Template

## What's Inside
- Vue 3 with Composition API and `<script setup>` syntax
- Vite for instant HMR and fast builds
- UnoCSS for atomic CSS
- webext-bridge for cross-context communication
- VueUse for composition utilities
- Auto-imported components
- Icon support via unplugin-icons (Iconify)
- TypeScript for type safety
- Dynamic manifest.json with full type support
- Content script injection with Vue support

## Stack
- TypeScript, Vue 3, Vite
- UnoCSS, webext-bridge, VueUse
- unplugin-auto-import, unplugin-vue-components, unplugin-icons
- webextension-polyfill
- Playwright for e2e testing

## File Tree (key paths)
```
src/
  background/
  contentScript/
  components/
  styles/
  assets/
extension/
  assets/
  dist/
scripts/
e2e/
manifest.ts
uno.config.ts
vite.config.mts
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: no
- Hooks: no

## Notable
- Originally built for volta.net browser extension
- Supports Chrome, Firefox, and other Chromium-based browsers
- Gitpod integration for cloud development
- Part of the Vitesse template family by Anthony Fu
- 134 commits
