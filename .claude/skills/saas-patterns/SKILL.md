---
name: saas-patterns
description: Core SaaS application patterns — multi-tenancy, subscription gating, feature flags, onboarding flows, and usage metering. Stack-agnostic concepts with illustrative code examples.
---

# SaaS Patterns

## Multi-Tenancy Models

### Single-tenant (isolated DB per customer)
- Best for: Enterprise, high data-isolation requirements
- Cost: High (one DB instance per customer)
- Complexity: Medium (routing layer needed)

### Schema-per-tenant (one DB, isolated schemas)
- Best for: Mid-market SaaS, moderate isolation requirements
- Cost: Medium

### Shared schema with tenant ID (most common)
- Best for: SMB SaaS, startups, cost-sensitive
- Cost: Low
- **Implementation:** Every table has `organization_id`. ALL queries filter by it.

```sql
-- Example shared-schema multi-tenant table
CREATE TABLE projects (
  id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  organization_id UUID NOT NULL REFERENCES organizations(id),
  name            TEXT NOT NULL,
  created_at      TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Row-level enforcement (PostgreSQL example)
-- Every SELECT, UPDATE, DELETE must include WHERE organization_id = $current_org
```

## Subscription Gating Pattern
```
User → Check entitlement → Has feature? → Allow / Block + Upgrade prompt
```

Store entitlements in your own DB, synced from the payment processor via webhook. Never trust the client to report plan status.

```typescript
// Stack-agnostic entitlement check (TypeScript example)
const PLAN_FEATURES: Record<string, string[]> = {
  free:       ['projects:3',    'members:1',  'export:false'],
  pro:        ['projects:20',   'members:10', 'export:true'],
  enterprise: ['projects:unlimited', 'members:unlimited', 'export:true'],
}

function hasFeature(plan: string, feature: string): boolean {
  return PLAN_FEATURES[plan]?.includes(feature) ?? false
}
```

## Feature Flags
Three levels:
1. **Plan-gated** — based on subscription tier (see above)
2. **User-gated** — specific users/orgs get early access
3. **Percentage rollout** — gradual release to % of users

Simple implementation: a `feature_flags` table with `(flag_name, enabled_for_plans[], enabled_for_orgs[])`.

For production use, consider: LaunchDarkly, Unleash, Flagsmith, or PostHog feature flags.

## Onboarding Checklist Pattern
```
Steps: [ profile_complete, first_resource_created, team_invited, integration_connected ]
Progress: stored in DB per user/org
Trigger: show checklist widget until all steps complete
```

Onboarding completion correlates strongly with retention. Do not skip this.

## Usage Metering
Track usage in your DB as events occur. Report to payment processor periodically or per billing cycle.

```
Event occurs → Increment usage counter → Billing period ends → Report to Stripe/processor
```

Enforce limits proactively: check `current_usage < plan_limit` before allowing the action.
