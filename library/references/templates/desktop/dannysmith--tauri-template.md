---
url: https://github.com/dannysmith/tauri-template
stars: 224
last_checked: 2026-04-15
last_commit: 2025-08-01
category: desktop
status: active
---
# Tauri React Template

> A production-ready template for building modern desktop applications with Tauri v2, React 19, and TypeScript

## What's Inside
- Tauri v2 with React 19 and TypeScript
- Type-safe Rust-TypeScript bridge via tauri-specta
- Command palette (Cmd+K) with keyboard navigation
- Quick Pane with global shortcut using native NSPanel on macOS
- Multi-window architecture with platform-specific title bars
- Native menus with full i18n support
- Preferences system with Rust-side persistence
- Theme system with light/dark mode
- Notifications (toast + native)
- Auto-updates via GitHub Releases
- Structured logging for Rust and TypeScript
- Crash recovery for unsaved work
- i18n with RTL support

## Stack
- TypeScript, JavaScript, Rust, CSS, HTML
- React 19, Vite 7
- shadcn/ui v4, Tailwind CSS v4, Lucide React
- Zustand v5, TanStack Query v5
- Tauri v2 plugins (single-instance, window-state, fs, dialog, notification, clipboard-manager, global-shortcut, updater, opener, tauri-nspanel)
- Vitest, Testing Library
- ESLint, Prettier, ast-grep, knip, jscpd, clippy

## File Tree (key paths)
```
.ast-grep/rules/
.claude/
.github/workflows/
.vscode/
docs/
  developer/
  userguide/
locales/
public/
scripts/
src/
  components/
  hooks/
  store/
  services/
src-tauri/
.coderabbit.yaml
.cursorignore
AGENTS.md
CLAUDE.md
components.json
rust-toolchain.toml
sgconfig.yml
vitest.config.ts
```

## AI-Readiness
- CLAUDE.md: yes
- .cursorrules: no (has .cursorignore)
- MCP config: no
- Skills/agents: yes (.claude/ directory with agents)
- Hooks: no

## Notable
- Designed specifically for AI coding agents (Claude Code optimized)
- Three-layer state management pattern clearly documented
- Single quality gate: `npm run check:all`
- React Compiler enabled for automatic memoization
- Platform-specific configs for macOS, Windows, Linux
- Comprehensive developer documentation in docs/developer/
- 71 commits
