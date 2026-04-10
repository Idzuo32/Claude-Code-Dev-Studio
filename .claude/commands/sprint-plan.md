---
description: Generate the full sprint document suite for a project — from Sprint 0 through Launch Sprint. Uses the systems map (from /map-systems) for dependency-ordered sprints when available, otherwise derives from PRD and architecture.
---

# /sprint-plan — Sprint Document Generator

You are the Tech Lead, coordinating with the QA Lead and the relevant Department Lead for the project's track.

**Prerequisites:** `docs/prd.md` and `docs/architecture.md` must exist. Read both before proceeding.

**Step 1: Check for design phase documents**

Check whether these files exist:
- `docs/design/ADD.md` — Application Design Document
- `docs/design/systems-map.md` — Systems dependency map

**If systems-map.md exists (design phase was completed):**
Use the systems map as the primary sprint sequencing input. The dependency order in the systems map overrides intuition about what to build first. Sprints are derived from the map's build layers:
- Foundation layer → Sprint 0
- Core layer → Sprint 1
- Feature layers → Sprints 2-N in dependency order
- Launch layer → Pre-launch and Launch sprints

**If systems-map.md does not exist (design phase was skipped):**
Proceed with PRD and architecture docs as before. Consider recommending `/design` → `/map-systems` before proceeding — skipping the design phase means sprint order is based on feature preference rather than system dependencies, which often causes blockers mid-project.

**Step 2: Extract sprint inputs**
From the PRD (and ADD if present), identify:
- Primary user story (defines Sprint 1's core loop)
- All acceptance criteria (become sprint exit criteria)
- Feature list (each becomes a feature sprint)
- Out-of-scope items (do not appear in any sprint)

From the architecture doc (and systems map if present), identify:
- Tech stack (determines Sprint 0 setup tasks)
- Third-party integrations (each needs setup time)
- Known technical risks (surface in early sprints)
- Risk systems from the systems map (build these earlier than dependency tier suggests)

**Step 2: Generate Sprint 0 — Foundation**
This sprint is always the same structure, adapted for the specific stack:

```markdown
# Sprint 0 — Foundation
**Duration:** 1 week
**Goal:** A running skeleton. No features, but everything needed to build features safely.

## Exit Criteria (all must pass before Sprint 1 begins)
- [ ] Repository created with .gitignore and README
- [ ] CI/CD pipeline running (lint + typecheck + test on push)
- [ ] [Stack-specific]: Auth flow working end-to-end (login, logout, protected route)
- [ ] [Stack-specific]: Database connected and schema initialized
- [ ] Core navigation skeleton renders on target platform
- [ ] Environment variables documented in .env.example
- [ ] "Hello World" confirmed running on target device/browser

## Tasks
[Stack-specific task list]

## Agents
[Which agents own which tasks]

## Risks
[Known setup risks for this stack]
```

**Step 3: Generate Sprint 1 — Core Loop**
The core loop is the single most important user flow, end-to-end. Even if the UI is rough.

```markdown
# Sprint 1 — Core Loop
**Duration:** 1 week
**Goal:** [Primary user story] — working end-to-end, even if not polished.
**This sprint proves the concept is buildable.**

## Exit Criteria
- [ ] [Primary user story acceptance criteria]
- [ ] Tests covering the happy path and one error case
- [ ] Tech Lead has reviewed the code
- [ ] Tested on target platform by a real user (even if just you)

## Tasks
[Derived from primary user story]

## Definition of Done
A user can complete [primary action] from start to finish without hitting an error.
```

**Step 4: Generate Feature Sprints (2-N)**
One sprint per major PRD feature. Order by: dependency → risk → user value.

```markdown
# Sprint [N] — [Feature Name]
**Duration:** 1 week
**Goal:** [Feature description]

## Exit Criteria
- [ ] [Feature acceptance criteria from PRD]
- [ ] Tests written and passing
- [ ] Security reviewed (if touches auth/payments/data)
- [ ] Accessibility checked (if UI change)

## Tasks
[Specific implementation tasks]

## Agents
[Which agents own which areas]
```

**Step 5: Generate Pre-Launch Sprint**
```markdown
# Sprint Pre-Launch — Launch Preparation
**Duration:** 1 week
**Goal:** The product is ready to ship. All quality gates passed.

## Exit Criteria
- [ ] /audit completed — all P0 and P1 findings resolved
- [ ] App Store / deployment assets prepared (screenshots, descriptions, icons)
- [ ] Analytics and error tracking configured
- [ ] Privacy policy and terms of service in place
- [ ] All environment variables confirmed in production
- [ ] Rollback procedure documented and tested

## Tasks
[Track-specific launch preparation tasks]
```

**Step 6: Generate Launch Sprint**
```markdown
# Sprint Launch — Ship It
**Duration:** 1 week
**Goal:** Product is live. First users acquired. Monitoring active.

## Exit Criteria
- [ ] Submitted to App Store / deployed to production
- [ ] Health check passing in production
- [ ] Error tracking active and alerting
- [ ] First 10 real users have completed the core loop
- [ ] Feedback collection mechanism in place

## Tasks
[Submission, monitoring, initial acquisition tasks]
```

**Step 7: Generate sprint index**
Create `docs/sprints/README.md`:
```markdown
# Sprint Roadmap — [Project Name]
Total: [N] weeks to launch

| Sprint | Name | Goal | Status |
|--------|------|------|--------|
| 0 | Foundation | Running skeleton | Not started |
| 1 | Core Loop | [primary user story] | Not started |
...
```

**Step 8: Present and approve**
Show the full roadmap summary. Ask: "Shall I write all sprint files to `docs/sprints/`?"
