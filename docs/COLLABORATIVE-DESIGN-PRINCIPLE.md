# Collaborative Design Principle

The studio operates on one core principle: **you make every decision; the studio makes every decision better**.

---

## The Problem This Solves

Without structure, AI coding sessions have a failure mode: the assistant goes wide, writes a lot of code fast, makes implicit decisions you didn't ask for, and leaves you with a codebase that half-works in ways you don't fully understand.

This studio's architecture counters that by enforcing:
1. **Explicit decision points** — agents stop and ask before consequential choices
2. **Visible drafts** — you see what will be built before it is built
3. **Separation of concerns** — specialists do one thing well; escalation paths handle the rest
4. **Quality gates** — nothing ships without tests, security check, and your approval

---

## The Interaction Protocol

Every significant action follows this sequence:

```
Question → Options → Decision → Draft → Approval → Execute
```

### Question
The agent identifies a decision point and surfaces it.
> "Before I design the schema, I need to understand: will multiple users share an organization, or is each account an individual user?"

### Options
The agent presents 2-3 concrete approaches with trade-offs.
> "Option A: Single-tenant (one DB per org) — best isolation, higher cost.
> Option B: Shared schema with org_id — most common for SaaS, lower cost.
> Option C: Schema-per-tenant — middle ground, more complex migrations."

### Decision
You choose. The agent does not proceed without your answer.

### Draft
The agent shows what it will create before touching the filesystem.
> "Here's the schema I'll create. May I write this to `db/migrations/001_initial.sql`?"

### Approval
You say yes. Now the agent executes.

### Execute
The agent does exactly what was approved — no additional scope creep.

---

## What Agents Ask About

Agents must ask before:
- Creating a file that doesn't exist yet
- Modifying a file outside the scope of the current task
- Adding a new dependency
- Making a choice that constrains future architecture
- Running commands that modify state (migrations, deploys, installs)

Agents don't need to ask before:
- Reading files to understand context
- Running read-only commands (`ls`, `cat`, `grep`, `git status`, `git log`)
- Performing formatting that was already approved

---

## Escalation Paths

```
Specialist
    ↓ (domain boundary or ambiguity)
Department Lead
    ↓ (cross-department or architectural)
Architecture Director
    ↓ (product scope or strategic)
Studio Director (you)
```

An agent that doesn't know the answer escalates up — it does not guess.

---

## Anti-Patterns to Watch For

**Scope creep:** Agent does more than asked.
→ If it happens: stop the agent, review what was added, decide what to keep.

**Stack assumption:** Agent picks a framework you didn't choose.
→ Always fill in the "Project Context" block in CLAUDE.md before starting.

**Silent failure:** Agent catches an error and quietly works around it.
→ All errors should be surfaced, not swallowed.

**Autonomous deployment:** Agent deploys to production without you.
→ The `/deploy` command has a mandatory approval step. Never skip it.
