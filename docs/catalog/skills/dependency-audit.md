# Dependency Audit

- **Type:** Skill (Library)
- **Command:** N/A (loaded contextually)
- **Source:** hq library
- **Scope:** Library — used by LinkedInOrganiser, camel-cpq
- **Category:** Task
- **Status:** Active

## What It Does
Check for outdated, vulnerable, or unused npm dependencies. Runs a five-step workflow: check for vulnerabilities (`npm audit`, report critical/high), check for outdated packages (`npm outdated`, categorize as patch/minor/major), scan for unused dependencies (packages in package.json never imported), check for duplicate packages in package-lock.json, and produce a consolidated report with fix commands and recommendations.

## Used By
| Project | How Loaded |
|---------|------------|
| LinkedInOrganiser | Symlinked from library |
| camel-cpq | Symlinked from library |

## Tips & Gotchas
- Run periodically or before releases, not just when something breaks.
- Patch updates are generally safe to apply immediately.
- Minor updates require changelog review before applying.
- Major updates are breaking changes -- plan a migration rather than blindly updating.
- Unused dependencies add attack surface and bloat; remove them promptly.
