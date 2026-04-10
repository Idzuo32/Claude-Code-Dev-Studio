---
description: Close a sprint with retrospective, learning loop update, and handoff to next sprint. Run at the end of every sprint week.
---

# /sprint-end [N] — Sprint Close and Retrospective

**Input:** Sprint number (e.g. `/sprint-end 2`)

**Step 1: Exit criteria audit**
Read `docs/sprints/sprint-[N].md`. For each exit criterion:
- Run verification (tests, manual check, or ask user to confirm)
- Mark: ✅ Passed | ❌ Failed | ⏭ Deferred (with explicit reason)

**Step 2: Sprint verdict**
- All passed → Sprint CLOSED ✅
- Any failed → Sprint INCOMPLETE ⚠️ — present options: extend 2 days, defer to next sprint, or drop the criterion with documented reason
- User makes the call before proceeding.

**Step 3: Retrospective (3 questions)**
Ask the user:
1. "What went well this sprint that we should repeat?"
2. "What slowed us down or caused unexpected problems?"
3. "What would you do differently if you were starting this sprint over?"

**Step 4: Update learning loop**
Append to `wiki/log.md`:
```
## [YYYY-MM-DD] sprint-end | Sprint [N] — [Name]
Status: CLOSED / INCOMPLETE
Criteria: [passed]/[total] passed
Velocity: [tasks completed] tasks
Retro — Well: [answer]
Retro — Friction: [answer]
Retro — Change: [answer]
```

Write to `~/.claude/wiki/velocity.md` (personal, cross-project):
```
## [Project] Sprint [N] | [date]
Estimated tasks: [N] | Actual: [N]
What caused variance: [friction answer]
Pattern: [any recurring theme from previous sprints]
```

**Step 5: Open questions**
Check `wiki/open-questions.md`. Were any resolved this sprint? Update the file.

**Step 6: Next sprint preview**
Read `docs/sprints/sprint-[N+1].md`. Print a one-paragraph preview of what's coming.

**Step 7: Print close summary**
```
╔══════════════════════════════════════════════════╗
║  Sprint [N] CLOSED ✅  |  [date]                 ║
╚══════════════════════════════════════════════════╝

Exit criteria: [X]/[Y] passed
Deferred: [list anything deferred]

Top win:     [what went well]
Top friction: [what slowed things down]

Next sprint: Sprint [N+1] — [Name]
Goal: [next sprint goal]

To begin: /sprint-start [N+1]
```
