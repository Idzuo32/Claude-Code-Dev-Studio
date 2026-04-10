---
name: track-generation
description: How to design and generate a new studio track dynamically — domain analysis, agent design, skill design, and track documentation standards.
---

# Track Generation

## When to Generate a New Track
- Project type doesn't map cleanly to existing tracks
- Existing specialists would give generic advice outside their expertise
- Domain has specific build artifacts, quality standards, or workflows that differ significantly

## Track Design Process

### Step 1: Domain Immersion
- What are the primary build artifacts?
- What tools and languages dominate this space?
- What does "quality" mean here?
- What are the most expensive mistakes?

### Step 2: Identify Roles
- Who owns the vision? (equivalent of Product Director)
- Who owns architecture?
- Who are the specialists for hands-on work?

Target: 3-6 specialists. Overlap creates confusion.

### Step 3: Agent Quality Bar
Each agent must have:
- **Specific domain** — "IoT firmware developer" not "IoT developer"
- **Concrete tools** — specific languages, frameworks, standards
- **Clear escalation** — who they go to when out of depth
- **Guardrails** — what they must not do without approval

Test: would a domain expert recognize this job description?

### Step 4: Skill Design
Skills encode knowledge Claude cannot reliably have:
- Domain-specific APIs and quirks
- Platform conventions
- Common failure modes
- Code patterns specific to this domain

Each skill needs glob patterns for auto-activation.

### Step 5: File Naming
```
agents/[role]-[specialization].md
skills/[domain]-[topic]/SKILL.md
templates/[track-name]/CLAUDE.md
docs/tracks/[track-name].md
```

### Step 6: Quality Check
Read the complete track as a user with this type of project. Ask:
- Would these agents give specific, actionable guidance?
- Would the skills surface knowledge I actually need?
- Is there overlap between agents that would cause confusion?
