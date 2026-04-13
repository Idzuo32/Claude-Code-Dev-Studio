<div align="center">

# Claude Code Dev Studio

**A full-stack development studio for building anything.**
Web, mobile, SaaS, API, game, content, research — bring an idea, the studio handles the rest.

*Inspired by [Claude-Code-Game-Studios](https://github.com/Donchitos/Claude-Code-Game-Studios) by Donchitos.*

</div>

---

## Why This Exists

Most Claude Code setups are a single CLAUDE.md file with some instructions.
This studio gives Claude Code the structure of a real development team —
37 specialized agents, a guided onboarding sequence that takes any idea
from one sentence to a configured project, and a sprint system that
keeps builds disciplined from start to launch.

You bring the idea. The studio handles the rest.

![Studio Brain /start sequence](assets/studio-start.png)

## Start Here

```bash
# Clone
git clone https://github.com/Idzuo32/claude-code-dev-studio my-project
cd my-project && rm -rf .git && git init

# Open Claude Code
claude

# That's it. The studio takes it from here.
/start
```

You only need an idea. `/start` interviews you, challenges your concept, detects or builds the right track, produces all project documents, plans your sprints, and hands you a configured project.

**Works for non-developers and experienced engineers alike.**

---

## What's In Here

### Studio Brain (new)
The `/start` command is now a full orchestration sequence. From raw idea to configured project in one conversation:
1. Identifies whether you're a developer or idea-first founder — adapts accordingly
2. Interviews you about your concept (5-8 questions)
3. Challenges it honestly before writing anything (Go / Refine / Pivot)
4. Detects the right track — or generates a custom one if needed
5. Produces all documents with your approval at each step
6. Plans your full sprint roadmap
7. Hands off with "Sprint 0 starts now"

### Design Phase (new in v3)

Take any idea from one sentence to a dependency-ordered sprint plan
before writing a single line of code.

/design       → Guided ADD authoring — every system, every decision mapped
/map-systems  → Dependency graph — optimal build order, no mid-project blockers  
/design-index → Living decision record — every architectural choice with rationale

Full flow: /start → /design → /map-systems → /sprint-plan → /sprint-start 0

### Three-Tier Agent Hierarchy (37 agents)
```
Tier 0: Studio Brain
  studio-brain, track-architect

Tier 1: Directors
  product-director, architecture-director, tech-lead

Tier 2: Department Leads
  frontend-lead, mobile-lead, backend-lead, devops-lead,
  design-lead, qa-lead, security-lead, launch-lead, content-lead, game-director

Tier 3: Specialists — Software Track
  frontend-developer, mobile-developer, backend-developer,
  database-architect, auth-specialist, payments-specialist,
  devops-engineer, code-reviewer, accessibility-specialist,
  performance-engineer, documentation-writer

Tier 3: Specialists — Game Dev Track
  game-designer, level-designer, narrative-director,
  unity-developer, godot-developer, unreal-developer,
  gameplay-programmer, ai-programmer, tools-programmer

Tier 3: Specialists — Content & Research
  content-writer, research-analyst
```

### 24 Commands
```
Studio:     /start /concept-review /new-track /dashboard /onboard
Sprints:    /sprint-plan /sprint-start /sprint-end
Building:   /spec /new-project /review /test /refactor /debug
Quality:    /audit /deploy /launch
Knowledge:  /wiki-update /wiki-query /reflect /research /docs /status
```

### Tracks
| Track | Activated for |
|-------|--------------|
| `software` | Web, mobile, SaaS, API, CLI, desktop |
| `game-dev` | Unity, Godot, Unreal, any engine |
| `content` | Prompt libraries, courses, newsletters |
| `research` | Competitive analysis, knowledge bases |
| `custom:[name]` | Dynamically generated for novel types |

### 20 Skills (auto-load by file context)
tdd-workflow, api-design, saas-patterns, mobile-patterns, auth-patterns, security-review, database-patterns, performance, sprint-methodology, concept-validation, launch-strategy, game-design-patterns, unity-patterns, godot-patterns, unreal-patterns, content-production, research-methodology, track-generation, systematic-debugging, two-stage-review

### Karpathy Wiki (project + personal)
Every project gets a `wiki/` directory — persistent, compounding knowledge maintained by `/wiki-update`:
- Architecture decisions with rationale
- Session-by-session log
- Gotchas and discoveries
- Open questions

Personal cross-project learning at `~/.claude/wiki/`:
- Velocity data across all projects
- Recurring patterns and their fixes
- Studio improvement suggestions

### 6 Rescue Prompts
For difficult development moments: `prompts/stuck-on-bug.md`, `scope-creep.md`, `handover.md`, `second-opinion.md`, `fresh-eyes.md`, `reset-session.md`

---

## Repository Layout

```
.
├── CLAUDE.md                     ← Master config
├── README.md                     ← This file
├── .claude/
│   ├── settings.json
│   ├── agents/     (37 agents)
│   ├── commands/   (24 commands)
│   ├── skills/     (20 skills)
│   ├── hooks/scripts/ (4 hooks)
│   └── rules/      (5 rule sets)
├── docs/
│   ├── COLLABORATIVE-DESIGN-PRINCIPLE.md
│   ├── SPRINT-METHODOLOGY.md
│   ├── TRACK-SYSTEM.md
│   ├── GAME-DEV-GUIDE.md
│   ├── STUDIO-BRAIN-GUIDE.md
│   ├── LEARNING-LOOP.md
│   ├── quick-start.md
│   ├── agent-roster.md
│   └── coordination-map.md
├── wiki/                         ← Project wiki scaffold
│   ├── dashboard.md
│   ├── index.md
│   ├── log.md
│   ├── open-questions.md
│   ├── architecture.md
│   ├── decisions/
│   └── discoveries/
├── prompts/                      ← Rescue prompts
│   ├── stuck-on-bug.md
│   ├── scope-creep.md
│   ├── handover.md
│   ├── second-opinion.md
│   ├── fresh-eyes.md
│   └── reset-session.md
└── templates/
    ├── web-saas/CLAUDE.md
    ├── mobile-app/CLAUDE.md
    ├── api-backend/CLAUDE.md
    ├── fullstack/CLAUDE.md
    ├── game/CLAUDE.md
    ├── content/CLAUDE.md
    └── research/CLAUDE.md
```

---

## Philosophy

**Collaborative, not autonomous.** Every significant action: Question → Options → Decision → Draft → Approval → Execute.

**Idea-first.** You only need an idea. The studio handles classification, tech stack, documents, and sprint planning.

**Prescriptive.** The studio tells you what to build next, in what order, and why — not just gives you tools.

**Compounding.** Sessions build on each other. Projects build on each other. The studio gets smarter about you over time.

---

## Credits

- Structural inspiration: [Claude-Code-Game-Studios](https://github.com/Donchitos/Claude-Code-Game-Studios) by Donchitos
- Wiki pattern: [Andrej Karpathy's LLM-Wiki](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)
- Hook + rules patterns: [everything-claude-code](https://github.com/affaan-m/everything-claude-code) by affaan-m
- Best practices: [claude-code-best-practice](https://github.com/shanraisshan/claude-code-best-practice) by shanraisshan
- Community: [awesome-claude-code](https://github.com/hesreallyhim/awesome-claude-code) by hesreallyhim
- Templates: [claude-code-templates](https://github.com/davila7/claude-code-templates) by davila7
- Workflow methodology: [superpowers](https://github.com/obra/superpowers)
by Jesse Vincent — systematic debugging and two-stage review patterns

---

MIT License
