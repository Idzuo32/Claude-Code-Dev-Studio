# Sprint Methodology

## Philosophy
One-week sprints. One outcome per sprint. Exit criteria are the sprint.

## Sprint Types

### Sprint 0 — Foundation (always first)
Fixed structure regardless of project type:
- Repository + CI/CD + linting
- Auth end-to-end
- Database connected
- Navigation skeleton on target platform
- "Hello World" running on real device/browser

Exit Sprint 0 only when a real person can use the app without hitting a crash.

### Sprint 1 — Core Loop
Proves the concept is buildable. The single most important user flow, end-to-end, even if rough. Tests covering this flow. Does not need to be polished.

### Feature Sprints (2-N)
One complete feature per sprint. Sprint begins with spec, ends with tests passing and code reviewed.

### Pre-Launch Sprint
Security audit, accessibility audit, performance audit, App Store assets, launch runbook.

### Launch Sprint
Submission, monitoring, initial traction.

## Exit Criteria Rules
- Binary: pass or fail, no partial credit
- Testable: verifiable without interpretation
- User-facing: "user can do X" not "feature is implemented"
- Minimal: 5-7 per sprint maximum

## Scope Management
New work mid-sprint: write it down, assess if it blocks exit criteria, add to next sprint if no, negotiate explicitly if yes. Never silently expand scope.

## Documents
- `docs/sprints/sprint-N.md` — one file per sprint
- `docs/sprints/README.md` — sprint index and roadmap
- `docs/sprints/deferred.md` — items deferred from sprints (review each planning)
