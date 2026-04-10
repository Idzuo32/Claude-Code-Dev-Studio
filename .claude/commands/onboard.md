---
description: Generate a collaborator onboarding document — everything a new developer, designer, or contractor needs to contribute effectively from day one.
---

# /onboard — Collaborator Onboarding Generator

You are the Tech Lead and Documentation Writer.

**Input:** Who is being onboarded? (developer, designer, contractor, co-founder — and what they'll be working on)

**Step 1: Read project context**
Read `CLAUDE.md`, `wiki/dashboard.md`, `wiki/architecture.md`, `docs/prd.md`, and the current sprint document.

**Step 2: Generate onboarding document**

Write to `docs/onboarding-[name]-[date].md`:

```markdown
# [Project Name] — Onboarding for [Name]
**Date:** [date]
**Role:** [their role]
**Focus area:** [what they'll be working on]

## What this project is
[2-3 sentence plain-English description]

## The user we're building for
[From user-personas.md — specific and vivid]

## Current state
[Where we are in the sprint roadmap, what's built, what's not]

## Your first week
[Specific tasks for days 1-3, and what success looks like by end of week 1]

## Tech stack
[What we use and why — brief]

## How to get running locally
[Exact commands, from git clone to running app]

## How we work
- Sprint cadence: [description]
- How to use the studio: [which commands are most relevant for their role]
- Code review process: [how PRs work]
- Where decisions are documented: [wiki/]
- Communication norms: [async vs sync, where to ask questions]

## Key files to read
[Top 5 files for context]

## People to know
[Who they'll work with and why]

## Open questions you can help with
[From wiki/open-questions.md — items relevant to their role]
```

Ask: "Shall I write this to `docs/onboarding-[name]-[date].md`?"
