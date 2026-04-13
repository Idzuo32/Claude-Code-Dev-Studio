---
name: two-stage-review
description: Two-stage code review process — spec compliance first, then code quality second. Activates during /review and between sprint tasks. Prevents the most common review failure: approving code that works but doesn't do what was specified.
globs: "**/*.py,**/*.ts,**/*.tsx,**/*.js,**/*.cs,**/*.cpp,**/*.gd"
---

# Two-Stage Code Review

Most code reviews fail because they check everything at once — correctness, style, performance, naming, architecture — and end up checking nothing deeply. Two-stage review fixes this by separating what the code does from how it does it.

**Stage 1 always comes before Stage 2. Never reverse this order.**

---

## Stage 1 — Spec Compliance (Does it do what was specified?)

Read the spec, brief, or task description before reading the code.

For each requirement, find the code that implements it and verify:

**Checklist:**
- [ ] Every requirement in the spec has corresponding code
- [ ] Every piece of code has a corresponding requirement (no scope creep)
- [ ] Edge cases mentioned in the spec are handled
- [ ] Error cases mentioned in the spec are handled
- [ ] The behavior matches the spec under the normal path
- [ ] The behavior matches the spec under failure paths
- [ ] If the spec mentions specific values, formats, or constraints — they are enforced

**Stage 1 findings are classified as:**
- **BLOCKING** — the code does not implement a required behavior. Must be fixed before Stage 2.
- **QUESTION** — the spec is ambiguous and the implementation made an assumption. Flag for clarification, do not block.

**If there are BLOCKING findings, stop here. Do not proceed to Stage 2.**

Return the findings in this format:
```
STAGE 1 — SPEC COMPLIANCE

BLOCKING:
- [Requirement X] is not implemented. The spec states [exact quote]. 
  The code does [what it actually does].

QUESTION:
- The spec does not specify behavior when [condition]. 
  The current implementation [what it does]. Intended?

RESULT: BLOCKING — address findings before Stage 2.
OR
RESULT: PASS — proceeding to Stage 2.
```

---

## Stage 2 — Code Quality (Is it implemented well?)

Only run this after Stage 1 passes. Now read the code on its own terms.

**Correctness within the implementation:**
- [ ] Logic is correct — no off-by-one errors, incorrect conditions, wrong operators
- [ ] All code paths are reachable and correct
- [ ] Error handling is present for operations that can fail
- [ ] No silent failures (errors swallowed without logging or re-raising)
- [ ] Async/concurrent code handles race conditions

**Clarity:**
- [ ] Function and variable names describe what they are, not how they're used
- [ ] Complex logic has a comment explaining the why, not the what
- [ ] No commented-out code
- [ ] No TODO comments left in shipping code

**Safety:**
- [ ] No hardcoded secrets, credentials, or environment-specific values
- [ ] User input is validated before use
- [ ] File paths are validated against expected boundaries
- [ ] No SQL injection, XSS, or equivalent vulnerabilities for the stack

**Maintainability:**
- [ ] No duplicate logic that should be extracted
- [ ] Functions do one thing
- [ ] No function longer than ~40 lines without strong justification
- [ ] Dependencies are imported at the top, not buried in functions

**Tests:**
- [ ] New behavior has corresponding tests
- [ ] Tests cover the happy path and at least one failure path
- [ ] Tests are not testing implementation details (they test behavior)
- [ ] No test that always passes regardless of the code

**Stage 2 findings are classified as:**
- **CRITICAL** — will cause bugs, data loss, security issues, or production failures. Must fix.
- **IMPORTANT** — will cause maintainability problems or subtle bugs. Should fix before merge.
- **SUGGESTION** — style, naming, or structural improvements. Fix if easy, note if not.

Return findings in this format:
```
STAGE 2 — CODE QUALITY

CRITICAL:
- [File:line] [What the problem is and why it matters]

IMPORTANT:
- [File:line] [What the problem is]

SUGGESTION:
- [File:line] [What could be improved]

RESULT: [CRITICAL ISSUES — must fix] / [IMPORTANT ISSUES — should fix] / [PASS — ready to merge]
```

---

## Complete Review Output Template

```
## Code Review — [Feature/PR Name]
Reviewer: [agent name]
Date: [date]

### Stage 1: Spec Compliance
[Stage 1 findings]

### Stage 2: Code Quality  
[Stage 2 findings — only if Stage 1 passed]

### Summary
Stage 1: PASS / BLOCKING
Stage 2: PASS / CRITICAL / IMPORTANT
Overall: APPROVED / APPROVED WITH SUGGESTIONS / CHANGES REQUIRED

### Required changes before merge:
[Numbered list of blocking/critical items only]
```

---

## When This Skill Activates

- When `/review` is run on any code
- When a sprint task is marked complete before the next task begins
- When a PR is ready for review
- When the user asks "is this ready to merge?"

The two-stage process adds 10-15 minutes to a review. It prevents 2-4 hours of debugging merged bugs.
