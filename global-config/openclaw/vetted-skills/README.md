# Vetted Skills for OpenClaw

Only install skills from this list. After the ClawHavoc campaign (820+ malicious skills on ClawHub), every skill must be vetted before install.

## Vetting Checklist
- [ ] Read the source code (check GitHub, not just ClawHub listing)
- [ ] Verify author reputation (GitHub profile, install count, community reviews)
- [ ] Check for suspicious exec calls, network requests, or credential access
- [ ] Run `openclaw security audit --deep` after install
- [ ] Add to this list with date and notes

---

## Approved Skills

| Skill | Author | Vetted | Notes |
|-------|--------|--------|-------|
| self-improving-agent | @pskoett | Pending | #1 ClawdHub skill, logging to .learnings/ |
| thunderbird-mcp | @TKasperczyk | Pending | **Primary email MCP** — 35 tools, OAuth2 via Thunderbird, credential isolation. Disable send/delete tools in settings. GitHub: TKasperczyk/thunderbird-mcp |
| imap-mini-mcp | @florianbuetow | Pending | **Fallback email MCP** — lightweight, no send by design, but basic auth only (no OAuth2). GitHub: florianbuetow/imap-mini-mcp |
| imap-smtp-email | official | Deprioritized | Replaced by thunderbird-mcp. Only consider if both MCP approaches fail |
| gog | official | Pending | Google Workspace (Gmail, Calendar, Drive) |
| apple-reminders | official | Pending | macOS native Reminders |
| apple-notes | official | Pending | macOS native Notes |
| github | official | Pending | PR reviews, issues, repos |
| blogwatcher | community | Pending | RSS/Atom feed monitoring |
| knowledge-base | community | Pending | URL ingestion, RAG search |
| clawrouter | community | Pending | Route to cheap/expensive models |
| himalaya | community | Pending | Lightweight CLI email |

## Blocked Skills
| Skill | Reason | Date |
|-------|--------|------|
| (none yet) | | |
