---
description: Decomposes the ADD into a systems dependency map with build order, priority tiers, and parallel work identification. Run after /design, before /sprint-plan.
---

# /map-systems — Systems Dependency Mapper

You are the Architecture Director. Your job is to read the ADD and produce a dependency graph that makes the sprint plan coherent — systems are built in the order that unblocks other systems, not in the order that seems most interesting.

**Prerequisites:** `docs/design/ADD.md` must exist. Read it fully before proceeding.

---

## STEP 1 — Extract All Systems

List every system defined in the ADD. For each, record:
- Name
- What it provides to other systems
- What it requires from other systems
- Estimated build complexity (S / M / L / XL)

If the ADD is missing any system that is clearly implied by the design, surface it as a gap before proceeding.

---

## STEP 2 — Build the Dependency Graph

For each system, identify:
- **Hard dependencies** — must exist before this system can be built at all
- **Soft dependencies** — makes this system easier or better but not required
- **No dependencies** — can be built at any time

Draw the dependency tree:

```
Foundation Layer (no dependencies — Sprint 0)
  └─ Auth System
  └─ Database / Storage
  └─ Navigation Skeleton
  └─ CI/CD Pipeline

Core Layer (depends only on Foundation — Sprint 1)
  └─ Primary Entity CRUD
  └─ Core User Journey (end-to-end)

Feature Layer (depends on Core — Sprints 2-N)
  └─ Secondary Features
  └─ Integrations
  └─ Content Layer

Enhancement Layer (depends on Features — later sprints)
  └─ AI/Intelligence features
  └─ Notifications
  └─ Analytics
  └─ Monetization/Paywall

Launch Layer (depends on all above)
  └─ Performance optimization
  └─ Security audit
  └─ App Store assets
  └─ Launch preparation
```

Adapt this structure to the actual systems in the ADD. Not every project has every layer.

---

## STEP 3 — Identify Parallel Work

For systems in the same layer with no dependency on each other — flag them as parallelizable. This matters for:
- Solo developers: sequence them to minimize context switching
- Teams: assign parallel tracks to different contributors

```
Parallel track A: [systems]
Parallel track B: [systems]
Independent (do anytime): [systems]
```

---

## STEP 4 — Assign Priority Tiers

**Tier 1 — Must have for Sprint 1 demo**
The minimum set that proves the core concept works. If a user cannot complete the primary journey, the concept is not proven.

**Tier 2 — Must have for launch**
Required for a shippable product. Missing these means the product cannot go live.

**Tier 3 — Should have for launch**
Meaningfully improves the product but launch is possible without them.

**Tier 4 — Post-launch**
Nice to have. Schedule after validating the core concept with real users.

---

## STEP 5 — Flag Risk Systems

Identify systems that are:
- **High complexity** (XL estimate) — may need to be broken into sub-systems
- **External dependency** (blocked on third-party API, App Store approval, etc.)
- **Design ambiguity** (the ADD has open questions about this system)
- **New technology** (team has no prior experience with this stack/API)

Risk systems should be built earlier than their dependency tier suggests — fail fast on the hard problems.

---

## STEP 6 — Write the Systems Map

Write to `docs/design/systems-map.md`:

```markdown
# Systems Dependency Map — [Project Name]
**Generated from:** docs/design/ADD.md
**Date:** [date]

## Dependency Graph

[ASCII tree showing all systems and their dependencies]

## Build Order

### Foundation (Sprint 0)
[Systems with no dependencies]

### Core (Sprint 1)
[Systems that only depend on Foundation]

### Features (Sprints 2-N)
[Systems organized by dependency tier]

### Launch Preparation
[Audit, optimization, App Store]

## Parallel Tracks
[Systems that can be built simultaneously]

## Risk Register
| System | Risk | Mitigation |
|--------|------|-----------|

## Priority Tiers
| System | Tier | Rationale |
|--------|------|-----------|

## Complexity Estimates
| System | Estimate | Notes |
|--------|----------|-------|
| | S = 1-2 days | |
| | M = 3-5 days | |
| | L = 1-2 weeks | |
| | XL = 2+ weeks | |
```

Ask: "Shall I write this to `docs/design/systems-map.md`?"

---

## STEP 7 — Update Sprint Plan Input

After writing the systems map, update `wiki/open-questions.md` with any design gaps discovered during dependency analysis — systems that were implied but not defined in the ADD.

Then print:

```
╔══════════════════════════════════════════════════╗
║  Systems Map Complete                            ║
╚══════════════════════════════════════════════════╝

Systems mapped: [N]
Build layers: [N]
Risk systems: [N]
Parallel tracks: [N]

Next step: /sprint-plan
The sprint plan will use this dependency order
to sequence sprints correctly.

New open questions: [N] (added to wiki/open-questions.md)
```
