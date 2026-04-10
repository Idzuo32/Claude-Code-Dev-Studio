# Rescue Prompt: Fresh Eyes on a Stale Problem

Use this when you've been looking at the same code or design problem for too long and need a reset.

---

**Paste this into Claude Code:**

```
I've been working on this for [time] and I'm too close to it. I need you to look at this with fresh eyes.

Here is the thing I'm looking at: [paste code, design doc, or describe the feature]

Here is what I'm trying to achieve: [the goal]

I do NOT want you to:
- Fix the thing immediately
- Tell me what's wrong

I DO want you to:
1. Describe what this code/design ACTUALLY does right now, in plain English, as if you're explaining it to someone who's never seen it
2. Ask me 3 clarifying questions about what it SHOULD do
3. Then wait for my answers before suggesting anything

I need to hear it described fresh before I can see what's wrong.
```

---

**Why this works:** When you're stuck, you're often solving the wrong problem. Having Claude narrate what the code actually does (not what you think it does) surfaces the gap. The clarifying questions force you to articulate the intent, which often reveals the disconnect.
