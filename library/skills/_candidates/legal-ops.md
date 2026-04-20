# Skill Evaluation: legal-ops

## Source
- **Origin:** community repo
- **URL:** https://github.com/panaversity/agentfactory-business-plugins/tree/main/legal-ops
- **License:** Apache 2.0
- **Last updated:** 2026-03-23
- **Discovered:** 2026-03-26
- **Discovered by:** manual research

## Evaluation Criteria

| # | Criterion | Score (1-5) | Notes |
|---|-----------|-------------|-------|
| 1 | **Relevance** — Does it solve a real problem for your use case? | 4 | Contract review, compliance calendar, DSAR/privacy, IP protection, legal spend tracking. Directly useful for contract-heavy consulting. |
| 2 | **Quality** — Is the content accurate, well-structured, actionable? | 5 | Excellent: 1 agent, 6 skills, 6 jurisdiction overlays (UK, EU, US, Pakistan, UAE, GCC), hooks, evals. Best architecture of all candidates. |
| 3 | **Overlap** — Does it duplicate an existing library skill? | 4 | Slight overlap with contract-and-proposal-writer on contract review, but this is review/compliance vs drafting. Complementary. |
| 4 | **Maintenance** — Is the source actively maintained? Does it matter? | 4 | Active, Panaversity course material. |
| 5 | **License** — Compatible with our use? (MIT/Apache = yes) | 5 | Apache 2.0 |
| 6 | **Adaptability** — Can it be used as-is or needs heavy customization? | 3 | Has 6 jurisdiction overlays but no Singapore. The overlay pattern makes adding SG straightforward — just add `sg-law.md`. |
| 7 | **Singapore-specific** — Does it handle SG context, or is it generic? | 2 | No SG overlay, but the jurisdiction overlay architecture is designed for extension. Adding SG would follow the existing pattern. |

**Total score:** 27/35
**Threshold:** 20+ = promote, 15-19 = adapt then promote, <15 = skip

## Verdict
- [x] **Adapt then promote** → add Singapore jurisdiction overlay, then promote

## Adaptation Notes
- Add `sg-law.md` jurisdiction overlay covering: Singapore Contract Act, PDPA, Employment Act, Companies Act
- Add compliance calendar entries for ACRA annual return, IRAS Form C-S, GST filing, CPF deadlines
- The DSAR/privacy skill maps well to PDPA compliance
- IP protection skill useful for AI consulting IP assignments
- Keep existing jurisdiction overlays — useful for international client contracts (US for Zilliant, EU for potential European clients)

## Promotion Target
- **Category:** business-ops
- **Skill name:** `legal-ops`
- **Deploy to:** contracts-work
