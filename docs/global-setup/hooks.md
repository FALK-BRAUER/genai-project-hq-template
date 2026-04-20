# Global Hooks & Settings — Reference

*Global hooks configured in `~/.claude/settings.json`. Fire automatically in every session.*

---

## Hook Types

| Event | When It Fires | Use For |
|-------|--------------|---------|
| `SessionStart` | Session starts | Inject date context, load environment |
| `PostSession` | Session ends | Cleanup, notifications |
| `PreToolUse` | Before any tool call | Block dangerous operations, gates |
| `PostToolUse` | After any tool call | Format code, lint, type-check |
| `Stop` | Agent tries to exit | Ralph loops, completion gates |
| `UserPromptSubmit` | User sends a message | Input validation, context injection |
| `InstructionsLoaded` | CLAUDE.md loaded | Dynamic instruction modification |
| `ConfigChange` | Settings change | React to config updates |
| `PostCompact` | After context compaction | Re-inject critical context |

---

## Currently Active Global Hooks

### SessionStart — Date/Context Injection

Gives Claude awareness of today's date, day of week, and timezone.

```json
"SessionStart": [
  {
    "hooks": [{
      "type": "command",
      "command": "python3 -c \"from datetime import datetime; now=datetime.now(); print(f'Today is {now.strftime(\\'%A, %B %d, %Y\\')}. Timezone: YOUR_TIMEZONE.')\"",
      "blocking": false
    }]
  }
]
```

**Why:** Claude doesn't inherently know the current date. This ensures time-aware responses (e.g., "create a report for this week").

---

### PostToolUse — Format on Save

Auto-formats code after Claude writes files. Non-blocking.

```json
"PostToolUse": [
  {
    "matcher": "Write(*.ts)",
    "hooks": [{"type": "command", "command": "npx prettier --write $file"}]
  },
  {
    "matcher": "Write(*.tsx)",
    "hooks": [{"type": "command", "command": "npx prettier --write $file"}]
  },
  {
    "matcher": "Write(*.py)",
    "hooks": [{"type": "command", "command": "python -m black $file"}]
  },
  {
    "matcher": "Write(*.css)",
    "hooks": [{"type": "command", "command": "npx prettier --write $file"}]
  }
]
```

**Why:** Consistent formatting without Claude having to think about it. Catches formatting issues that would otherwise clutter PRs.

**Note:** Requires `prettier` and `black` to be available. Install globally or per-project.

---

## Recommended Hooks to Add Later

### Security Scanning — Semgrep (PostToolUse)

Non-blocking security scan after writing code. Claude sees the output as a hint.

```json
{
  "matcher": "Write(*.ts)",
  "hooks": [{
    "type": "command",
    "command": "npx semgrep --config auto --quiet $file 2>&1 || true",
    "blocking": false
  }]
}
```

**When to add:** Once you have Semgrep installed and configured.

---

### Context Rot Warning (PostToolUse, from GSD)

Warns when context usage gets high. Prevents quality degradation on long sessions.

```json
{
  "matcher": "*",
  "hooks": [{
    "type": "command",
    "command": "echo 'Context checkpoint: if this session is getting long, consider /clear with a handoff document.'",
    "blocking": false
  }]
}
```

**When to add:** If you find yourself in long sessions without using GSD.

---

## Global Permissions

```json
"permissions": {
  "allow": [
    "Bash(npm:*)",
    "Bash(npx:*)",
    "Bash(git:*)",
    "Bash(gh:*)",
    "Bash(node:*)",
    "Bash(brew:*)",
    "Read",
    "Write",
    "Edit"
  ],
  "deny": [
    "Bash(rm -rf /)",
    "Bash(sudo rm *)"
  ]
}
```

**What this means:** Claude can freely use npm, npx, git, gh, node, brew, and read/write/edit files without asking permission. It cannot run destructive `rm` commands.

**The `clp` alias:** Running `clp` instead of `claude` skips ALL permission prompts (`claude --dangerously-skip-permissions`). Use for automated/unattended runs only.

---

## Full settings.json

The complete file at `~/.claude/settings.json`:

```json
{
  "permissions": {
    "allow": [
      "Bash(npm:*)",
      "Bash(npx:*)",
      "Bash(git:*)",
      "Bash(gh:*)",
      "Bash(node:*)",
      "Bash(brew:*)",
      "Read",
      "Write",
      "Edit"
    ],
    "deny": [
      "Bash(rm -rf /)",
      "Bash(sudo rm *)"
    ]
  },
  "hooks": {
    "SessionStart": [
      {
        "hooks": [{
          "type": "command",
          "command": "python3 -c \"from datetime import datetime; now=datetime.now(); print(f'Today is {now.strftime(\\'%A, %B %d, %Y\\')}. Timezone: YOUR_TIMEZONE.')\"",
          "blocking": false
        }]
      }
    ],
    "PostToolUse": [
      {
        "matcher": "Write(*.ts)",
        "hooks": [{"type": "command", "command": "npx prettier --write $file"}]
      },
      {
        "matcher": "Write(*.tsx)",
        "hooks": [{"type": "command", "command": "npx prettier --write $file"}]
      },
      {
        "matcher": "Write(*.py)",
        "hooks": [{"type": "command", "command": "python -m black $file"}]
      },
      {
        "matcher": "Write(*.css)",
        "hooks": [{"type": "command", "command": "npx prettier --write $file"}]
      }
    ]
  }
}
```

---

## Configuration Locations

| File | Location | What It Controls |
|------|----------|-----------------|
| `~/.claude/CLAUDE.md` | Global | Coding style, identity, universal rules |
| `~/.claude/CLAUDE.local.md` | Global (machine-specific) | Local paths, Tailscale IP, service URLs |
| `~/.claude/settings.json` | Global | Permissions, hooks, model, output style |
| `~/.claude.json` | Global | MCP server connections |
| `./CLAUDE.md` | Per-project | Stack, architecture, build commands |
| `.claude/settings.json` | Per-project | Project hooks, model overrides |
| `.planning/config.json` | Per-project (GSD) | GSD workflow config, model profiles |

**Precedence:** Project settings override global settings. If a project has its own `settings.json`, those hooks run in addition to (not instead of) global hooks.
