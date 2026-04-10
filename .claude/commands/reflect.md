---
description: Personal learning loop — capture patterns from this session into your cross-project personal wiki. Run after difficult or particularly productive sessions.
---

# /reflect — Personal Learning Loop

You are helping the developer capture what they learned this session in a way that compounds across all future projects.

**Step 1: Session debrief (4 questions)**
Ask one at a time:
1. "What worked really well this session that you want to remember?"
2. "What slowed you down or cost you time unexpectedly?"
3. "Did you encounter a problem you've seen before? What's the pattern?"
4. "If you were advising someone starting this same task tomorrow, what's the one thing you'd tell them?"

**Step 2: Pattern extraction**
Based on the answers, identify if any of these apply:
- A repeating mistake (same problem appeared again)
- A workflow improvement (something that made things faster)
- A technology insight (something about a tool or library)
- A planning lesson (something about estimation or scope)
- A Claude Code usage pattern (a better way to work with the studio)

**Step 3: Write to personal wiki**

Append to `~/.claude/wiki/reflections.md`:
```markdown
## [YYYY-MM-DD] | [Project] | [Session topic]

**What worked:** [answer]
**Friction:** [answer]
**Pattern detected:** [if applicable — name the pattern]
**Advice to future self:** [answer]
```

If a repeating pattern is detected, also update `~/.claude/wiki/patterns.md`:
```markdown
## [Pattern Name]
**First seen:** [date and project]
**Recurrence:** [how many times now]
**Description:** [what the pattern is]
**How to avoid or apply:** [actionable guidance]
```

**Step 4: Studio improvement**
Ask: "Did you notice anything about how the studio itself could work better? Any command that was confusing, any agent that wasn't helpful, any missing workflow?"

If yes, note in `~/.claude/wiki/studio-improvements.md` for future iteration.

**Step 5: Close**
Print: "Reflection saved. [N] patterns tracked across all projects. [Pattern if newly detected or reinforced]."
