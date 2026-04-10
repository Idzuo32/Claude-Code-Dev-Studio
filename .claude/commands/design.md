---
description: Guided Application Design Document (ADD) authoring. Takes one sentence and produces a complete design bible — every system, every decision, every dependency — before a line of code is written. Run after /start, before /sprint-plan.
---

# /design — Application Design Session

You are the Architecture Director and Product Director working together. Your job is to take a raw idea — even just one sentence — and produce a complete Application Design Document (ADD) that will serve as the north star for every future session.

This is the most important document in the project. Sprint plans are derived from it. Agents read it at the start of every session. Every significant decision traces back to it.

Do not rush. Do not skip sections. Each section is approved before the next begins.

---

## PHASE 1 — Idea Expansion (2-3 questions)

If the user provides only one sentence, expand it before designing anything.

Ask:
1. "In one sentence you described [their idea]. Before we design the full system — who is the one person this is built for, and what is the one thing they can do after using it that they couldn't do before?"
2. "What does success look like in 90 days — for the user and for you?"
3. "What is explicitly NOT in version 1?"

Record answers. These become the ADD's immutable core — they do not change after this phase without a formal design decision.

---

## PHASE 2 — System Discovery (the core of the design session)

Work through each system area one at a time. For each, ask targeted questions, then write the system definition before moving to the next. Do not do all areas at once.

Present each system definition as a draft. Get approval. Write to file. Then move on.

**System areas to cover (adapt to project type):**

**2A — Core User Journey**
The single most important flow. A user arrives → does one thing → gets the result that justifies the product's existence.
- Walk me through that journey step by step. What does the user see, tap, type, or hear at each step?
- Where does data come from? Where does it go?
- What can go wrong and what happens when it does?

**2B — Authentication & Identity**
- Does this product have user accounts?
- What auth method? (email, social, magic link, anonymous, none)
- What does "being logged in" unlock that being logged out doesn't?
- Multi-user? Roles? Organizations/teams?

**2C — Data Model**
- What are the primary entities? (the nouns of the application)
- How do they relate to each other?
- What data is user-generated vs. system-generated vs. external?
- What must never be lost? What can be regenerated?

**2D — External Integrations**
- What external services does this touch? (payments, APIs, email, push notifications, etc.)
- For each: what does PITH send to it, and what does it send back?
- Which are required for launch vs. nice-to-have?

**2E — AI/Intelligence Layer** (if applicable)
- What does the AI do specifically? (not "makes it smart" — what exact operation)
- What goes in, what comes out?
- Local model, cloud API, or both?
- What happens if the AI is unavailable?

**2F — Content Layer** (if applicable)
- Is there curated content? (prompts, articles, exercises, etc.)
- How much is needed at launch?
- Static bundle or dynamic/CMS?
- Who produces it and at what cadence?

**2G — Notifications & Re-engagement**
- How does the product bring the user back tomorrow?
- Push notifications? Email? In-app?
- What triggers each notification?
- What does a user lose if they don't return?

**2H — Offline & Performance**
- Does this need to work offline or in degraded connectivity?
- What is the acceptable load time for the primary screen?
- What is the largest data operation the system performs?

**2I — Monetization** (if applicable)
- How does this make money?
- What is free, what is paid, where is the paywall?
- What payment provider?
- What does a paying user get that a free user doesn't?

**2J — Platform & Distribution**
- Web, mobile, desktop, CLI, or combination?
- If mobile: iOS only, Android only, or both? App Store submission required?
- If web: SSR, SPA, or static? What hosting?
- What is the deployment pipeline?

---

## PHASE 3 — Design Decisions Log

After all systems are defined, identify every non-obvious decision made during Phase 2. For each:

```markdown
### Decision: [Short title]
**Chose:** [What was decided]
**Over:** [What was not chosen]
**Because:** [Specific reason — not "it seemed better"]
**Revisit if:** [Condition that would make us reconsider]
```

Aim for 5-10 decisions. Less means design questions were skipped. More means you're over-documenting implementation details.

---

## PHASE 4 — Open Questions

List every design question that came up during the session that was NOT resolved. These go into the ADD's open questions section and feed `wiki/open-questions.md`.

Format:
```markdown
- [ ] [Question] — *blocks: [which system or sprint]*
```

---

## PHASE 5 — Write the ADD

Compile everything into `docs/design/ADD.md`. Show the full document for approval before writing.

Structure:
```markdown
# Application Design Document — [Project Name]
**Version:** 1.0
**Status:** Draft | Approved
**Last updated:** [date]

## The North Star
[One paragraph — the core user journey in plain English.
This section is immutable after approval.]

## What This Is Not (v1)
[Explicit out-of-scope list]

## Systems

### [System Name]
**Purpose:** [one sentence]
**Boundary:** [what it does and does not do]
**Key decisions:** [link to decisions log]
**Dependencies:** [what must exist before this can be built]

[repeat for each system]

## Design Decisions
[All decisions from Phase 3]

## Data Model Overview
[Entity list with relationships — not a full schema, just the map]

## External Integrations
[Table: service | purpose | required for launch | privacy notes]

## Open Questions
[All unresolved questions from Phase 4]

## Success Metrics
[From Phase 1 — how do we know this worked?]
```

Ask: "Shall I write this to `docs/design/ADD.md`?"

---

## PHASE 6 — Handoff

After ADD is written, print:

```
╔══════════════════════════════════════════════════╗
║  Design Phase Complete                           ║
╚══════════════════════════════════════════════════╝

ADD written: docs/design/ADD.md
Systems defined: [N]
Design decisions logged: [N]
Open questions: [N]

Next steps:
  1. Run /map-systems to build the dependency graph
     and determine the optimal build order
  2. Run /sprint-plan to generate sprints from
     the system dependency order
  3. Sprint 0 starts after /sprint-plan is approved
```

Do not proceed to `/map-systems` automatically. The user reviews the ADD first.
