# Skill Evaluation: hr-operations

## Source
- **Origin:** community repo
- **URL:** https://github.com/panaversity/agentfactory-business-plugins/tree/main/hr-operations
- **License:** Apache 2.0
- **Last updated:** 2026-03-23
- **Discovered:** 2026-03-26
- **Discovered by:** manual research

## Evaluation Criteria

| # | Criterion | Score (1-5) | Notes |
|---|-----------|-------------|-------|
| 1 | **Relevance** — Does it solve a real problem for your use case? | 2 | 5 skills (JD writing, talent matching, knowledge capture, references, offboarding) + 4 agents. Designed for mid-size orgs. your business is 1-2 people — most features are overkill. |
| 2 | **Quality** — Is the content accurate, well-structured, actionable? | 5 | Excellent structure: skills, agents, evals (14 test cases), local config template. Gold-standard plugin architecture. |
| 3 | **Overlap** — Does it duplicate an existing library skill? | 5 | No overlap. |
| 4 | **Maintenance** — Is the source actively maintained? Does it matter? | 4 | Active, part of Panaversity course material. |
| 5 | **License** — Compatible with our use? (MIT/Apache = yes) | 5 | Apache 2.0 |
| 6 | **Adaptability** — Can it be used as-is or needs heavy customization? | 2 | Heavy — most commands target teams with hiring pipelines. Would need to strip down to just employment contract templates and basic onboarding. |
| 7 | **Singapore-specific** — Does it handle SG context, or is it generic? | 2 | Policy-configurable via `hr.local.md` (good pattern) but no SG jurisdiction overlay. No CPF, MOM, EP references. |

**Total score:** 25/35
**Threshold:** 20+ = promote, 15-19 = adapt then promote, <15 = skip

## Verdict
- [x] **Adapt then promote** → strip down to SG essentials for small firm

## Adaptation Notes
- Strip down to essentials: employment contract templates, basic onboarding, CPF/MOM compliance
- Drop: talent matching, succession planning, knowledge capture agents — overkill for 1-2 people
- Steal the `hr.local.md` template pattern for other skills
- Add SG employment law (Employment Act), CPF contribution rates, MOM EP requirements, standard SG leave entitlements (14 days AL, 14 days MC)
- Add WICA insurance requirement reference

## Promotion Target
- **Category:** business-ops
- **Skill name:** `hr`
- **Deploy to:** your-project
