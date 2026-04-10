---
description: Regenerate the project health dashboard. Run at the start of each session to get current project state.
---

# /dashboard — Project Health Dashboard

Regenerate `wiki/dashboard.md` with the current state of the project.

**Read these files first:**
- `CLAUDE.md` — project config
- `wiki/log.md` — last 5 entries
- `wiki/open-questions.md` — unresolved items
- `docs/sprints/` — current and next sprint
- Run `git log --oneline -5` and `git status`
- Run the project's test command if available

**Generate `wiki/dashboard.md`:**

```markdown
# [Project Name] — Dashboard
**Updated:** [timestamp]
**Phase:** [current phase]
**Current Sprint:** Sprint [N] — [Name]

## Sprint Status
Goal: [sprint goal]
Exit Criteria: [X]/[Y] passing
Days remaining: [estimated]

## Open Questions ([N])
[List from open-questions.md — most urgent first]

## Recent Activity (last 5 sessions)
[From log.md]

## Build Health
| Check | Status |
|-------|--------|
| Tests | [passing/failing/unknown] |
| Build | [passing/failing/unknown] |
| Lint | [clean/warnings/errors/unknown] |
| Last commit | [hash and message] |

## Known Risks
[Any items from wiki/open-questions.md tagged as risk]

## Next Session Priorities
1. [Most important thing to do next]
2. [Second priority]
3. [Third priority]
```

After writing, print: "Dashboard updated. [N] open questions. Sprint [N] at [X]/[Y] exit criteria."
