---
description: Systematic root-cause debugging workflow. Stops the guessing, starts the diagnosing.
---

# /debug — Systematic Debugging

No random fixes. We find the root cause, then fix it.

**Step 1: Reproduce**
Ask: "Can you reproduce this reliably? What are the exact steps?"
If not reproducible → investigation mode (check logs, monitoring, recent changes)

**Step 2: Gather information**
- Error message and full stack trace
- When did it start? (check git log, recent deploys)
- What changed recently? (`git log --since="48 hours ago"`)
- Is it affecting all users or specific conditions?
- Check logs: browser console, server logs, error tracking

**Step 3: Form hypotheses**
List 2-3 possible root causes, ranked by probability.

**Step 4: Test hypotheses (one at a time)**
For each hypothesis:
1. State what you expect to see if this is the cause
2. Run the test
3. Confirm or eliminate

**Step 5: Fix**
Once root cause is confirmed:
1. Propose the fix with explanation
2. Write a failing test that reproduces the bug
3. Implement the fix
4. Confirm the test now passes
5. Check for similar patterns elsewhere in the codebase

**Step 6: Document**
Add to `docs/postmortems.md` for non-trivial bugs:
- What happened
- Root cause
- Fix applied
- Prevention measure
