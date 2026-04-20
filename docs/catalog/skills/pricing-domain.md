# Pricing Domain

- **Type:** Skill (Library)
- **Command:** N/A (loaded contextually)
- **Source:** hq library
- **Scope:** Library — used by camel-cpq
- **Category:** Knowledge
- **Status:** Active

## What It Does
CPQ and pricing business logic patterns reference. Covers the price waterfall (List Price -> Volume Discount -> Customer Discount -> Promotional Discount -> Net Price -> Margin), core concepts for price lists (base, customer-specific, date-effective, currency-specific), discount types (percentage, absolute, volume tiers, bundle, stacking rules), and approval workflows with role-based thresholds.

## Used By
| Project | How Loaded |
|---------|------------|
| camel-cpq | Symlinked from library |

## Tips & Gotchas
- All monetary calculations must use integer cents, not floating point.
- Round at the line level, not the total.
- Store original price and each discount separately for audit trail.
- Currency conversion uses daily rates from a single source of truth.
- Test edge cases: zero quantity, 100% discount, multi-currency quotes.
