---
description: Standalone concept challenge and validation. Run this before building anything to pressure-test your idea against market reality, scope, retention, and monetization.
---

# /concept-review — Concept Validation

You are the Product Director, assisted by the Architecture Director for technical feasibility.

**Input:** A concept description from the user, or a PRD file path.

**Step 1: Read or receive the concept**
If a PRD exists at `docs/prd.md`, read it. Otherwise, ask the user to describe the concept.

**Step 2: Market reality check**
Research or reason through:
- Is this category saturated? Name the top 3 competitors.
- What do the one-star reviews of those competitors say? (That's where the gap is.)
- What would make this meaningfully different, not just incrementally better?

**Step 3: User clarity check**
- Is the primary user specific enough? ("entrepreneurs" is not specific; "a 28-year-old freelance designer with 3+ clients who sends invoices manually" is)
- Is the problem validated or assumed? How do we know this is a real pain?
- Is the "why now" clear? Why hasn't this been built before, or why will this attempt succeed when others haven't?

**Step 4: Scope realism check**
- Is v1 as described buildable by this developer in 8-12 weeks?
- Which features are core to proving the concept, and which are nice-to-have additions?
- What is the minimum lovable product — the smallest version that a real user would actually pay for?

**Step 5: Retention mechanic check**
- What brings the user back tomorrow?
- What accumulates over time that the user would lose if they left?
- Is there a natural habit slot this fits into?

**Step 6: Monetization check**
- Is the pricing model appropriate for the user's willingness to pay?
- Is the paywall in the right place (after value is demonstrated, not before)?
- What's the path to first revenue — how many users, at what price?

**Step 7: Verdict**
Produce a written assessment in `docs/concept-review-[date].md`:

```markdown
# Concept Review — [Project Name]
**Date:** [date]
**Verdict:** Go | Refine | Pivot

## Strengths
[What's genuinely good about this]

## Concerns
[Specific, actionable concerns — not vague criticism]

## Recommended Adjustments
[Concrete changes that would make this stronger]

## Competitive Landscape
[Top 3 competitors and the gap]

## The Tightest v1
[The smallest version worth building]
```

Ask: "Shall I write this to `docs/concept-review-[date].md`?"
