# Contracts

- **Type:** Skill (Library)
- **Command:** N/A (loaded contextually)
- **Source:** hq library
- **Scope:** Library — used by LinkedInOrganiser, camel-cpq
- **Category:** Business Ops
- **Status:** Active

## What It Does
Generate professional, jurisdiction-aware business documents: SOWs, NDAs, MSAs, engagement letters, and client proposals. Outputs structured Markdown with pandoc conversion instructions for DOCX/PDF. Default governing law is Singapore; US (Delaware), EU (GDPR), and UK alternatives included for international clients.

Includes five full templates:
1. Statement of Work (SOW) with deliverables matrix, milestone payments, IP assignment, PDPA clause
2. Mutual NDA with SIAC arbitration, PDPA/GDPR provisions
3. Master Service Agreement (MSA) with multi-SOW framework, indemnification, auto-renewal terms
4. Engagement letter (lightweight SOW alternative for engagements under SGD 50,000)
5. Client proposal with phased approach, team, timeline, and investment options

Also includes a drop-in PDPA compliance clause block, rate card structure, and a key clauses reference table covering governing law, payment terms, IP ownership, liability caps, termination, confidentiality, warranties, and dispute resolution across jurisdictions.

## Used By
| Project | How Loaded |
|---------|------------|
| LinkedInOrganiser | Symlinked from library |
| camel-cpq | Symlinked from library |

## Tips & Gotchas
- Not a substitute for legal counsel. Use these as strong starting points; review with a lawyer for high-value or complex engagements.
- Singapore requires written IP assignment under the Copyright Act 2021 -- verbal agreements are insufficient.
- Always define acceptance criteria in SOWs (written sign-off, X days deemed accepted).
- Include a change order process in every SOW -- scope creep kills fixed-price projects.
- If GST-registered, every invoice must show GST. If not registered, state "not GST-registered" to avoid confusion.
- Electronic signatures are valid in Singapore under the Electronic Transactions Act (Cap 88).
