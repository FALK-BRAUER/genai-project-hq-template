# MCP Security Audit Checklist

**Rule: Every community MCP must pass this audit before being added to the global config.**

## 1. Repository Health

| Check | Pass criteria |
|---|---|
| GitHub stars | >10 minimum, >50 preferred |
| Last commit | Within 3 months |
| Open issues ratio | <50% unresolved vs total |
| Contributors | >1 preferred |
| License | OSI-approved (MIT, Apache 2.0, etc.) |

## 2. Code Review

| Check | What to look for |
|---|---|
| No data exfiltration | No outbound calls to unknown URLs/IPs |
| No hardcoded endpoints | Only localhost or documented APIs |
| No obfuscated code | All source readable, no minified runtime |
| No eval/exec | No `eval()`, `exec()`, `new Function()`, `child_process` in runtime |
| No credential stealing | OAuth tokens/keys stay local, not sent to third parties |
| Dependencies | All legitimate, no suspicious or bloated prod deps |
| Input sanitization | Path traversal protection, filename sanitization |

## 3. Authentication & Permissions

| Check | What to verify |
|---|---|
| Credential storage | Encrypted at rest, or at minimum 0600 file permissions |
| Auth tokens | Generated securely (crypto random), not hardcoded |
| Scope | Minimal permissions requested (e.g., read-only if possible) |
| Access control | Can restrict which accounts/tools are exposed |

## 4. Destructive Capabilities

| Check | Action |
|---|---|
| Send/post/publish tools | Document them; disable by default if possible |
| Delete/modify tools | Document them; disable by default if possible |
| File write tools | Check for path traversal; restrict to safe directories |

## 5. Author Verification

| Check | What to look for |
|---|---|
| GitHub profile | Established account, consistent activity |
| Other repos | Pattern of legitimate projects |
| Organization backing | Bonus if backed by a company/org |

## Verdict Template

```
## Audit: [MCP Name]
- **Date:** YYYY-MM-DD
- **Repo:** [URL]
- **Stars/Forks:** X / Y
- **Last push:** YYYY-MM-DD
- **Verdict:** PASS / FAIL / CONDITIONAL
- **Findings:** [summary]
- **Recommendations:** [what to disable, restrict, or watch]
```

## Completed Audits

### GongRzhe/Gmail-MCP-Server — FAIL
- **Date:** 2026-03-26
- **Stars/Forks:** 1,070 / 317
- **Verdict:** FAIL — unmaintained (8 months, 37 open issues), path traversal in download_attachment, MCP SDK v0.4 (current v1.25), `mcp-evals` bloating prod deps
- **Recommendation:** Do not use. Consider actively maintained fork or alternative.

### TKasperczyk/thunderbird-mcp — PASS
- **Date:** 2026-03-26
- **Stars/Forks:** 50 / 28
- **Verdict:** PASS — zero runtime deps, localhost-only, crypto auth with timing-safe comparison, per-tool access control
- **Recommendations:** Disable send/delete tools for read-only use. Restrict to business account only. Build from source.

### ai-zerolab/mcp-email-server — NOT AUDITED
- **Date:** 2026-03-26
- **Stars/Forks:** 205 / 77
- **Verdict:** Skipped in favour of Thunderbird MCP.
