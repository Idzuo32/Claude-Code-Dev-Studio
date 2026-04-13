# Claude Code Dev Studio

**A full-stack development studio for building any application — web, mobile, SaaS, API, game, content, and beyond.**

You are the Studio Director. Every agent works for you. You make every product, architectural, and creative decision. The studio gives structure, specialized expertise, and quality gates to your work — not a replacement for your judgment.

**New here? Just run `/start` with your idea. The studio takes it from there.**

## Studio Philosophy

**Collaborative, not autonomous.** Every significant action follows:

```
Question → Options → Decision → Draft → Approval → Execute
```

**Idea-first.** You don't need to know anything about technology, frameworks, or architecture. Bring an idea. The studio handles the rest.

**Prescriptive, not just structural.** The studio tells you what to build next, in what order, and why.

**Compounding.** Every session makes the studio smarter about your project. Every project makes it smarter about you.

See `docs/COLLABORATIVE-DESIGN-PRINCIPLE.md` for the full protocol.

## Studio Hierarchy

### Tier 0 — Studio Brain

Orchestration layer that runs `/start`. Classifies ideas, conducts concept review, detects or generates tracks, produces all documents, plans sprints, hands off a fully configured project.

| Agent | Responsibility |
| - | - |
| `studio-brain` | Orchestrates the full `/start` sequence end-to-end |
| `track-architect` | Detects project type; generates new tracks dynamically |


### Tier 1 — Directors (Vision & Strategy)

| Agent | Responsibility |
| - | - |
| `product-director` | PRDs, user stories, feature specs, roadmap |
| `architecture-director` | System design, ADRs, tech stack selection |
| `tech-lead` | Code quality, reviews, standards, technical debt |


### Tier 2 — Department Leads (Domain Ownership)

| Agent | Responsibility |
| - | - |
| `frontend-lead` | Web UI architecture, component systems, rendering strategy |
| `mobile-lead` | Native/cross-platform strategy, device integrations, app stores |
| `backend-lead` | API design, data modeling, service architecture |
| `devops-lead` | CI/CD, infrastructure, deployment pipelines |
| `design-lead` | UX flows, accessibility, visual design systems |
| `qa-lead` | Test strategy, coverage gates, release readiness |
| `security-lead` | Threat modeling, auth patterns, vulnerability review |
| `launch-lead` | App Store strategy, marketing copy, launch preparation |
| `content-lead` | Content architecture, editorial standards, production pipeline |
| `game-director` | Game creative vision, cross-department coordination |


### Tier 3 — Specialists (Builders)

**Software Track** | Agent | Domain | |-------|--------| | `frontend-developer` | Web UI — any framework | | `mobile-developer` | Mobile — any stack | | `backend-developer` | API/services — any stack | | `database-architect` | Schema, migrations, indexing, queries | | `auth-specialist` | Authentication and authorization | | `payments-specialist` | Billing, subscriptions, IAP | | `devops-engineer` | CI/CD, Docker, cloud deployment | | `code-reviewer` | Code quality, standards enforcement | | `accessibility-specialist` | WCAG 2.1 AA compliance | | `performance-engineer` | Profiling, optimization | | `documentation-writer` | READMEs, API docs, runbooks |

**Game Dev Track** | Agent | Domain | |-------|--------| | `game-designer` | Mechanics, economy, systems design | | `level-designer` | World design, environment, progression | | `narrative-director` | Story, dialogue, lore, character | | `unity-developer` | Unity C\# implementation | | `godot-developer` | Godot GDScript/C\# implementation | | `unreal-developer` | UE5 C++/Blueprint implementation | | `gameplay-programmer` | Core mechanics and systems code | | `ai-programmer` | Game AI, state machines, pathfinding | | `tools-programmer` | Editor tools, pipelines, automation |

**Content & Research Track** | Agent | Domain | |-------|--------| | `content-writer` | Structured content production | | `research-analyst` | Market and technical research |

## Project Context

> Auto-filled by `/start`. Edit manually to override.

```
Project Name:     \\\\\\\[name\\\\\\\]      
Type:             \\\\\\\[web | mobile | saas | api | fullstack | game | content | research | custom\\\\\\\]      
Track:            \\\\\\\[software | game-dev | content | research | custom:\\\\\\\[name\\\\\\\]\\\\\\\]      
Primary Stack:    \\\\\\\[auto-detected or confirmed\\\\\\\]      
Target Platform:  \\\\\\\[browser | iOS | Android | cross-platform | server | desktop | console | PC\\\\\\\]      
Current Phase:    \\\\\\\[planning | sprint-0 | sprint-N | pre-launch | launched\\\\\\\]      
Current Sprint:   \\\\\\\[sprint number and name\\\\\\\]      
Developer Level:  \\\\\\\[non-developer | beginner | professional | experienced\\\\\\\]      
Constraints:      \\\\\\\[deadline | budget | team size | must-use technology | existing codebase\\\\\\\]
```

## Universal Session Rules

1. **Explore before building.** Read existing code and wiki before proposing changes.

2. **One concern per commit.** Never bundle unrelated changes.

3. **Tests are not optional.** New features ship with tests. Bugs get regression tests.

4. **Secrets never go in code.** `.env.example` documents required vars; `.env` is gitignored.

5. **Ask before adding dependencies.** New packages require justification and approval.

6. **Context budget.** At 50% context: `/compact`. At 70%: start a new session.

7. **Prefer reversibility.** When uncertain, choose the approach easiest to roll back.

8. **No stack assumptions.** If the stack is not specified, ask before writing code.

9. **Wiki first.** Start each session by reading ~/wiki/index.md for cross-project context, then the project's local wiki/dashboard.md.

10. **Sprint discipline.** Only build what is in the current sprint scope.

## Skill Auto-Activation (v4)

Before starting any of these activities, check `.claude/skills/` for a
relevant skill and apply it automatically — do not wait to be asked:

| Activity | Skill to load |
|----------|--------------|
| Starting implementation of any feature | `tdd-workflow` |
| Facing a bug, error, or unexpected behavior | `systematic-debugging` |
| Reviewing code before merge or sprint close | `two-stage-review` |
| Designing API endpoints | `api-design` |
| Working on auth flows | `auth-patterns` |
| Working on database schema or queries | `database-patterns` |
| Writing any payment or billing code | `saas-patterns` |
| Security-sensitive changes | `security-review` |
| Performance complaints or profiling | `performance` |
| Planning a sprint | `sprint-methodology` |
| Validating a concept or idea | `concept-validation` |
| Pre-launch preparation | `launch-strategy` |
| Working on Unity C# files | `unity-patterns` |
| Working on Godot files | `godot-patterns` |
| Working on Unreal Engine files | `unreal-patterns` |
| Working on game mechanics or balance | `game-design-patterns` |
| Producing content (prompts, copy, docs) | `content-production` |
| Research compilation tasks | `research-methodology` |
| Generating a new studio track | `track-generation` |
| App Store, landing page, or email copy | `product-copy` |
| UI text, error messages, empty states | `microcopy` |
| README, API docs, changelogs | `technical-docs` |
| Design phase work | `design-methodology` |

**The rule:** Read the relevant SKILL.md before writing any code or
producing any output for that activity. Skills are not optional suggestions
— they encode the quality standard for that type of work.

If no skill matches the current activity, proceed normally.
If you are unsure which skill applies, check `wiki/index.md` first.


## Commands Reference

**Studio Orchestration** | Command | Purpose | |---------|---------| | `/start` | Full studio onboarding — from idea to configured project | | `/concept-review` | Standalone concept challenge and validation | | `/new-track` | Generate a custom track for an unrecognized project type | | `/dashboard` | Regenerate project health dashboard | | `/onboard` | Generate collaborator onboarding document |

**Design Phase** ← Run between `/start` and `/sprint-plan` | Command | Purpose | |---------|---------| | `/design` | Guided ADD authoring — every system, every decision, every dependency | | `/map-systems` | Build dependency graph and optimal system build order | | `/design-index` | Update living design decision index after any architectural decision |

**Planning & Sprints** | Command | Purpose | |---------|---------| | `/plan` | Generate phased development plan | | `/sprint-plan` | Generate full sprint document suite (uses systems map if available) | | `/sprint-start` | Begin a sprint with checklist and agent briefing | | `/sprint-end` | Close sprint, retrospective, update learning loop |

**Building** | Command | Purpose | |---------|---------| | `/spec` | Interview-driven product spec generator | | `/new-project` | Scaffold a new project from template | | `/review` | Full code review — style, logic, security, performance | | `/test` | Generate comprehensive test suite | | `/refactor` | Safe refactor with pre/post analysis | | `/debug` | Systematic root-cause debugging |

**Quality & Launch** | Command | Purpose | |---------|---------| | `/audit` | Security + accessibility + performance audit | | `/deploy` | Pre-deployment checklist and workflow | | `/launch` | Launch preparation — App Store, marketing, distribution |

**Knowledge & Learning** | Command | Purpose | |---------|---------| | `/wiki-update` | Maintain project wiki (Karpathy pattern) | | `/wiki-query` | Query project + personal wiki | | `/reflect` | Personal learning loop — capture session patterns | | `/research` | Research track — compile knowledge on a topic | | `/docs` | Generate or update documentation | | `/status` | Project health dashboard |

## Tracks

| Track | Activated for |
| - | - |
| `software` | Web, mobile, SaaS, API, fullstack, CLI, desktop apps |
| `game-dev` | Games across Unity, Godot, Unreal, or other engines |
| `content` | Content products — courses, prompt libraries, newsletters |
| `research` | Research projects, competitive analysis, knowledge bases |
| `custom:\\\\\\\[name\\\\\\\]` | Dynamically generated by `/new-track` for novel project types |


## Sprint Cadence

Default: **1-week sprints**

```
Sprint 0:         Foundation (repo, CI/CD, auth, skeleton navigation)      
Sprint 1:         Core Loop (primary user journey end-to-end, even if rough)      
Sprint 2-N:       Feature Sprints (one complete, tested feature per sprint)      
Sprint Pre-L:     Launch Preparation (audit, ASO, marketing, analytics)      
Sprint Launch:    Submission + Monitoring + Initial Traction
```

All sprint documents live in `docs/sprints/sprint-N.md`.

## Wiki Structure

```
wiki/      
  dashboard.md          ← Read at start of every session      
  index.md              ← Catalog of all wiki pages with one-line summaries      
  log.md                ← Chronological session record (append-only)      
  open-questions.md     ← Unresolved decisions and open questions      
  architecture.md       ← Current system design, updated as decisions are made      
  decisions/            ← Individual decision records (why-X-over-Y.md)      
  discoveries/          ← Things learned the hard way (gotchas, quirks)
```

Personal learning wiki (cross-project): `~/.claude/wiki/` — never committed to git.

## Rescue Prompts

For difficult development moments, see `prompts/`:

- `stuck-on-bug.md` — stuck 2+ hours on the same problem

- `scope-creep.md` — Claude building beyond the sprint scope

- `handover.md` — starting a fresh session with full context transfer

- `second-opinion.md` — getting Claude to genuinely challenge its own answer

- `fresh-eyes.md` — re-approaching a stale or confusing problem

- `reset-session.md` — the session has gone off the rails entirely

## Escalation Paths

```
Software track:      
  Specialist → Department Lead → Architecture Director → You      
      
Game dev track:      
  game-designer / level-designer / narrative-director → game-director → you      
  unity / godot / unreal-developer → gameplay-programmer → game-director → you      
  tools-programmer → tech-lead → you      
      
Cross-track escalation:      
  Any agent → Architecture Director → You
```

## First Time Here?

Run `/start` with your idea. You only need the idea. The Studio Brain will interview you, challenge the concept, detect the track, and produce initial documents.

**The full flow from idea to first sprint:**

```
one sentence      
    ↓      
/start          → concept review, track detection, PRD, architecture docs      
    ↓      
/design         → guided ADD authoring — every system mapped and decided      
    ↓      
/map-systems    → dependency graph → optimal build order      
    ↓      
/sprint-plan    → sprints derived from dependency order (not guesswork)      
    ↓      
/sprint-start 0 → build begins
```

The design phase (`/design` → `/map-systems`) is optional but strongly recommended for any project that will take more than 2 weeks to build. Skipping it means sprint order is based on feature preference rather than system dependencies — which is the most common cause of mid-project blockers.

**You only need an idea.**

