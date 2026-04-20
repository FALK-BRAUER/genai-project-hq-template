# SignNow

- **Type:** MCP Server
- **Package:** `signnow-mcp-server` (PyPI / uvx)
- **Scope:** Project (your-project-2-gdrive)
- **Status:** Not configured (planned, never set up)

## What It Does

E-signature workflows for your-project corporate governance. Create documents from templates, send signing invitations, track status, download completed signed documents — all from Claude Code.

## Tools Exposed

| Tool | Description |
|------|-------------|
| `list_templates` | List templates and template groups with metadata |
| `create_document` | Create document/group from template |
| `send_invite` | Email invite with ordered recipient support |
| `embedded_signing` | Embedded signing session (no email) |
| `embedded_sending` | Embedded document sending/management |
| `embedded_editor` | Editor link for field placement |
| `template_to_invite` | One-shot: template → invite |
| `template_to_embedded_sending` | One-shot: template → embedded sending |
| `template_to_editor` | One-shot: template → editor |
| `check_invite_progress` | Track invite progress and step details |
| `download_document` | Download completed documents |
| `get_document_structure` | Retrieve document structure with field values |
| `prefill_fields` | Prefill text fields in documents |

## Configuration

```json
{
  "mcpServers": {
    "signnow": {
      "command": "uvx",
      "args": ["--from", "signnow-mcp-server", "sn-mcp", "serve"],
      "env": {
        "SIGNNOW_API_BASIC_TOKEN": "<from keychain: SIGNNOW_API_BASIC_TOKEN>",
        "SIGNNOW_USER_EMAIL": "<from keychain: SIGNNOW_USER_EMAIL>",
        "SIGNNOW_PASSWORD": "<from keychain: SIGNNOW_PASSWORD>"
      }
    }
  }
}
```

**Environment variables:** `SIGNNOW_API_BASIC_TOKEN`, `SIGNNOW_USER_EMAIL`, `SIGNNOW_PASSWORD` — stored in macOS Keychain.

## When to Use

- Signing board resolutions (monthly dividend declarations)
- Shareholder loan agreements
- Client contracts and amendments
- Employment documents
- Any document requiring e-signature from Claude Code

## Tips & Gotchas

- Requires Python 3.11+
- Free SignNow developer account at signnow.com/developers
- Upload .docx as templates, place signature fields via embedded editor
- Create a free SignNow developer account at signnow.com/developers — just needs API credentials extracted

## Installed In

| Location | Config Path |
|----------|-------------|
| your-project-2-gdrive | `~/Library/CloudStorage/GoogleDrive-YOUR_EMAIL/My Drive/.mcp.json` |
