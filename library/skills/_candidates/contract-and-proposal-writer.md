# Skill Evaluation: contract-and-proposal-writer

## Source
- **Origin:** community repo
- **URL:** https://github.com/alirezarezvani/claude-skills
- **License:** MIT
- **Last updated:** 2026-03-26 (active, 192+ skills)
- **Discovered:** 2026-03-26
- **Discovered by:** manual research

## Evaluation Criteria

| # | Criterion | Score (1-5) | Notes |
|---|-----------|-------------|-------|
| 1 | **Relevance** — Does it solve a real problem for your use case? | 5 | Contracts, SOWs, NDAs, MSAs, proposals — core consulting deliverables. |
| 2 | **Quality** — Is the content accurate, well-structured, actionable? | 3 | Large repo (192+ skills) but couldn't fetch individual skill content. Repo description mentions US/EU/UK/DACH jurisdictions. Need to verify depth. |
| 3 | **Overlap** — Does it duplicate an existing library skill? | 5 | No overlap — we have zero contract skills. |
| 4 | **Maintenance** — Is the source actively maintained? Does it matter? | 5 | Updated same day as discovery. Very active. |
| 5 | **License** — Compatible with our use? (MIT/Apache = yes) | 5 | MIT |
| 6 | **Adaptability** — Can it be used as-is or needs heavy customization? | 3 | Covers US/EU/UK/DACH but no Singapore. Need to add SG governing law clauses, PDPA references. |
| 7 | **Singapore-specific** — Does it handle SG context, or is it generic? | 1 | No Singapore jurisdiction support. |

**Total score:** 27/35
**Threshold:** 20+ = promote, 15-19 = adapt then promote, <15 = skip

## Verdict
- [x] **Adapt then promote** → fork, customize, then move

## Adaptation Notes
- Add Singapore law governing clause templates
- Add PDPA (Personal Data Protection Act) references for data-handling clauses
- Add SG-specific SOW template (GST line items, payment terms in SGD)
- Add your business boilerplate (company details, UEN, registered address)
- Keep the US/EU/UK templates — useful for international clients (Zilliant is US-based)

## Promotion Target
- **Category:** business-ops
- **Skill name:** `contracts`
- **Deploy to:** your-project
