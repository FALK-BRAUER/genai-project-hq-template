---
url: https://github.com/pedrohcgs/claude-code-my-workflow
stars: 919
last_checked: 2026-04-15
last_commit: 2026-04-13
category: academic
status: active
---
# claude-code-my-workflow

> Ready-to-fork Claude Code template for academics using LaTeX/Beamer + R with multi-agent review, quality gates, adversarial QA, and replication protocols.

## What's Inside
- Contractor Mode: Claude plans, implements, reviews, fixes, and scores autonomously
- 10 specialized agents: proofreader, slide-auditor, pedagogy-reviewer, r-reviewer, tikz-reviewer, domain-reviewer, critic, fixer, verifier, beamer-translator
- 22 skills: compile-latex, deploy, extract-tikz, proofread, visual-audit, pedagogy-review, review-r, qa-quarto, slide-excellence, translate-to-quarto, lit-review, data-analysis
- 18 rules with path-scoped loading for verification, quality gates, R conventions, TikZ quality, Beamer-Quarto sync
- Adversarial QA: critic + fixer loop until approval (max 5 rounds)
- Quality gates: 80/90/95 scoring thresholds for commit/PR/excellence
- Context survival: PreCompact hook saves context snapshots, MEMORY.md accumulates learning
- Effort levels: low/medium/high/max for cost vs. thoroughness tradeoffs
- Exploration folder protocol for experimental work with fast-track workflow

## Stack
- LaTeX/Beamer, Quarto, R
- Claude Code, TypeScript, Python
- XeLaTeX, pdf2svg, gh CLI

## File Tree (key paths)
```
claude-code-my-workflow/
├── .claude/
│   ├── agents/
│   │   ├── proofreader.md
│   │   ├── slide-auditor.md
│   │   ├── pedagogy-reviewer.md
│   │   ├── r-reviewer.md
│   │   └── ...
│   ├── skills/
│   │   ├── compile-latex.md
│   │   ├── deploy.md
│   │   ├── extract-tikz.md
│   │   └── ...
│   ├── rules/
│   │   ├── plan-first-workflow.md
│   │   ├── orchestrator-protocol.md
│   │   ├── quality-gates.md
│   │   └── ...
│   └── WORKFLOW_QUICK_REF.md
├── templates/
│   ├── session-log.md
│   ├── quality-report.md
│   └── skill-template.md
├── guide/
│   └── workflow-guide.qmd
├── Quarto/
├── Slides/
├── Figures/
└── scripts/
```

## AI-Readiness
- CLAUDE.md: yes
- .cursorrules: no
- MCP config: no
- Skills/agents: yes (22 skills, 10 agents)
- Hooks: yes (7 hooks including PreCompact)

## Notable
- Extracted from production PhD course (Econ 730: Causal Panel Data at Emory)
- 15+ research groups adapted this workflow (economics, energy, political science, engineering)
- Community extensions: clo-author (17 agents), claudeblattman (non-technical guide), MixtapeTools (rhetoric of decks)
- MEMORY.md for cross-session learning accumulation
