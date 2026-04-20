# Skill Evaluation: solo-skills

## Source
- **Origin:** community repo
- **URL:** https://github.com/ORBWEVA/solo-skills
- **License:** MIT
- **Last updated:** 2026-03 (active)
- **Discovered:** 2026-03-26
- **Discovered by:** manual research

## Evaluation Criteria

| # | Criterion | Score (1-5) | Notes |
|---|-----------|-------------|-------|
| 1 | **Relevance** — Does it solve a real problem for your use case? | 5 | Directly targets solo consulting: books, tax, clients, time, sales, onboarding. Exact fit. |
| 2 | **Quality** — Is the content accurate, well-structured, actionable? | 4 | 15 commands with clear workflow diagram. Well-principled (profit > revenue). Pure markdown. |
| 3 | **Overlap** — Does it duplicate an existing library skill? | 5 | No overlap — we have zero business-ops skills. |
| 4 | **Maintenance** — Is the source actively maintained? Does it matter? | 4 | Active repo, part of ORBWEVA founder toolkit (gtm-skills, dt-skill). |
| 5 | **License** — Compatible with our use? (MIT/Apache = yes) | 5 | MIT |
| 6 | **Adaptability** — Can it be used as-is or needs heavy customization? | 3 | Usable as-is for general ops. Tax/books commands are US-centric — need SG adaptation for CPF, GST, IRAS. |
| 7 | **Singapore-specific** — Does it handle SG context, or is it generic? | 2 | Generic/US-focused. No mention of SG jurisdictions, CPF, GST, ACRA. |

**Total score:** 28/35
**Threshold:** 20+ = promote, 15-19 = adapt then promote, <15 = skip

## Verdict
- [x] **Adapt then promote** → fork, customize, then move
- Mostly promote as-is, but `/solo:books` and `/solo:tax` need SG overlays

## Adaptation Notes
- Fork `/solo:books` → add GST tracking, CPF contribution calculations, IRAS-compliant categories
- Fork `/solo:tax` → replace US quarterly estimates with SG corporate tax (Form C-S), ECI deadlines
- `/solo:clients`, `/solo:sales`, `/solo:onboard`, `/solo:time` — usable as-is
- Consider adding `/solo:compliance` for ACRA annual return reminders

## Promotion Target
- **Category:** business-ops
- **Skill name:** `solo-ops`
- **Deploy to:** your-project, your-contracts-project
