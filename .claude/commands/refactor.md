---
description: Safe refactor workflow with pre/post analysis to improve code without changing behavior.
---

# /refactor — Safe Refactor Workflow

Refactoring changes structure, not behavior. If behavior changes, that's a bug or a feature — not a refactor.

**Input:** A file, function, module, or description of what needs improving.

**Step 1: Understand before changing**
Read the code. Understand what it does, what it's called by, and what it depends on. Do not start changing until you can describe the current behavior in plain language.

**Step 2: Characterize existing behavior**
If tests don't exist, write them first — before touching the code. These tests lock in the current behavior and will catch regressions.

```
Goal: tests pass before refactor → tests still pass after refactor
```

**Step 3: Identify the problem**
Name what's wrong:
- Too long / too complex (cyclomatic complexity)
- Duplicated logic
- Poor naming
- Mixed responsibilities
- Difficult to test
- Performance problem

**Step 4: Propose the change**
Present the proposed refactor to the Studio Director before executing. Include:
- What's changing
- Why it's better
- What's NOT changing (behavior)
- Estimated risk (low / medium / high)

**Step 5: Refactor in small steps**
- One transformation at a time
- Run tests after each step
- Commit each passing step (easier to roll back)

**Step 6: Post-refactor check**
- All tests pass
- No new TypeScript/linting errors
- Code is demonstrably simpler/cleaner
- No performance regression

**Common refactor patterns:**
- Extract function (long function → named sub-functions)
- Extract module (one file doing too much → split by responsibility)
- Replace magic number with named constant
- Replace conditional with polymorphism
- Introduce parameter object (4+ params → options object)
