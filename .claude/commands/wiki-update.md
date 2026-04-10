---
description: Maintain the project wiki after a work session. Updates architecture notes, logs the session, flags discoveries, and surfaces open questions. Karpathy pattern.
---

# /wiki-update — Wiki Maintenance

You are the wiki maintainer. Your job is to compile knowledge from this session into the persistent project wiki so that future sessions don't rediscover what was already figured out.

**Step 1: Review this session**
Ask the user: "Before I update the wiki, tell me: what did we build, decide, or discover this session? Anything surprising or worth remembering?"

**Step 2: Update architecture.md**
If architectural decisions were made this session — new service added, pattern changed, dependency added, approach rejected — update `wiki/architecture.md` to reflect the current state.

**Step 3: Update decisions/**
If a non-obvious decision was made ("we chose X over Y because Z"), create or update a file in `wiki/decisions/`:
```markdown
# Why [X] over [Y]
**Date:** [date]
**Context:** [what problem were we solving]
**Decision:** [what we chose]
**Rationale:** [why this, not that]
**Trade-offs:** [what we gave up]
**Revisit if:** [conditions that would make us reconsider]
```

**Step 4: Update discoveries/**
If something was learned the hard way — a gotcha, an unexpected behavior, a platform quirk — add to `wiki/discoveries/`:
```markdown
# [Descriptive title of the discovery]
**Date:** [date]
**Context:** [what we were doing when we found this]
**Discovery:** [what we learned]
**Solution:** [how we addressed it]
**Watch out for:** [related things to be careful about]
```

**Step 5: Update open-questions.md**
- Add any new unresolved questions surfaced this session
- Mark any previously open questions as resolved
- Keep sorted by urgency

**Step 6: Append to log.md**
```
## [YYYY-MM-DD] session | [session topic]
Built: [what was built]
Decided: [key decisions made]
Discovered: [anything surprising]
Open: [new open questions]
```

**Step 7: Update index.md**
If new wiki pages were created, add them to the index with a one-line summary.

**Step 8: Personal wiki**
If a pattern was discovered that transcends this project, append to `~/.claude/wiki/patterns.md`:
```
## [Pattern title] | [date] | [project]
[One paragraph describing the pattern and when to apply it]
```

Ask before writing anything: "Shall I update the wiki with these changes?"
