# Rescue Prompt: Session Has Gone Off the Rails

Use this when a session has produced a mess — wrong approach, too many changes, confused direction.

---

**Step 1: Stop**
Press Escape to cancel any running operation.

**Step 2: Assess the damage**
```bash
git status
git diff --stat HEAD
```

**Step 3: Decide**
- If changes are salvageable: continue to Step 4
- If changes are a mess: `git stash` or `git checkout .` to reset, then start fresh with the handover prompt

**Step 4: Paste this into Claude Code:**

```
This session has gone off course. Let's reset.

What happened: [describe what went wrong — wrong approach, too much scope, confused direction]

Current state of the code: [working / broken / partially working]

What we actually need to accomplish: [the original task, stated clearly]

Before writing any more code, I want you to:
1. Describe the correct approach in plain English — no code yet
2. Tell me the 3 specific files that need to change and what change each needs
3. Estimate how many lines of code this actually requires

If the estimate is more than [50] lines: the task is too large for one session and needs to be split.

Wait for my approval before writing anything.
```

---

**Why this works:** Off-the-rails sessions happen when scope was unclear or the approach was wrong from the start. This prompt forces a plan-before-execute reset. The line count estimate often reveals that the "simple" task was never simple — and that's the root cause of the mess.
