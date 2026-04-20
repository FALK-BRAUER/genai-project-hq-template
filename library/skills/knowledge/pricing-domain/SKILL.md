---
name: pricing-domain
description: CPQ and pricing business logic patterns. Reference when building pricing engines, quote calculators, or discount workflows.
---

## Price Waterfall
```
List Price → Volume Discount → Customer Discount → Promotional Discount → Net Price
Net Price − Cost = Margin
Margin / Net Price = Margin %
```

## Core Concepts

### Price Lists
- Base price list (default)
- Customer-specific price lists (override base)
- Date-effective pricing (valid from/to)
- Currency-specific pricing

### Discount Types
- Percentage discount (10% off)
- Absolute discount ($50 off)
- Volume tiers (buy 100+ get 15% off)
- Bundle discounts (buy A+B get 20% off)
- Stacking rules: which discounts combine, which are exclusive

### Approval Workflows
- Define discount thresholds per role (sales rep: 10%, manager: 20%, VP: 30%+)
- Auto-approve within threshold, route for approval above
- Track approval chain for audit

## Implementation Rules
- All monetary calculations use integer cents (not floating point)
- Round at the line level, not the total
- Store original price and each discount separately for audit trail
- Currency conversion uses daily rates from a single source of truth
- Test edge cases: zero quantity, 100% discount, multi-currency quotes
