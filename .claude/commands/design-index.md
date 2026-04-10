---
description: Updates the living design index after any session where a design decision was made. The canonical record of every significant decision in the application and why it was made. Run after /design, and after any session that changes the system architecture.
---

# /design-index — Living Design Index

You are the Architecture Director acting as the project's design historian. Your job is to ensure that every significant design decision made in this project is captured, indexed, and findable — so that future sessions never have to re-derive a decision that was already made.

The design index is not a summary of the ADD. It is a living, append-only log of decisions that grows with the project. By launch, it is a complete record of why the application is the way it is.

---

## When to Run This Command

- After `/design` — initial population from the ADD
- After any session where a significant technical or product decision was made
- After any sprint where the architecture changed from what the ADD specified
- After any decision to descope, add, or change a system

---

## STEP 1 — Read Current State

Read in order:
1. `docs/design/index.md` — current index (create if missing)
2. `docs/design/ADD.md` — the original design
3. `wiki/log.md` — last 3 session entries
4. `wiki/decisions/` — any individual decision records

Identify: what decisions were made since the last index update that are not yet captured?

If starting fresh (no index exists): populate from the ADD's design decisions section entirely.

---

## STEP 2 — Classify New Decisions

For each new decision identified, classify it:

**System decision** — affects the architecture of a specific system
Example: "Switched from REST to GraphQL for the data layer"

**Product decision** — affects what the product does or doesn't do
Example: "Removed social features from v1 scope"

**Technology decision** — affects the tech stack
Example: "Chose Supabase over Firebase for auth and database"

**Process decision** — affects how the product is built
Example: "Adopted feature flags for all new features from Sprint 3 forward"

**Reversal** — changes a previous decision
Example: "Reversed the offline-first decision — too complex for v1"
Reversals must reference the original decision they supersede.

---

## STEP 3 — Write Decision Records

For each new decision, create or update a file in `docs/design/decisions/`:

```markdown
# [Short decision title]
**ID:** DEC-[NNN]
**Date:** [date]
**Type:** system | product | technology | process | reversal
**Status:** active | superseded
**Sprint:** [sprint number when decided, or "design phase"]

## Decision
[What was decided — one clear sentence]

## Context
[What problem were we solving? What was the situation?]

## Options Considered
**Option A — [chosen]:** [description]
**Option B:** [description]
**Option C (if applicable):** [description]

## Rationale
[Why this option specifically. Not "it seemed better" — the actual reason.]

## Trade-offs Accepted
[What we gave up by choosing this]

## Consequences
[What this decision makes easier. What it makes harder.]

## Revisit If
[Specific condition that would make us reconsider]

## Related Decisions
[Links to DEC-NNN that this decision affects or is affected by]
```

---

## STEP 4 — Update the Index

Write or update `docs/design/index.md`:

```markdown
# Design Decision Index — [Project Name]
**Last updated:** [date]
**Total decisions:** [N]
**Active:** [N] | **Superseded:** [N]

## Quick Reference

### By System
| System | Decisions | Last Updated |
|--------|-----------|-------------|
| [system name] | [DEC-001, DEC-003] | [date] |

### By Type
| Type | Count | Most Recent |
|------|-------|------------|
| System | N | DEC-NNN |
| Product | N | DEC-NNN |
| Technology | N | DEC-NNN |
| Process | N | DEC-NNN |
| Reversals | N | DEC-NNN |

### By Sprint
| Sprint | Decisions Made |
|--------|---------------|
| Design phase | [list] |
| Sprint 0 | [list] |
| Sprint 1 | [list] |

## All Decisions (newest first)

| ID | Title | Type | Status | Sprint |
|----|-------|------|--------|--------|
| DEC-NNN | [title] | [type] | active | [sprint] |

## Superseded Decisions
| ID | Title | Superseded by | Date |
|----|-------|--------------|------|

## Open Design Questions
[Pulled from wiki/open-questions.md — questions that may become decisions]
```

---

## STEP 5 — Check for Design Drift

Compare the current implementation (from recent session logs) against the ADD. Flag any drift:

**Drift** = implementation diverged from what the ADD specifies, without a recorded decision explaining why.

Drift is not always bad — sometimes the implementation found a better way. But undocumented drift means the ADD is misleading future sessions.

For each drift found:
- If intentional: create a decision record explaining the change, update the ADD
- If unintentional: surface it as an open question — was this drift acceptable?

---

## STEP 6 — Session Summary

Print:

```
╔══════════════════════════════════════════════════╗
║  Design Index Updated                            ║
╚══════════════════════════════════════════════════╝

New decisions recorded: [N]
Total decisions: [N]
Superseded decisions: [N]
Design drift detected: [N items / none]
Open questions added: [N]

Index: docs/design/index.md
Decisions: docs/design/decisions/
```

---

## Using the Design Index in Future Sessions

At the start of any session involving architectural work, agents should run:

```
Read docs/design/index.md
Read docs/design/ADD.md
```

This gives full design context in under 2 minutes. No re-deriving decisions. No contradicting past choices without knowing it.

The design index is the project's institutional memory for the "why" — the wiki is for the "what" and "how."
