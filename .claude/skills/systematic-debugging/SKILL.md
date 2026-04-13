---
name: systematic-debugging
description: 4-phase root cause debugging process. Activates automatically when facing bugs, errors, unexpected behavior, or failed tests. Prevents random fix-attempting and ensures the real cause is found before any code is changed.
globs: "**/*.py,**/*.ts,**/*.tsx,**/*.js,**/*.cs,**/*.cpp,**/*.gd"
---

# Systematic Debugging

Stop. Before touching any code, run this process. The fastest way to fix a bug is to understand it completely first.

## The Core Rule

**Never change code to fix a bug until you can predict exactly what the change will do.**

If you cannot articulate "this change fixes the bug because [specific reason]" — you are guessing. Guessing wastes time and introduces new bugs.

---

## Phase 1 — Isolate (Understand the failure precisely)

Before hypothesizing, establish the facts:

**1. Reproduce it reliably**
Can you make the bug happen on demand? If not, you don't understand it yet.
- What exact steps trigger it?
- Does it happen every time or intermittently?
- What environment/state is required?

**2. Define the boundary**
- What is the exact wrong behavior? (not "it's broken" — what specifically happens)
- What is the exact expected behavior?
- What is the smallest input that triggers it?

**3. Find the last known good state**
- When did this last work correctly?
- What changed between then and now? (`git log --oneline -20`, `git diff`)
- If you can't identify a last good state, the bug may be a misunderstanding of requirements.

**Do not proceed to Phase 2 until you can reproduce the bug on demand.**

---

## Phase 2 — Hypothesize (Generate ranked explanations)

Generate at minimum 3 hypotheses. Rank them by probability.

For each hypothesis, answer:
- What specific mechanism would cause this behavior?
- What evidence supports this hypothesis?
- What evidence contradicts it?
- What is the fastest test to confirm or eliminate it?

**Common root cause categories (check these first):**
- **State corruption** — something modified shared state unexpectedly
- **Timing/race condition** — order of operations matters and is wrong
- **Off-by-one** — boundary condition handling
- **Null/undefined/None** — unexpected empty value propagated
- **Wrong assumption** — code does what it was written to do, but the requirement was misunderstood
- **Environmental difference** — works locally, fails in production (config, dependencies, platform)
- **Regression** — a recent change broke something previously working

**Do not try any fixes yet. Commit to the ranked hypothesis list first.**

---

## Phase 3 — Test (Confirm the root cause)

Test your top hypothesis with the minimum intervention that would confirm or eliminate it.

**Testing approaches (in order of preference):**
1. **Add logging/print statements** at the exact point where the hypothesis predicts failure
2. **Write a failing test** that encodes your understanding of what should happen
3. **Binary search with git bisect** if the bug appeared after a series of commits
4. **Comment out code** to isolate which section contains the problem
5. **Add assertions** to verify assumed invariants are actually invariant

**The test should be able to:**
- Confirm the hypothesis: you see the predicted wrong value/state
- Eliminate the hypothesis: behavior doesn't match the prediction

If the test eliminates your top hypothesis, move to hypothesis #2. Do not invent new hypotheses on the fly — return to Phase 2.

**Do not write the fix until the test confirms the root cause.**

---

## Phase 4 — Fix and Verify

Now, and only now, write the fix.

**The fix should be:**
- Minimal — changes only what the root cause analysis identified
- Targeted — does not "also fix" unrelated things
- Explainable — you can state exactly why this change addresses the root cause

**Verification checklist:**
- [ ] The specific bug no longer reproduces
- [ ] The test written in Phase 3 now passes
- [ ] No existing tests broke
- [ ] The fix does not introduce obvious new failure modes
- [ ] If logging was added in Phase 3, remove it before committing

**Write a commit message that names the root cause:**
```
fix: [what was wrong] — [root cause in one sentence]

Example:
fix: session token expires silently — missing error handler on 401 response
```

Not:
```
fix: bug fix
fix: fixed the issue
```

---

## Anti-Patterns That Waste Time

**The spray-and-pray** — changing multiple things at once hoping one of them fixes it. Now you don't know what fixed it, or if you introduced a new bug.

**The optimistic revert** — reverting to a previous version without understanding what caused the regression. The bug will return.

**The framework blame** — assuming the bug is in a dependency before exhausting explanations in your own code. Your code is almost always the cause.

**The "it works on my machine"** — accepting an environmental explanation without making it work consistently on both machines. Environmental bugs have deterministic causes.

**The untested fix** — declaring the bug fixed before verifying the original reproduction case no longer reproduces.

---

## When to Escalate

If after two full cycles through Phases 1-3 you have not confirmed a root cause:

1. Write down everything you know — what you've eliminated, what you've confirmed
2. Use `/second-opinion` rescue prompt to get a fresh perspective
3. Check if the bug is actually a design problem, not an implementation problem — sometimes the right fix is a different approach entirely
