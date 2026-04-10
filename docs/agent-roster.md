# Agent Roster

Full reference of all agents in the studio, their scope, and when to invoke them.

---

## Tier 1 — Directors

| Agent | Model | When to invoke |
|-------|-------|---------------|
| `product-director` | Opus | Writing PRDs, user stories, defining feature scope, prioritization |
| `architecture-director` | Opus | Tech stack selection, system design, ADRs, scalability decisions |
| `tech-lead` | Sonnet | Code review, refactoring decisions, technical debt triage, coding standards |

---

## Tier 2 — Department Leads

| Agent | Model | When to invoke |
|-------|-------|---------------|
| `frontend-lead` | Sonnet | Web UI architecture, component system decisions, styling strategy, rendering approach |
| `mobile-lead` | Sonnet | Mobile architecture, native integration strategy, app store decisions, EAS/build config |
| `backend-lead` | Sonnet | API design, data modeling, service decomposition, integration architecture |
| `devops-lead` | Sonnet | CI/CD strategy, infrastructure decisions, deployment architecture, cost planning |
| `design-lead` | Sonnet | UX flow design, design system decisions, accessibility strategy |
| `qa-lead` | Sonnet | Test strategy, coverage requirements, release readiness, bug triage |
| `security-lead` | Opus | Threat modeling, auth flow review, security architecture, pre-launch sign-off |

---

## Tier 3 — Specialists

| Agent | Model | When to invoke |
|-------|-------|---------------|
| `frontend-developer` | Sonnet | Building web UI components, pages, forms, client-side logic (any framework) |
| `mobile-developer` | Sonnet | Building mobile screens, navigation, native device integrations (any stack) |
| `backend-developer` | Sonnet | API endpoints, business logic, background jobs, services (any stack) |
| `database-architect` | Sonnet | Schema design, migrations, indexes, query optimization (any database) |
| `auth-specialist` | Sonnet | Login/signup flows, OAuth, session management, RBAC |
| `payments-specialist` | Sonnet | Subscription logic, checkout flows, webhooks, entitlement enforcement |
| `devops-engineer` | Sonnet | CI/CD pipelines, Docker, deployment scripts, cloud config |
| `code-reviewer` | Sonnet | Pre-merge code review, quality assessment, technical debt identification |
| `accessibility-specialist` | Sonnet | WCAG compliance, ARIA patterns, keyboard navigation, screen reader testing |
| `performance-engineer` | Sonnet | Profiling, optimization, bundle analysis, query tuning |
| `documentation-writer` | Sonnet | READMEs, API docs, runbooks, changelogs |

---

## Escalation Map

```
frontend-developer     → frontend-lead     → architecture-director → you
mobile-developer       → mobile-lead       → architecture-director → you
backend-developer      → backend-lead      → architecture-director → you
database-architect     → backend-lead      → architecture-director → you
auth-specialist        → security-lead     → architecture-director → you
payments-specialist    → backend-lead      → architecture-director → you
devops-engineer        → devops-lead       → architecture-director → you
code-reviewer          → tech-lead         → architecture-director → you
accessibility-specialist → design-lead     → frontend-lead         → you
performance-engineer   → tech-lead         → architecture-director → you
documentation-writer   → tech-lead         → you
```

---

## Model Usage Notes

- **Opus** agents (product-director, architecture-director, security-lead): Used for complex reasoning, architectural decisions, and security analysis. Higher cost; use for high-stakes decisions.
- **Sonnet** agents (all others): Default for implementation, review, and most day-to-day tasks. Excellent quality at lower cost.

You can override the model for any agent by editing the `model:` field in the agent's frontmatter.
