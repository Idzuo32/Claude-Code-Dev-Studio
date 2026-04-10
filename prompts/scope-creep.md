# Rescue Prompt: Scope Creep

Use this when Claude is building beyond what you asked for, or the session has grown far beyond the sprint scope.

---

**Paste this into Claude Code:**

```
Stop. Before continuing, I need to reorient.

Current sprint goal: [paste from docs/sprints/sprint-N.md]
Current sprint exit criteria: [paste the criteria]

What we were working on: [the original task]
What has grown: [what additional scope appeared]

I want you to:
1. Stop all work on items outside the sprint scope
2. List everything you've done in this session
3. Identify which items are IN scope and which are OUT
4. Finish only the in-scope items
5. Create a list of out-of-scope items to add to the next sprint

We are not doing more than the sprint scope in this session.
```

---

**Why this works:** Claude will sometimes "helpfully" add related things. This isn't always wrong — but it needs to be a conscious decision, not a drift. This prompt makes the boundary explicit and gives Claude a path to close cleanly.
