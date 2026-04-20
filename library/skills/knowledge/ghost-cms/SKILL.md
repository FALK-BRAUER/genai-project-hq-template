---
name: ghost-cms
description: Ghost Admin API patterns — creating, updating, and publishing posts via @tryghost/admin-api. Reference when working with Ghost CMS integration.
---

## Setup
```typescript
import GhostAdminAPI from '@tryghost/admin-api';

const api = new GhostAdminAPI({
  url: process.env.GHOST_URL,
  key: process.env.GHOST_ADMIN_API_KEY,
  version: 'v5.0'
});
```

## Core Operations

### Create a post (draft)
```typescript
const post = await api.posts.add({
  title: 'Post title',
  html: '<p>Content</p>',
  status: 'draft',
  tags: [{ name: 'AI' }],
  feature_image: 'https://...'
});
```

### Publish immediately
```typescript
await api.posts.edit({ id: post.id, status: 'published' }, { source: 'html' });
```

### Schedule a post
```typescript
await api.posts.edit({
  id: post.id,
  status: 'scheduled',
  published_at: new Date('2026-04-01T09:00:00Z').toISOString()
});
```

### Upload an image
```typescript
const { url } = await api.images.upload({ file: '/path/to/image.jpg' });
```

## Key Gotchas
- Always pass `{ source: 'html' }` as second arg to `edit()` — without it Ghost converts HTML to Lexical and corrupts formatting
- `published_at` must be in the future for scheduling — Ghost rejects past timestamps silently
- Feature images must be uploaded to Ghost first — external URLs work but may break on theme changes
- Tags are matched by name (case-insensitive) — new tags are auto-created
- API key format: `id:secret` — never split or modify
