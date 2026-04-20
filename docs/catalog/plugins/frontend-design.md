# Frontend Design

- **Type:** Plugin
- **Package:** `frontend-design@claude-plugins-official`
- **Source:** claude-plugins-official marketplace
- **Scope:** Global
- **Status:** Active

## What It Does

Generates distinctive, production-grade frontend interfaces that avoid generic "AI slop" aesthetics. Automatically activates for frontend work. Commits to bold aesthetic directions -- brutally minimal, maximalist, retro-futuristic, organic, luxury, editorial, brutalist, art deco, etc. -- and executes with precision. Produces working code (HTML/CSS/JS, React, Vue) with distinctive typography, cohesive color palettes, high-impact animations, and context-aware implementation.

## Commands Provided

| Command | Description |
|---------|-------------|
| `/frontend-design:frontend-design` | Create a distinctive, production-grade frontend interface from a description |

## Tips & Gotchas

- The skill explicitly avoids generic fonts (Inter, Roboto, Arial), cliched purple-on-white gradients, and cookie-cutter layouts.
- Each generation should be visually different -- varies between light/dark themes, fonts, and aesthetics.
- Maximalist designs get elaborate animations and effects; minimalist designs get precise spacing, typography, and subtle details.
- Uses CSS variables for color/theme consistency. Prefers CSS-only animation for HTML; Motion library for React.
- See the [Frontend Aesthetics Cookbook](https://github.com/anthropics/claude-cookbooks/blob/main/coding/prompting_for_frontend_aesthetics.ipynb) for prompting guidance.
- Authors: Prithvi Rajasekaran and Alexander Bricken (Anthropic).
