# PAL (Your-project)

- **Type:** Skill (Project-specific)
- **Command:** N/A (loaded contextually)
- **Source:** your-project project (.claude/skills/pal/)
- **Scope:** Project — used by your-project
- **Category:** Knowledge
- **Status:** Active

## What It Does
Multi-model AI consulting skill for investment research via PAL MCP. Connects Claude Code to external AI models (Gemini, Qwen, DeepSeek) for second opinions, scenario analysis, and multi-model consensus on investment decisions. Each tool maintains conversation context via `continuation_id` for multi-turn research flows.

Core tools:
- **chat** -- quick research, second opinions, data collection from external models
- **thinkdeep** -- structured multi-step deep dives with hypothesis testing (earnings analysis, sector research, macro assessment)
- **consensus** -- multi-model debate where models argue different sides of a thesis, then synthesize into actionable recommendations
- **challenge** -- stress-test conviction and combat confirmation bias
- **apilookup** -- current API/SDK documentation lookup
- **planner** -- complex research or automation planning with branching/revision
- **clink** -- delegate tasks to Gemini CLI, Codex CLI, or another Claude instance

Model tiers: Tier 1 (pro, reasoning) for deep analysis; Tier 2 (qwen, ds, coder) for research synthesis; Tier 3 (flash, cheap) for bulk data collection; Specialized (vision) for chart analysis.

Includes 14 workflow recipes: role-based analyst team, earnings analysis, SEC filing deep dive, macro scenario analysis, new position evaluation, sentiment synthesis, portfolio risk review, peer benchmarking, sector rotation research, data collection sprint, second opinion, watchlist monitoring, options strategy evaluation, and post-trade review.

## Used By
| Project | How Loaded |
|---------|------------|
| your-project | Project skill in .claude/skills/pal/ |

## Tips & Gotchas
- Never paste large data into prompts -- use `absolute_file_paths` or `relevant_files` to share files with external models.
- Always reuse `continuation_id` when continuing a multi-turn conversation with the same model.
- Pick the right model tier: flash/cheap for data collection, pro/reasoning for deep analysis.
- For consensus, always use at least 2 models with different stances. 3 is ideal.
- PAL models do not have live market data access -- collect data from specialized MCPs (yahoo-finance, IBKR, SEC EDGAR, FRED) first, then pass to PAL for analysis.
- Use `challenge` when you catch yourself being too bullish/bearish to combat confirmation bias.
