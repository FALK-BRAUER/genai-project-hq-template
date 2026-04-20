# GSD (Get Shit Done)

- **Type:** Plugin (command collection)
- **Command:** `/gsd:*`
- **Source:** GSD Plugin (third-party)
- **Scope:** Global
- **Status:** Active

## What It Does
A comprehensive project management and execution plugin for Claude Code. Provides milestone-based planning, phase-driven execution, autonomous workflows, workspace management, debugging, code review, and session tracking. Designed for structured, multi-phase development with verification at every step.

## Usage
```
/gsd:<command> [arguments]
```
Start with `/gsd:help` for the full reference, or `/gsd:do <description>` to let GSD route to the right command automatically.

### Core Workflow
1. `/gsd:new-project` -- Initialize project with PROJECT.md
2. `/gsd:new-milestone` -- Start a milestone cycle
3. `/gsd:discuss-phase` -- Gather context before planning
4. `/gsd:plan-phase` -- Create detailed phase plan
5. `/gsd:execute-phase` -- Execute the plan
6. `/gsd:verify-work` -- Validate through UAT
7. `/gsd:ship` -- Create PR and prepare for merge

## Commands

| Command | Description |
|---------|-------------|
| `/gsd:add-backlog` | Add an idea to the backlog parking lot (999.x numbering) |
| `/gsd:add-phase` | Add phase to end of current milestone in roadmap |
| `/gsd:add-tests` | Generate tests for a completed phase based on UAT criteria |
| `/gsd:add-todo` | Capture idea or task as todo from current conversation |
| `/gsd:audit-milestone` | Audit milestone completion against original intent before archiving |
| `/gsd:audit-uat` | Cross-phase audit of all outstanding UAT and verification items |
| `/gsd:autonomous` | Run all remaining phases autonomously (discuss, plan, execute per phase) |
| `/gsd:check-todos` | List pending todos and select one to work on |
| `/gsd:cleanup` | Archive accumulated phase directories from completed milestones |
| `/gsd:complete-milestone` | Archive completed milestone and prepare for next version |
| `/gsd:debug` | Systematic debugging with persistent state across context resets |
| `/gsd:discuss-phase` | Gather phase context through adaptive questioning before planning |
| `/gsd:do` | Route freeform text to the right GSD command automatically |
| `/gsd:execute-phase` | Execute all plans in a phase with wave-based parallelization |
| `/gsd:fast` | Execute a trivial task inline -- no subagents, no planning overhead |
| `/gsd:forensics` | Post-mortem investigation for failed GSD workflows |
| `/gsd:health` | Diagnose planning directory health and optionally repair issues |
| `/gsd:help` | Show available GSD commands and usage guide |
| `/gsd:insert-phase` | Insert urgent work as decimal phase (e.g., 72.1) between existing phases |
| `/gsd:join-discord` | Join the GSD Discord community |
| `/gsd:list-phase-assumptions` | Surface Claude's assumptions about a phase approach before planning |
| `/gsd:list-workspaces` | List active GSD workspaces and their status |
| `/gsd:manager` | Interactive command center for managing multiple phases |
| `/gsd:map-codebase` | Analyze codebase with parallel mapper agents to produce docs |
| `/gsd:milestone-summary` | Generate project summary from milestone artifacts for onboarding |
| `/gsd:new-milestone` | Start a new milestone cycle with PROJECT.md update |
| `/gsd:new-project` | Initialize a new project with deep context gathering and PROJECT.md |
| `/gsd:new-workspace` | Create an isolated workspace with repo copies |
| `/gsd:next` | Automatically advance to the next logical step in the workflow |
| `/gsd:note` | Zero-friction idea capture. Append, list, or promote notes to todos |
| `/gsd:pause-work` | Create context handoff when pausing work mid-phase |
| `/gsd:plan-milestone-gaps` | Create phases to close all gaps identified by milestone audit |
| `/gsd:plan-phase` | Create detailed phase plan (PLAN.md) with verification loop |
| `/gsd:plant-seed` | Capture a forward-looking idea with trigger conditions |
| `/gsd:pr-branch` | Create a clean PR branch filtering out .planning/ commits |
| `/gsd:profile-user` | Generate developer behavioral profile |
| `/gsd:progress` | Check project progress and route to next action |
| `/gsd:quick` | Execute a quick task with GSD guarantees but skip optional agents |
| `/gsd:reapply-patches` | Reapply local modifications after a GSD update |
| `/gsd:remove-phase` | Remove a future phase and renumber subsequent phases |
| `/gsd:remove-workspace` | Remove a GSD workspace and clean up worktrees |
| `/gsd:research-phase` | Research how to implement a phase (standalone) |
| `/gsd:resume-work` | Resume work from previous session with full context restoration |
| `/gsd:review-backlog` | Review and promote backlog items to active milestone |
| `/gsd:review` | Request cross-AI peer review of phase plans |
| `/gsd:session-report` | Generate session report with token usage estimates and outcomes |
| `/gsd:set-profile` | Switch model profile (quality/balanced/budget/inherit) |
| `/gsd:settings` | Configure GSD workflow toggles and model profile |
| `/gsd:ship` | Create PR, run review, and prepare for merge |
| `/gsd:stats` | Display project statistics -- phases, plans, git metrics, timeline |
| `/gsd:thread` | Manage persistent context threads for cross-session work |
| `/gsd:ui-phase` | Generate UI design contract (UI-SPEC.md) for frontend phases |
| `/gsd:ui-review` | Retroactive 6-pillar visual audit of implemented frontend code |
| `/gsd:update` | Update GSD to latest version with changelog display |
| `/gsd:validate-phase` | Retroactively audit and fill validation gaps for a completed phase |
| `/gsd:verify-work` | Validate built features through conversational UAT |
| `/gsd:workstreams` | Manage parallel workstreams -- list, create, switch, status, complete |

## Triggers
- Structured project execution with milestones and phases
- Autonomous multi-phase workflows
- Debugging with persistent state
- Session management and handoffs
- Any `/gsd:*` invocation

## Tips & Gotchas
- Use `/gsd:do` as a universal entry point -- it routes to the right command.
- `/gsd:fast` and `/gsd:quick` are for small tasks that don't need full ceremony.
- `/gsd:autonomous` runs all remaining phases end-to-end without intervention.
- `.planning/` directory holds all GSD state -- use `/gsd:pr-branch` to create clean PRs without planning artifacts.
- Use `/gsd:set-profile` to control model quality vs cost tradeoffs.
- `/gsd:pause-work` and `/gsd:resume-work` handle session continuity.

## Installed In
| Location | Path |
|----------|------|
| Global commands | `~/.claude/commands/gsd/` (57 command files) |
| GSD workflows | `~/.claude/get-shit-done/` |
