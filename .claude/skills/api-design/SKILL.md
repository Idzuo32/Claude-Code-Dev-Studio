---
name: api-design
description: REST API design — URL conventions, response shapes, error handling, pagination, versioning, and documentation. Stack-agnostic.
---

# API Design

## URL Conventions
```
GET    /api/v1/resources          List (with pagination)
GET    /api/v1/resources/:id      Read one
POST   /api/v1/resources          Create
PATCH  /api/v1/resources/:id      Partial update
PUT    /api/v1/resources/:id      Full replace
DELETE /api/v1/resources/:id      Delete
GET    /api/v1/resources/:id/sub  Nested resource (max 2 levels)
POST   /api/v1/resources/:id/activate  Action (noun + verb suffix)
```

Rules:
- Lowercase, kebab-case paths
- Plural resource names
- Version in URL from day 1 (`/v1/`)
- Nouns in paths, not verbs (except action endpoints)

## Standard Response Shapes

### Success — single resource
```json
{ "data": { "id": "...", "name": "..." } }
```

### Success — collection
```json
{
  "data": [...],
  "meta": { "total": 100, "page": 1, "pageSize": 20, "hasMore": true }
}
```

### Error
```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Email is required",
    "details": [
      { "field": "email", "message": "Required" }
    ]
  }
}
```

Use the same shape consistently across your entire API.

## HTTP Status Codes
```
200 OK             Successful GET, PATCH, PUT
201 Created        Successful POST
204 No Content     Successful DELETE
400 Bad Request    Invalid input / validation error
401 Unauthorized   Not authenticated
403 Forbidden      Authenticated but not authorized
404 Not Found      Resource doesn't exist (also use for auth-sensitive 403s)
409 Conflict       Duplicate resource (unique constraint)
422 Unprocessable  Semantic validation failed
429 Too Many Req   Rate limited
500 Server Error   Never expose internal details
```

## Pagination

### Offset (simpler)
```
GET /api/v1/posts?page=2&pageSize=20
```
Use for: admin panels, small datasets, random-access navigation

### Cursor (scalable)
```
GET /api/v1/posts?cursor=<opaque_cursor>&limit=20
```
Use for: infinite scroll, real-time feeds, large datasets

## Versioning Strategy
- Version in URL path: `/api/v1/`, `/api/v2/`
- Never break an existing version — release a new one
- Maintain old versions for at minimum 6 months after deprecation notice
- Document deprecation in response headers: `Deprecation: true`, `Sunset: <date>`

## Input Validation
Validate every field on every request:
- Type (string, number, boolean)
- Format (email, URL, UUID, date)
- Length (min, max)
- Range (min value, max value)
- Required vs optional
- Enum (must be one of these values)

Reject early with a 400 and field-level error details. Do not attempt to "fix" invalid input.

## OpenAPI Documentation
Every production API should have an OpenAPI 3.x spec. Generate it from code if your framework supports it; otherwise write it by hand and keep it in sync.
