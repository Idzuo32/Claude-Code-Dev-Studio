# Learning Loop

## Two Levels of Learning

### Project-Level (wiki/)
Captures what was learned about this specific project:
- Architectural decisions and their rationale
- Platform and library discoveries (gotchas, quirks)
- Open questions and their resolutions
- Session-by-session progress log

Committed with the project. Accessible to collaborators.

### Personal-Level (~/.claude/wiki/)
Captures patterns across all projects:
- Velocity data (estimated vs. actual, variance causes)
- Recurring mistakes and their fixes
- Workflow improvements
- Studio-level improvement suggestions

Never committed. Personal to the developer.

## Commands
- `/wiki-update` — maintain project wiki after a session
- `/wiki-query [topic]` — query both wikis for context
- `/reflect` — capture personal patterns after difficult or productive sessions
- `/sprint-end [N]` — automatically feeds the learning loop as part of sprint close

## Personal Wiki Structure
```
~/.claude/wiki/
  reflections.md      ← per-session notes
  patterns.md         ← recurring patterns (named and described)
  velocity.md         ← sprint velocity data across all projects
  studio-improvements.md ← suggestions for improving the studio itself
```

## When to Reflect
- After a session that took significantly longer than expected
- After finding a bug that came from a pattern you've seen before
- After a particularly productive session — what made it work?
- After completing a sprint

## Pattern Recognition
When the same friction appears in two different projects, that's a pattern. Document it in `~/.claude/wiki/patterns.md` with:
- A name
- How many times you've seen it
- What causes it
- How to prevent or address it

Over 6-12 months, the personal wiki becomes a genuine record of your development practice.
