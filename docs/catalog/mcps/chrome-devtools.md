# Chrome DevTools

- **Type:** MCP Server
- **Package:** `chrome-devtools-mcp`
- **Scope:** Global
- **Status:** Active

## What It Does

Direct Chrome browser access via DevTools Protocol — navigate, read console, capture errors, fill forms, execute JS, inspect DOM, run Lighthouse audits, trace performance.

## Tools Exposed

| Tool | Description |
|------|-------------|
| `click` | Click an element |
| `close_page` | Close a browser page |
| `drag` | Drag an element |
| `emulate` | Emulate a device |
| `evaluate_script` | Execute JavaScript in the page |
| `fill` | Fill a form field |
| `fill_form` | Fill an entire form |
| `get_console_message` | Get a specific console message |
| `get_network_request` | Get a specific network request |
| `handle_dialog` | Handle a browser dialog |
| `hover` | Hover over an element |
| `lighthouse_audit` | Run a Lighthouse audit |
| `list_console_messages` | List console messages |
| `list_network_requests` | List network requests |
| `list_pages` | List open browser pages |
| `navigate_page` | Navigate to a URL |
| `new_page` | Open a new page |
| `performance_analyze_insight` | Analyze performance insights |
| `performance_start_trace` | Start a performance trace |
| `performance_stop_trace` | Stop a performance trace |
| `press_key` | Press a keyboard key |
| `resize_page` | Resize the browser window |
| `select_page` | Select/switch to a page |
| `take_memory_snapshot` | Take a memory snapshot |
| `take_screenshot` | Take a screenshot |
| `take_snapshot` | Take a DOM snapshot |
| `type_text` | Type text into a field |
| `upload_file` | Upload a file |
| `wait_for` | Wait for an element or condition |

## Configuration

```json
{
  "chrome-devtools": {
    "type": "stdio",
    "command": "npx",
    "args": ["-y", "chrome-devtools-mcp"],
    "env": {}
  }
}
```

**Environment variables:** None.

## When to Use

Interactive debugging — navigate to localhost:3000, submit forms, check console errors, inspect network requests. "Why is this page broken?" sessions.

## Tips & Gotchas

- Operates in its own browser context — cannot see your personal Chrome tabs
- Use for interactive debugging; use Playwright for headless automated tests
- Claude Code also has a native `/chrome` command for the Claude in Chrome extension

## Installed In

| Location | Config Path |
|----------|-------------|
| Global | `global-config/claude-code/mcp-servers.json` |
