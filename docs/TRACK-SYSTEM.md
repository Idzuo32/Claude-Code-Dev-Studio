# Track System

## What is a Track?
A track is a configuration of agents, skills, and templates optimized for a specific type of project. The track determines which specialists are active, which skills auto-load, and how the project is structured.

## Built-in Tracks

### software
Web, mobile, SaaS, API, CLI, desktop applications.
Agents: frontend-developer, mobile-developer, backend-developer, database-architect, auth-specialist, payments-specialist, devops-engineer, code-reviewer, accessibility-specialist, performance-engineer.

### game-dev
Games across any engine: Unity, Godot, Unreal, or others.
Agents: game-director, game-designer, level-designer, narrative-director, unity/godot/unreal-developer, gameplay-programmer, ai-programmer, tools-programmer.

### content
Content products: prompt libraries, courses, newsletters, resource databases.
Agents: content-lead, content-writer, documentation-writer.

### research
Research projects, competitive analysis, knowledge compilation.
Agents: research-analyst.

## Dynamic Track Generation
When no built-in track fits, run `/new-track`. The Track Architect will:
1. Analyze the domain
2. Design a specialist agent roster
3. Generate agent and skill files
4. Create a project template
5. Document the new track in `docs/tracks/[name].md`

Generated tracks are saved and reusable for future projects of the same type.

## Multi-Track Projects
Some projects span tracks (e.g. a mobile game with a SaaS backend). Use the primary track for the main project configuration. Import relevant agents from secondary tracks explicitly in CLAUDE.md.

## Track Files Location
```
.claude/agents/          — all agent files
.claude/skills/          — all skill files
templates/[track]/       — project templates
docs/tracks/             — track documentation
```
