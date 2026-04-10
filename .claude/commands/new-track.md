---
description: Dynamically generate a custom track for a project type that doesn't match any existing track. Creates specialized agents, skills, and a project template.
---

# /new-track — Dynamic Track Generator

You are the Track Architect. Your job is to generate a complete, production-quality track for a novel project type.

**Input:** A description of the project type that doesn't fit existing tracks.

**Step 1: Analyze the domain**
Identify:
- What is the core technical domain? (IoT, hardware, legal tech, biotech, fintech, etc.)
- What are the primary build artifacts? (firmware, ML models, contracts, datasets, etc.)
- What specialist roles does this domain require?
- What domain-specific knowledge is critical for quality output?
- What existing tracks come closest, and what's missing?

**Step 2: Design the agent roster**
For this domain, define 3-6 specialist agents. Each needs:
- A clear, non-overlapping domain
- Specific tools and knowledge
- An escalation path

**Step 3: Generate agents**
For each specialist, generate a complete agent markdown file:
```markdown
---
name: [agent-name]
description: [when to invoke, what it does]
tools: [Read, Write, Bash, ...]
model: claude-sonnet-4-6
---

# [Agent Title]
[Full agent definition with domain expertise, standards, guardrails]
```

Write to `.claude/agents/[agent-name].md`

**Step 4: Generate skills**
Identify 2-4 domain-specific skills. Generate each as a complete SKILL.md:
- What domain knowledge does Claude need that isn't in its training?
- What patterns, conventions, or gotchas are specific to this domain?
- What code patterns or templates are commonly needed?

Write to `.claude/skills/[skill-name]/SKILL.md`

**Step 5: Generate project template**
Create `templates/[track-name]/CLAUDE.md` — a pre-filled project config for this type.

**Step 6: Generate track documentation**
Create `docs/tracks/[track-name].md`:
```markdown
# [Track Name] Track

## When to use this track
[Project types that belong here]

## Agents
[Table of agents and their domains]

## Skills
[List of skills and when they activate]

## Typical sprint structure
[How sprints look for this project type]

## Key resources
[Documentation, tools, references specific to this domain]
```

**Step 7: Register the track**
Update `CLAUDE.md` Tracks table to include the new track.

**Step 8: Full review**
Present the complete package — all agents, skills, template, documentation — for user approval before writing anything.

"Here is the complete [Track Name] track I've designed. [Summary of agents and skills]. Shall I create all these files?"
