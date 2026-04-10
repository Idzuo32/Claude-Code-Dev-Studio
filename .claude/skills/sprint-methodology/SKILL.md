---
name: sprint-methodology
description: Sprint planning, execution, and retrospective methodology. Covers exit criteria design, velocity tracking, scope management, and sprint health signals.
---

# Sprint Methodology

## Sprint Philosophy
A sprint is a commitment to one specific outcome, not a container for tasks. The exit criteria are the sprint — everything else is implementation detail.

## Sprint 0 is Sacred
Never skip it. Never combine with Sprint 1. Exit Sprint 0 only when:
- A real person can use the app without hitting a crash on the primary flow
- CI/CD is running and passing
- Auth works end-to-end

## Exit Criteria Design
Good exit criteria are binary, testable, and user-facing:
- ✅ "The user can complete sign-up and reach the home screen"
- ❌ "The feature is mostly working"
- ❌ "The code is clean"

Keep to 5-7 criteria per sprint. More means the sprint is too large.

## Scope Management
When new work appears mid-sprint:
1. Write it down — never lose it
2. Does it block exit criteria? If no: add to next sprint. If yes: negotiate scope change explicitly.
3. Scope changes require acknowledgment — never silently expand.

## Velocity Health Signals
**Healthy:** Exit criteria met by Thursday; no more than 1 deferred per sprint.
**Unhealthy:** Consistently completing 60% of criteria; same criterion deferred multiple times.

If unhealthy: sprints are too large, not developer too slow. Reduce scope.

## Sprint 1 — Core Loop Priority
Sprint 1 answers one question: "Can a real user complete the primary action from start to finish?"
If yes: concept works. If no: better to know now than after Sprint 4.

## Deferred Items Log
Track deferred items in `docs/sprints/deferred.md`. Review at every sprint planning. Items deferred twice need a decision: build, drop, or redesign.
