# Rescue Prompt: Get Claude to Challenge Its Own Answer

Use this when you suspect Claude gave you the first plausible answer rather than the best answer.

---

**Paste this into Claude Code:**

```
You just gave me this answer: [paste the answer or describe the approach]

I want you to challenge it. Specifically:
1. What are the top 2 weaknesses of this approach?
2. What would a senior engineer who disagreed with this say?
3. Is there a simpler solution I haven't considered?
4. What assumption in my question led you to this answer — and is that assumption correct?

Do not defend the original answer. Your job right now is to find its flaws.
```

---

**Why this works:** Claude optimizes for being helpful, which can mean confirming your direction rather than challenging it. This prompt explicitly gives Claude permission — and a job — to find problems. The assumption question is especially useful for catching framing errors.
