---
description: Project health dashboard — tests, build, open issues, coverage, and recent activity.
---

# /status — Project Health Dashboard

Gives you a snapshot of where the project stands right now.

**Run these checks and report results:**

**1. Git status**
```bash
git status --short           # uncommitted changes
git log --oneline -10        # recent commits
git branch -a               # branches
```

**2. Build health** (adapt command to project stack)
```bash
# JS/TS
npm run build 2>&1 | tail -5
npm run typecheck 2>&1 | tail -5

# Python
python -m mypy src/ 2>&1 | tail -5

# Rust
cargo check 2>&1 | tail -5
```

**3. Test status**
Run the project's test command and report:
- Pass / Fail / Error count
- Coverage % if available
- Any failing test names

**4. Lint**
Run the project's lint command and report error count.

**5. Dependencies**
```bash
npm audit --audit-level=high  # Node.js
pip-audit 2>/dev/null         # Python
cargo audit 2>/dev/null       # Rust
```

**6. Open issues / TODOs**
```bash
grep -rn "TODO\|FIXME\|HACK\|XXX" src/ --include="*.ts" --include="*.py" --include="*.go" | head -20
```

**Output format:**
```
╔══════════════════════════════╗
║  Project Health Dashboard    ║
╚══════════════════════════════╝

Git:         ✅ Clean / ⚠️ N uncommitted files
Build:       ✅ Passing / ❌ N errors
Tests:       ✅ N passing / ❌ N failing (Coverage: N%)
Lint:        ✅ Clean / ⚠️ N warnings / ❌ N errors
Security:    ✅ No vulnerabilities / ⚠️ N low / ❌ N high
TODOs:       N open TODO/FIXME comments

Recent activity:
  [last 5 commits]

Recommended next action:
  [most important thing to address]
```
