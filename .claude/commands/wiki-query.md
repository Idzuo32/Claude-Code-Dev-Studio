---
description: Query the project wiki and personal wiki for context on a topic. Use at session start or when you need to reconstruct context fast.
---

# /wiki-query [topic] — Wiki Query

**Input:** A topic, question, or "all" for full context.

**Step 1: Read the index**
Read `wiki/index.md` to find relevant pages. Then read the relevant pages directly.

**Step 2: Check personal wiki**
Read `~/.claude/wiki/` for cross-project patterns relevant to the topic.

**Step 3: Synthesize**

Output a structured summary:

```markdown
## What we know about [topic]

### Current state
[From architecture.md or relevant wiki pages]

### Decisions made
[From decisions/ — what was decided and why]

### Discoveries
[From discoveries/ — gotchas and lessons]

### Open questions
[From open-questions.md — what's still unresolved]

### Personal patterns
[From ~/.claude/wiki/ — cross-project lessons that apply here]

### Gaps
[What we don't know yet that would be useful]
```

If the topic is "all" or "session start":
- Read wiki/dashboard.md
- Read wiki/open-questions.md
- Read the last 3 entries in wiki/log.md
- Print: "Project state as of [date]: [2-3 sentence summary]"
