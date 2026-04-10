# Rescue Prompt: Session Handover (Fresh Start with Full Context)

Use this at the start of a new session when you need to transfer full context from previous sessions.

---

**Paste this at the start of a new Claude Code session:**

```
Starting a new session. Please read the following files to get up to speed, in this order:
1. CLAUDE.md — project configuration and rules
2. wiki/dashboard.md — current project state
3. wiki/open-questions.md — unresolved decisions
4. docs/sprints/sprint-[N].md — the current sprint
5. wiki/log.md — last 3 entries only

After reading, tell me:
- What sprint we're in and how many exit criteria are passing
- The top 3 open questions
- What was last worked on
- What you recommend we work on first today

Do not start any work until I confirm the direction.
```

---

**Why this works:** New sessions start without memory of previous sessions. This prompt forces the context load to happen explicitly and verifiably before any work begins, preventing the session from starting on false assumptions.
