# Rescue Prompt: Stuck on a Bug (2+ hours)

Use this when you've been on the same bug for more than 2 hours and are going in circles.

---

**Paste this into Claude Code:**

```
I've been stuck on this bug for [time]. Let me describe it systematically.

SYMPTOM: [Exactly what happens. Not what you think is wrong — what actually happens.]

EXPECTED: [What should happen instead.]

WHAT I'VE TRIED: [List every approach, even failed ones. Each one narrows the space.]

RECENT CHANGES: [What changed right before this started? (git log --oneline -10)]

ENVIRONMENT: [Where does it happen? Always? Only in production? Only on device?]

I want you to:
1. Tell me what information you'd need to diagnose this that I haven't provided
2. Generate 3 hypotheses ranked by probability
3. Tell me the fastest test for each hypothesis — before suggesting fixes
```

---

**Why this works:** You've likely been tunnel-visioned on one hypothesis. Forcing a systematic description often surfaces the answer before Claude even responds. If not, the ranked hypotheses give you a test plan instead of random fixes.
