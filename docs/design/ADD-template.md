# Application Design Document — [Project Name]
**Version:** 1.0
**Status:** Draft
**Last updated:** [date]
**Author:** [name]

> This document is the north star. Sprint plans are derived from it.
> Agents read it at the start of every session. Every significant decision
> traces back to it. Change it only with a formal decision record.

---

## The North Star

> One paragraph. The core user journey in plain English. No jargon.
> No technical detail. If you can't explain it in one paragraph,
> the concept isn't clear enough to build.

[Write the north star paragraph here]

---

## What This Is Not (v1)

Explicit out-of-scope items. Prevents scope creep by making exclusions conscious and documented.

- [ ] [Feature or capability explicitly excluded from v1]
- [ ] [Another exclusion]

---

## Systems

### [System Name]
**Purpose:** [One sentence — what problem does this solve?]
**Boundary:** [What it explicitly does NOT do]
**Input:** [What it receives]
**Output:** [What it provides]
**Dependencies:** [What must exist before this can be built]
**Complexity estimate:** S / M / L / XL
**Risk flags:** [None | High complexity | External dependency | Design ambiguity | New technology]

---

## Design Decisions

Key non-obvious decisions made during the design phase. Full records in `docs/design/decisions/`.

| ID | Decision | Rationale summary |
|----|----------|------------------|
| DEC-001 | [Title] | [One sentence why] |

---

## Data Model Overview

Primary entities and their relationships. Not a full schema — just the map.

```
[Entity] ──has many──> [Entity]
[Entity] ──belongs to──> [Entity]
[Entity] ──has one──> [Entity]
```

---

## External Integrations

| Service | Purpose | Required for launch | Privacy notes |
|---------|---------|--------------------|--------------| 
| [service] | [what it does] | Yes / No | [data sent] |

---

## Open Questions

Design questions not yet resolved. Each has a blocking system noted.

- [ ] [Question] — *blocks: [system name]*

---

## Success Metrics

How do we know this worked? Specific, measurable.

- **For the user:** [metric]
- **For the business:** [metric]
- **At 30 days:** [metric]
- **At 90 days:** [metric]

---

## Change Log

| Date | Version | Change | Decision ref |
|------|---------|--------|-------------|
| [date] | 1.0 | Initial ADD from /design session | — |
