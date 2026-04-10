---
name: auth-patterns
description: Authentication and authorization patterns — provider selection guide, RBAC, session management, and OAuth flows. Stack-agnostic with illustrative examples.
---

# Auth Patterns

## Provider Selection Guide

| Scenario | Recommended |
|----------|------------|
| Next.js + any DB | Auth.js (NextAuth v5) |
| Supabase backend | Supabase Auth |
| Need organizations/teams | Clerk |
| Firebase project | Firebase Auth |
| Enterprise / SSO | Auth0 or Clerk |
| Mobile (React Native) | Supabase Auth or Clerk |
| Mobile (Flutter) | Firebase Auth or Supabase Auth |
| Self-hosted, max control | Keycloak or custom JWT |

## OAuth Flow (any provider)
```
1. User clicks "Sign in with X"
2. Redirect to provider with client_id, redirect_uri, scope, state
3. User authenticates with provider
4. Provider redirects back with ?code=...&state=...
5. Verify state matches (CSRF protection)
6. Exchange code for access_token via server-side POST
7. Fetch user profile using access_token
8. Create/update user in your DB
9. Issue your own session token/cookie
```

## Session Storage by Platform
- **Web:** httpOnly, Secure, SameSite=Strict cookie (never localStorage for tokens)
- **Mobile:** OS secure storage (iOS Keychain via SecureStore, Android Keystore)
- **Desktop:** OS keychain or encrypted file

## JWT Best Practices
```
Access token:  short-lived (15 min), stored in memory or httpOnly cookie
Refresh token: long-lived (30 days), httpOnly cookie, rotated on use
```

Never store JWTs in localStorage — XSS can steal them.

## RBAC Pattern (stack-agnostic)
```
Roles:   owner > admin > member > viewer
Permissions: { 'resource:action': ['allowed_roles'] }
Check: user.role in PERMISSIONS['resource:action']
```

Store roles in your DB. Check on every request server-side. Do not trust client-supplied role claims.

## Middleware Pattern (protect routes)
Every framework has a middleware concept. The pattern is the same:
```
Request arrives
→ Extract token from cookie/header
→ Verify token (signature + expiry)
→ Load user from DB (don't trust token payload for sensitive data)
→ Check route permissions
→ Allow or redirect to /login
```

## Common Mistakes
- Using GET requests for auth actions (logout, token refresh) — use POST
- Not invalidating tokens on logout (server-side blocklist or short expiry)
- Trusting user-supplied role in JWT without verifying against DB
- Not rate-limiting auth endpoints (brute force protection)
