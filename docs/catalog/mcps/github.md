# GitHub

- **Type:** MCP Server
- **Package:** `@modelcontextprotocol/server-github`
- **Scope:** Global
- **Status:** Active

## What It Does

Full GitHub integration — issues, PRs, file contents, branches, search, code review.

## Tools Exposed

| Tool | Description |
|------|-------------|
| `add_issue_comment` | Comment on an issue |
| `create_branch` | Create a new branch |
| `create_issue` | Create a new issue |
| `create_or_update_file` | Create or update a file in a repo |
| `create_pull_request` | Create a PR |
| `create_pull_request_review` | Submit a PR review |
| `create_repository` | Create a new repo |
| `fork_repository` | Fork a repo |
| `get_file_contents` | Read file contents from a repo |
| `get_issue` | Get issue details |
| `get_pull_request` | Get PR details |
| `get_pull_request_comments` | Get PR comments |
| `get_pull_request_files` | Get files changed in a PR |
| `get_pull_request_reviews` | Get PR reviews |
| `get_pull_request_status` | Get PR check status |
| `list_commits` | List commits |
| `list_issues` | List issues |
| `list_pull_requests` | List PRs |
| `merge_pull_request` | Merge a PR |
| `push_files` | Push files to a repo |
| `search_code` | Search code across repos |
| `search_issues` | Search issues |
| `search_repositories` | Search repos |
| `search_users` | Search users |
| `update_issue` | Update an issue |
| `update_pull_request_branch` | Update PR branch |

## Configuration

```json
{
  "github": {
    "type": "stdio",
    "command": "npx",
    "args": ["-y", "@modelcontextprotocol/server-github"],
    "env": {
      "GITHUB_TOKEN": "${GITHUB_TOKEN}"
    }
  }
}
```

**Environment variables:** `GITHUB_TOKEN` — fine-grained personal access token.

## When to Use

Any time you're working with GitHub — creating issues, reviewing PRs, searching repos, pushing code. Claude uses this automatically when you mention GitHub tasks.

## Tips & Gotchas

- Use fine-grained tokens with minimum permissions per org
- Don't use classic tokens
- Claude Code also has built-in `gh` CLI access — MCP is better for structured operations, CLI for ad-hoc commands

## Installed In

| Location | Config Path |
|----------|-------------|
| Global | `global-config/claude-code/mcp-servers.json` |
