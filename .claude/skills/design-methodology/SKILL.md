---
name: design-methodology
description: Application Design Document (ADD) authoring methodology — system discovery, dependency mapping, decision logging, and design drift detection. Activates during /design, /map-systems, and /design-index sessions.
globs: "docs/design/**"
---

# Design Methodology

## The ADD vs. Other Documents

Three documents govern a project's design. They are not interchangeable:

| Document | What it answers | When written | How it changes |
|----------|----------------|--------------|----------------|
| **ADD** | What are we building and why? | Before Sprint 0 | Rarely — only with a formal decision |
| **PRD** | What does it do specifically? | Before Sprint 0 | As features are clarified |
| **Systems Map** | In what order do we build it? | After ADD | When dependencies change |

The ADD is the north star. The PRD is the requirements. The systems map is the build order. All three must agree. When they diverge, the ADD wins.

## System Discovery — What to Ask

Each system needs four things defined before it can be built:

1. **Purpose** — one sentence. What problem does this system solve?
2. **Boundary** — what it explicitly does NOT do. Prevents scope creep.
3. **Interface** — what it receives as input and what it provides as output.
4. **Dependencies** — what must exist before this system can be built.

If any of these four are missing, the system is not ready to build. Surfacing this during design costs nothing. Surfacing it during Sprint 3 costs weeks.

## The Dependency Trap

The most expensive mistake in software development is building things in the wrong order. Signs of the dependency trap:

- "We can't finish this feature because [other system] isn't ready yet"
- "We need to refactor [foundation system] because it doesn't support [feature built later]"
- "We have to pause Sprint 4 because the auth system doesn't support what we need"

The systems map prevents this by forcing dependency analysis before any code is written. The build order is determined by dependencies, not by feature desirability.

## Decision Quality

A good design decision record answers the question a future developer will ask 6 months from now: "Why does this work this way?"

Good rationale: "Chose Supabase over Firebase because Supabase uses PostgreSQL and we need complex relational queries for the reporting system. Firebase's NoSQL model would require significant data duplication."

Bad rationale: "Supabase seemed better for our needs."

The bad rationale is useless. Six months later, no one knows what "our needs" meant or whether those needs changed.

## Design Drift — When to Accept It

Design drift (implementation diverging from ADD) is inevitable on long projects. The question is not whether it happens but whether it's documented.

**Acceptable drift:** The implementation found a better solution than the ADD specified. Document it as a decision, update the ADD.

**Unacceptable drift:** The implementation took a shortcut that creates technical debt. Surface it, evaluate the cost, decide consciously whether to carry the debt.

**Dangerous drift:** The implementation diverged from the ADD in a way that contradicts a decision that was made deliberately. This means the original decision needs to be revisited — not ignored.

## The North Star Paragraph

The ADD's most important section is the one-paragraph North Star — the core user journey in plain English. Every design decision, every feature, every sprint is measured against it.

If a proposed feature doesn't serve the North Star, it belongs in a future version or not at all.

Write the North Star paragraph as if explaining the product to a smart person who has never heard of it. No jargon. No technical detail. One paragraph. If you can't explain it in one paragraph, the concept isn't clear enough to build.

## Minimum Viable ADD

For small projects or fast-moving sprints, the full ADD may be too heavyweight. The minimum viable ADD contains:

1. North Star paragraph (required — no exceptions)
2. Systems list with dependencies (required)
3. 3-5 key decisions (required — the non-obvious ones)
4. Out of scope list (required — scope control)
5. Open questions (required — honest about unknowns)

Everything else (full interface definitions, detailed entity maps) can be added progressively as the system is built.
