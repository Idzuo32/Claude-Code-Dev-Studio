---
description: API and backend service standards.
globs: "src/app/api/**,src/routes/**,supabase/functions/**"
---

# API Standards

## Every Route Handler Must
1. Authenticate the user (unless explicitly public)
2. Validate all input with Zod
3. Return typed, consistent response shapes
4. Handle errors and return appropriate HTTP status codes
5. Have a corresponding integration test

## Authentication Check Pattern
```typescript
const { data: { user } } = await supabase.auth.getUser()
if (!user) {
  return Response.json({ error: { code: 'UNAUTHORIZED', message: 'Sign in required' } }, { status: 401 })
}
```

## Input Validation
```typescript
const body = RequestSchema.safeParse(await request.json())
if (!body.success) {
  return Response.json(
    { error: { code: 'VALIDATION_ERROR', details: body.error.flatten() } },
    { status: 400 }
  )
}
```

## Error Response Hierarchy
- `400` — client sent bad data
- `401` — not authenticated
- `403` — authenticated but forbidden  
- `404` — resource not found (also use for 403 when existence is sensitive)
- `409` — conflict (duplicate email, etc.)
- `500` — server error (log full error, return generic message)

## No Sensitive Data in Responses
```typescript
// ❌ Never return
{ user, password_hash, stripe_customer_id, internal_id }

// ✅ Return only what client needs
{ id, name, email, plan }
```
