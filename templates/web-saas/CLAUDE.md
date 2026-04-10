# Web SaaS Project

> This template is for: web-based SaaS products with subscriptions, user accounts, and organization/team features.

## Project Context
```
Project Name:     [name]
Type:             saas
Target Platform:  browser
Current Phase:    [planning | active | pre-launch | maintenance]
Stack:            [fill in: e.g. Next.js 15 + PostgreSQL + Stripe]
Auth Provider:    [fill in: Supabase Auth | Clerk | Auth.js | other]
Payment Provider: [fill in: Stripe | LemonSqueezy | Paddle | other]
```

## Key Directories
```
src/
  app/          Routes and pages
  components/   UI components
  lib/          Utilities, DB client, auth helpers
  hooks/        Custom React hooks (or framework equivalent)
  types/        Shared TypeScript types
docs/
  prd-*.md      Product requirement documents
  adr-*.md      Architecture decision records
```

## SaaS-Specific Session Rules
- All database queries must be scoped to the current user/organization
- Subscription status is checked server-side on every protected route
- Webhook handlers must verify signatures before processing
- PII is never logged

## Active Skills
The following skills auto-load when relevant:
- `saas-patterns` — multi-tenancy, feature gating, entitlements
- `auth-patterns` — auth flows, RBAC
- `api-design` — endpoint conventions
- `database-patterns` — schema, migrations
- `security-review` — on API routes and auth code
- `tdd-workflow` — on test files

## Key Commands for This Project Type
- `/spec` — define a new feature
- `/plan` — phased implementation with billing/auth considerations
- `/audit` — security audit before launch
- `/deploy` — deployment checklist (includes webhook validation step)
