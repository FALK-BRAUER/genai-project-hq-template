# Filesystem

- **Type:** MCP Server
- **Package:** `@modelcontextprotocol/server-filesystem`
- **Scope:** Global
- **Status:** Active

## What It Does

Controlled file access — read, write, search, list directories. Scoped to specific paths.

## Tools Exposed

| Tool | Description |
|------|-------------|
| `create_directory` | Create a directory |
| `directory_tree` | Show directory tree structure |
| `edit_file` | Edit a file |
| `get_file_info` | Get file metadata |
| `list_allowed_directories` | List directories this server can access |
| `list_directory` | List directory contents |
| `list_directory_with_sizes` | List directory contents with file sizes |
| `move_file` | Move/rename a file |
| `read_file` | Read a text file |
| `read_media_file` | Read a media file (images, etc.) |
| `read_multiple_files` | Read multiple files at once |
| `read_text_file` | Read a text file |
| `search_files` | Search for files by name |
| `write_file` | Write content to a file |

## Configuration

```json
{
  "filesystem": {
    "type": "stdio",
    "command": "npx",
    "args": [
      "-y", "@modelcontextprotocol/server-filesystem",
      "$HOME/projects",
      "$HOME/hq",
      "$HOME/Library/CloudStorage/GoogleDrive-YOUR_EMAIL/My Drive"
    ],
    "env": {}
  }
}
```

**Environment variables:** None. Paths are configured as CLI args.

## When to Use

When Claude needs explicit file system access beyond the current project directory. Particularly useful for cross-project file operations and Google Drive access.

## Tips & Gotchas

- Only lists directories you've granted — never set `/`
- Three scoped paths: `~/projects`, `~/hq`, Google Drive
- Claude Code also has built-in Read/Write/Edit tools — this MCP adds cross-directory and Google Drive access

## Installed In

| Location | Config Path |
|----------|-------------|
| Global | `global-config/claude-code/mcp-servers.json` |
