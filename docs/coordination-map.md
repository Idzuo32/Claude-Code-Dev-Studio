# Agent Coordination Map

How agents collaborate across a typical feature lifecycle.

---

## Feature Development Flow

```
You
│
├─ /spec ──────────────────→ product-director
│                              Produces: docs/prd-[feature].md
│
├─ /plan ──────────────────→ architecture-director + tech-lead
│                              Produces: docs/plan-[feature].md
│                              ADR if tech decision needed
│
├─ Build (by phase) ───────→ Department Lead assigns Specialists
│   │
│   ├─ UI work ────────────→ frontend-lead → frontend-developer
│   ├─ Mobile work ────────→ mobile-lead → mobile-developer
│   ├─ API work ───────────→ backend-lead → backend-developer
│   ├─ Schema work ────────→ backend-lead → database-architect
│   ├─ Auth work ──────────→ backend-lead → auth-specialist
│   └─ Payment work ───────→ backend-lead → payments-specialist
│
├─ /review ────────────────→ code-reviewer → tech-lead
│
├─ /audit (pre-launch) ────→ security-lead + accessibility-specialist + performance-engineer
│
└─ /deploy ────────────────→ devops-lead → devops-engineer → you (approve)
```

---

## Cross-Department Decisions

When a task crosses two departments:

| Scenario | Lead it |
|----------|---------|
| API contract (frontend + backend) | backend-lead proposes; frontend-lead approves |
| Auth flow (frontend + security) | security-lead defines requirements; frontend-developer implements |
| Mobile + backend integration | mobile-lead and backend-lead align on contract |
| Database schema + API shape | database-architect and backend-lead co-design |
| Performance + UX trade-off | performance-engineer and design-lead escalate to you |

---

## Decision Authority Matrix

| Decision type | Who decides |
|---|---|
| What to build | You (with product-director support) |
| How the system is structured | architecture-director (with your approval) |
| Which technology to use | architecture-director (with your approval) |
| API design | backend-lead |
| Database schema | database-architect (with backend-lead review) |
| UI component structure | frontend-lead |
| Test strategy | qa-lead |
| Security requirements | security-lead (non-negotiable items go to you) |
| Deployment timing | You |
| Dependencies to add | You (agents propose, you approve) |

---

## When to Escalate

**Specialists escalate to their lead when:**
- A task requires touching something outside their domain
- A requirement contradicts an existing decision
- They are unsure about intended behavior

**Leads escalate to Architecture Director when:**
- A decision affects multiple departments
- There's a significant trade-off with long-term implications
- An existing ADR needs to be revisited

**Architecture Director escalates to you when:**
- The decision affects product scope or release timeline
- A security risk requires a product-level trade-off
- The budget or platform choice needs to change
