---
url: https://github.com/mukul975/Anthropic-Cybersecurity-Skills
stars: 4312
last_checked: 2026-04-15
last_commit: 2026-03-15
category: security
status: active
---
# Anthropic-Cybersecurity-Skills

> The largest open-source cybersecurity skills library for AI agents — 754 production-grade cybersecurity skills spanning 26 security domains, each following the agentskills.io open standard.

## What's Inside
- 754 structured cybersecurity skills across 26 security domains (Cloud Security, Threat Hunting, Malware Analysis, DFIR, SOC Operations, Red Teaming, etc.)
- 5-framework mapping: MITRE ATT&CK v18, NIST CSF 2.0, MITRE ATLAS v5.4, MITRE D3FEND v1.3, NIST AI RMF 1.0
- agentskills.io open standard (YAML frontmatter for sub-second discovery + Markdown workflow)
- Progressive disclosure (~30 tokens for scan, full load only when triggered)
- Helper scripts and reference files per skill
- MITRE ATT&CK coverage (all 14 tactics, 200+ techniques)
- AI-specific threat coverage (81 ATLAS skills, 139 D3FEND techniques)
- Skills structure: SKILL.md + references/ + scripts/ + assets/
- Playground for testing skills
- Compatible with 26+ AI platforms (Claude Code, GitHub Copilot, Codex CLI, Cursor, Gemini CLI)

## Stack
- Python
- PowerShell
- agentskills.io standard format
- YAML frontmatter
- Apache 2.0 license

## File Tree (key paths)
```
Anthropic-Cybersecurity-Skills/
├── .claude-plugin/
├── .github/
├── assets/
├── mappings/
├── skills/
│   ├── cloud-security/
│   ├── threat-hunting/
│   ├── threat-intelligence/
│   ├── web-application-security/
│   ├── network-security/
│   ├── malware-analysis/
│   ├── digital-forensics/
│   ├── incident-response/
│   └── ... (26 domains)
├── ATTACK_COVERAGE.md
├── CITATION.cff
├── index.json
└── README.md
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- AGENTS.md: no
- MCP config: no
- Skills/agents: yes
- Hooks: no

## Notable
- Only open-source library with unified 5-framework cross-mapping
- 4,312 stars and 471 forks
- Community project (not affiliated with Anthropic PBC)
- Addresses 4.8M cybersecurity workforce gap
- AI-native YAML/Markdown format for sub-second discovery and expert workflows
