# Claude API

- **Type:** Skill (Library)
- **Command:** N/A (loaded contextually)
- **Source:** hq library
- **Scope:** Library — install in any content/Next.js project
- **Category:** Knowledge
- **Status:** Active

## What It Does
Anthropic SDK patterns reference for building features that call Claude directly via `@anthropic-ai/sdk`. Covers setup, model selection (Opus for complex reasoning, Sonnet for everyday tasks, Haiku for classification), basic message creation, streaming responses, and tool use with input schemas.

## Used By
| Project | How Loaded |
|---------|------------|
| your-content-project | Symlinked from library |

## Tips & Gotchas
- Never hardcode API keys -- use environment variables.
- Set `max_tokens` explicitly -- the API has no default and will error without it.
- Handle `overloaded_error` with exponential backoff (happens at peak load).
- Use the `system` parameter for persistent instructions, not user messages.
- Track token usage via `message.usage.input_tokens + output_tokens` for cost monitoring.
