---
name: security-review
description: Security review checklist covering OWASP Top 10, auth, input validation, secrets hygiene, and dependency scanning. Stack-agnostic.
---

# Security Review

## OWASP Top 10 Quick Checks

### A01: Broken Access Control
Every request to a protected resource must:
1. Authenticate the user
2. Verify the user owns or has permission to access this specific resource
3. Return 404 (not 403) when the existence itself is sensitive

```
// Check ownership — not just authentication
resource = db.find(id)
if (!resource || resource.owner_id != current_user.id) → 404
```

### A02: Cryptographic Failures
- Never store passwords — delegate to auth provider
- Use HTTPS everywhere, including internal services
- Encrypt PII at rest
- Use strong, up-to-date TLS (TLS 1.2+)

### A03: Injection
- Use parameterized queries or ORM — never string interpolation in SQL
- Validate and sanitize all user input
- Escape output in templates

### A05: Security Misconfiguration
- Remove default credentials, debug endpoints, example routes
- Disable directory listing
- Set security headers (see below)
- Different secrets per environment

### A07: Auth Failures
- Rate-limit auth endpoints
- Invalidate sessions on logout
- Enforce token expiry
- MFA for admin/sensitive accounts

## Security Headers
```
X-Frame-Options: SAMEORIGIN
X-Content-Type-Options: nosniff
Referrer-Policy: strict-origin-when-cross-origin
Content-Security-Policy: (configure per app)
Strict-Transport-Security: max-age=31536000; includeSubDomains
```

## Secrets Hygiene
```bash
# Check for accidentally committed secrets
git log -p | grep -iE "(api_key|secret|password|token)\s*=" | grep -v ".env"

# Scan with a tool
npx @secretlint/secretlint "**/*"       # JS/TS projects
trufflehog git file://. --only-verified # any project
```

## Dependency Vulnerabilities
```bash
npm audit                    # Node.js
pip-audit                    # Python
cargo audit                  # Rust
bundle exec bundler-audit    # Ruby
```

Run on every CI build. Block on high/critical.

## IDOR Checklist
Before shipping any endpoint that takes a resource ID:
- [ ] Does the current user own this resource?
- [ ] If multi-tenant: does this resource belong to the user's org?
- [ ] Would a different user ID in the request work?
- [ ] Does the endpoint return 404 (not 403) for unauthorized access?

## Pre-Launch Security Checklist
- [ ] All auth endpoints rate-limited
- [ ] Security headers configured
- [ ] No secrets in codebase or git history
- [ ] `npm audit` / `pip-audit` clean or known exceptions documented
- [ ] Debug mode off in production
- [ ] Error responses don't leak stack traces or internal details
- [ ] HTTPS enforced everywhere
