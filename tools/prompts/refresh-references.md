# Task: Generate Reference Library Pages

You are generating structured markdown files for repos in the vibe-hq reference library.

## Instructions

1. A list of repos to process is appended below under "Repos to Process This Batch".
2. Each entry has: `mode` (init or update), `url`, `section`, `category`, `filename`, and `output_path`.

3. For each repo:
   - Search the web for the GitHub repo page
   - Gather: description, star count, last commit date, README content
   - Look for AI-readiness signals: CLAUDE.md, .cursorrules, AGENTS.md, MCP configs, skills, hooks
   - If the repo returns 404, set `status: 404`. If archived, set `status: archived`.

4. Write the file at `output_path` with this exact structure:

```markdown
---
url: {github url}
stars: {current star count, number only}
last_checked: {today's date, YYYY-MM-DD}
last_commit: {date of most recent commit, YYYY-MM-DD}
category: {category}
status: active|archived|404
---
# {repo name}
> {repo description from GitHub}

## What's Inside
- bullet list of key features/components (3-8 bullets)

## Stack
- languages, frameworks, key dependencies

## File Tree (key paths)
(top 2 levels, filtered to relevant directories only — skip node_modules, .git, etc.)

## AI-Readiness
- CLAUDE.md: yes/no
- .cursorrules: yes/no
- MCP config: yes/no
- Skills/agents: yes/no
- Hooks: yes/no

## Notable
- anything surprising or especially useful (1-3 bullets)
```

5. For `mode: update` — overwrite the existing file with fresh data.
   For `mode: init` — create the file (and category directory if needed).

6. After writing all files, print a summary line:
   `Processed: X, Errors: Y`

## Rules
- Do NOT modify registry.yaml
- Do NOT run git commands — the parent script handles git
- Do NOT skip repos — process every repo in the list below
- Keep content factual and concise — no marketing language
- Star counts should be the actual current number, not rounded
- Create category subdirectories if they don't exist
