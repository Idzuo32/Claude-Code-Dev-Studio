---
description: Begin a sprint with a full checklist, agent briefing, and wiki update. Run at the start of every sprint week.
---

# /sprint-start [N] — Sprint Kickoff

**Input:** Sprint number (e.g. `/sprint-start 2`)

**Step 1: Read sprint document**
Read `docs/sprints/sprint-[N].md`. If it doesn't exist, run `/sprint-plan` first.

**Step 2: Read project context**
Read `wiki/dashboard.md` and `wiki/open-questions.md`. Understand where the project stands.

**Step 3: Pre-sprint checklist**
Verify before declaring the sprint open:
- [ ] Previous sprint exit criteria all passed (or explicitly deferred with reason)
- [ ] This sprint's tasks are clear and unambiguous
- [ ] Dependencies from previous sprint are available
- [ ] No open P0 or P1 bugs from last sprint

If any item fails: do not open the sprint. Surface the blocker.

**Step 4: Agent briefing**
For each agent involved in this sprint, print a one-paragraph briefing:
- What they're building this sprint
- What they should NOT touch (scope boundary)
- Which other agents they'll need to coordinate with
- Known risks or dependencies to watch for

**Step 5: Update wiki**
Append to `wiki/log.md`:
```
## [YYYY-MM-DD] sprint-start | Sprint [N] — [Name]
Goal: [sprint goal]
Exit criteria: [count]
Agents: [list]
```

Update `wiki/dashboard.md` Current Sprint field.

**Step 6: Print sprint card**
```
╔══════════════════════════════════════════════════╗
║  Sprint [N] — [Name]  |  Week of [date]          ║
╚══════════════════════════════════════════════════╝

Goal: [sprint goal]

Exit Criteria ([N] total):
  [ ] [criterion 1]
  [ ] [criterion 2]
  ...

Today's first task: [most important task to start]
Key agent: [primary agent for today's work]

To close this sprint: /sprint-end [N]
```
