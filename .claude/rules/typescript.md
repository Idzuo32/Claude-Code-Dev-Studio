---
description: TypeScript-specific standards.
globs: "**/*.ts,**/*.tsx"
---

# TypeScript Standards

## Configuration (tsconfig.json)
```json
{
  "compilerOptions": {
    "strict": true,
    "noUncheckedIndexedAccess": true,
    "exactOptionalPropertyTypes": true,
    "noImplicitOverride": true
  }
}
```

## Types
- Prefer `interface` over `type` for object shapes (better error messages, extensible)
- Use discriminated unions for state machines: `{ status: 'loading' } | { status: 'success'; data: T } | { status: 'error'; error: Error }`
- Use Zod for runtime validation + type inference: `type User = z.infer<typeof UserSchema>`
- Avoid `as` type assertions unless absolutely necessary and add a comment explaining why

## Imports
- Use named imports; avoid default exports except for pages/layouts/route handlers
- Group imports: external packages → internal aliases → relative
- Use `@/` path alias for src root imports

## Async
- Always use `async/await` over Promise chains
- Handle rejections explicitly — never let `Promise` rejections go uncaught
- Use `Promise.all()` for parallel independent async operations

## Zod Patterns
```typescript
// Schema definition
const schema = z.object({ email: z.string().email() })

// Parse (throws on failure)
const data = schema.parse(input)

// Safe parse (returns result object)
const result = schema.safeParse(input)
if (!result.success) {
  console.error(result.error.issues)
}
```
