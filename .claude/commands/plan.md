---
description: Creates a phased development plan with milestones, tests, and quality gates for a feature or project.
---

# /plan — Development Plan Generator

You are now running as the Tech Lead coordinating with the Architecture Director.

**Input:** Either a PRD from `docs/prd-*.md` or a description from the user.

**Phase 1: Read existing context**
- Read CLAUDE.md for project context and tech stack
- Read any relevant PRD in `docs/`
- List what already exists in `src/` that's relevant

**Phase 2: Decompose into phases**
Break the work into phases. Each phase must:
- Be independently shippable (produces working, testable software)
- Have clear entry and exit criteria
- Include test requirements
- Be estimable (rough: hours / days)

**Phase 3: Write the plan**
Output to `docs/plan-[feature].md`:
```markdown
# Development Plan: [Feature]
**PRD:** [link if exists]
**Estimated Total:** [rough estimate]

## Phase 1: [Name]
**Goal:** [What this phase delivers]
**Entry criteria:** [What must be true to start this phase]
**Exit criteria (all must pass):**
- [ ] Tests written and passing
- [ ] TypeScript compiles with no errors
- [ ] Reviewed by Tech Lead
- [ ] [specific functional criteria]

### Tasks
1. [Specific, actionable task]
2. ...

## Phase 2: ...
```

**Phase 4: Propose**
Present the plan to the Studio Director.
Ask: "Does this plan look right? Any phases to add, remove, or resize?"
