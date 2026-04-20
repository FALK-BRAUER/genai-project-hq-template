# Skill Evaluation: financial-analyst

## Source
- **Origin:** community repo
- **URL:** https://github.com/alirezarezvani/claude-skills/tree/main/finance
- **License:** MIT
- **Last updated:** 2026-03-26
- **Discovered:** 2026-03-26
- **Discovered by:** manual research

## Evaluation Criteria

| # | Criterion | Score (1-5) | Notes |
|---|-----------|-------------|-------|
| 1 | **Relevance** — Does it solve a real problem for your use case? | 3 | Ratio analysis, DCF, budget variance, forecasting. Overkill for a small consulting firm — more suited to investment analysis. Budget variance and forecasting are useful. |
| 2 | **Quality** — Is the content accurate, well-structured, actionable? | 4 | Includes 4 Python tools (stdlib-only), references, assets. Well-structured skill with scripts. |
| 3 | **Overlap** — Does it duplicate an existing library skill? | 5 | No overlap. |
| 4 | **Maintenance** — Is the source actively maintained? Does it matter? | 5 | Active repo. |
| 5 | **License** — Compatible with our use? (MIT/Apache = yes) | 5 | MIT |
| 6 | **Adaptability** — Can it be used as-is or needs heavy customization? | 3 | DCF/ratio analysis not needed day-to-day. Would cherry-pick budget variance + forecast tools. |
| 7 | **Singapore-specific** — Does it handle SG context, or is it generic? | 2 | Generic. No SG tax rates, GST, or IRAS-specific reporting. |

**Total score:** 27/35
**Threshold:** 20+ = promote, 15-19 = adapt then promote, <15 = skip

## Verdict
- [x] **Adapt then promote** → cherry-pick budget variance + forecasting, skip DCF/ratios

## Adaptation Notes
- Cherry-pick `budget_variance_analyzer.py` and `forecast_builder.py` — useful for monthly P&L tracking
- Skip `ratio_calculator.py` and `dcf_valuation.py` — not relevant for consulting ops
- Add SG corporate tax rate (17%), GST rate (9%), CPF contribution rates to forecasting defaults
- Consider merging with solo-skills `/solo:books` into a unified accounting skill

## Promotion Target
- **Category:** business-ops
- **Skill name:** `accounting` (merged with relevant solo-skills pieces)
- **Deploy to:** your-project
