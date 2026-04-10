# Quick Start Guide

## Prerequisites
- [Claude Code](https://claude.ai/code) installed
- Git
- Your language runtime(s) installed (Node.js, Python, etc.)

## Option A — New Project

```bash
# 1. Clone the studio template into your new project folder
git clone https://github.com/your-org/claude-code-dev-studio my-project
cd my-project

# 2. Remove the studio's git history and start fresh
rm -rf .git
git init
git add .
git commit -m "chore: initialize from Claude Code Dev Studio"

# 3. Open Claude Code
claude

# 4. Run the onboarding wizard
/start
```

The `/start` wizard will ask about your project type, stack, and goals, then configure the studio agents appropriately.

## Option B — Existing Project

```bash
# 1. Copy only the .claude/ directory into your project
cp -r /path/to/dev-studio/.claude /path/to/your-project/

# 2. Open Claude Code in your project
cd your-project
claude

# 3. Run onboarding
/start
```

## First Session Checklist

After `/start` completes:
- [ ] "Project Context" block in `CLAUDE.md` is filled in
- [ ] Tech stack confirmed with Architecture Director (or already known)
- [ ] Run `/plan` if you have a feature to build
- [ ] Run `/audit` if you're joining an existing codebase

---

## Common Workflows

### Starting a new feature
```
/spec    →  Define what you're building
/plan    →  Break it into phases with quality gates
             (build phase by phase, testing as you go)
/review  →  Before marking it done
```

### Debugging a production issue
```
/debug   →  Systematic root-cause analysis
/review  →  Review the fix before shipping
/deploy  →  Safe deployment with rollback plan
```

### Joining an existing codebase
```
/audit   →  Assess current health (security, accessibility, performance)
/status  →  Quick health dashboard
/plan    →  Prioritize what to fix first
```

### Pre-launch
```
/audit   →  Full security + accessibility + performance audit
/test    →  Generate missing test coverage
/docs    →  README, API docs, runbook
/deploy  →  Deployment checklist
```

---

## Key Files Reference

| File | Purpose |
|------|---------|
| `CLAUDE.md` | Master config — fill in Project Context block |
| `.claude/agents/` | 16 specialized agents |
| `.claude/commands/` | 11 slash commands |
| `.claude/skills/` | Domain knowledge auto-loaded by context |
| `.claude/rules/` | Coding standards loaded per file type |
| `.claude/hooks/scripts/` | Automation scripts (format, guard, session) |
| `docs/` | Project documentation output |

---

## Customizing the Studio

### Add a project-specific agent
Create `.claude/agents/my-specialist.md` with YAML frontmatter:
```markdown
---
name: my-specialist
description: What this agent does and when to invoke it.
tools: [Read, Write, Bash]
model: claude-sonnet-4-6
---
# My Specialist
...
```

### Add a project-specific skill
Create `.claude/skills/my-skill/SKILL.md` with frontmatter:
```markdown
---
name: my-skill
description: What knowledge this provides.
globs: "src/**/*.ts"
---
# My Skill
...
```

### Disable a hook
Comment out the relevant hook entry in `.claude/settings.json`.

### Override a rule
Create `.claude/rules/my-overrides.md` — rules are additive, so you can add project-specific conventions without removing the base ones.
