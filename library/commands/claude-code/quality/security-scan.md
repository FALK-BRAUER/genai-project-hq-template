---
description: Run security scans — Semgrep for code, truffleHog for secrets
allowed-tools: Bash(semgrep:*), Bash(trufflehog:*), Bash(npm audit:*), Read
---

1. **Dependency audit:** `npm audit`
2. **Secret scan:** `trufflehog git file://. --only-verified`
3. **Code scan:** `semgrep scan --config auto .` (if semgrep installed)
4. Summarize findings by severity:
   - Critical: act now
   - High: fix before next release
   - Medium: add to backlog
   - Low: informational
