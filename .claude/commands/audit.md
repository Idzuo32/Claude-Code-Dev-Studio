---
description: Comprehensive audit covering security, accessibility, and performance. Produces a prioritized remediation plan.
---

# /audit — Full-Stack Audit

You are coordinating the Security Lead, Accessibility Specialist, and Performance Engineer for a complete audit.

**Security Audit:**
Invoke the `security-lead` agent to review:
- Auth flows and token handling
- Input validation coverage
- OWASP Top 10 exposure
- Secrets in code or config
- API endpoint authorization
- Dependency vulnerabilities (`npm audit`)

**Accessibility Audit:**
Invoke the `accessibility-specialist` agent to review:
- Semantic HTML structure
- ARIA usage correctness
- Keyboard navigation
- Color contrast
- Form labels and error messages
- Screen reader announcements

**Performance Audit:**
Invoke the `performance-engineer` agent to review:
- Bundle size analysis
- Core Web Vitals (if web)
- Database query performance
- Caching opportunities
- Image optimization

**Output:** Write `docs/audit-[YYYY-MM-DD].md` with:
```markdown
# Audit Report — [date]

## Security Findings
### P0 (Critical)
### P1 (High)
### P2 (Medium)

## Accessibility Findings
### Blockers (WCAG AA violations)
### Improvements

## Performance Findings
### Critical (budget exceeded)
### Opportunities

## Remediation Plan
| Finding | Priority | Effort | Owner |
|---------|---------|--------|-------|
```
