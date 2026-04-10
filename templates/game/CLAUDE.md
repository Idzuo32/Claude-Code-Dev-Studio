# Game Project

> Template for: games across Unity, Godot, Unreal, or other engines.

## Project Context
```
Project Name:     [name]
Type:             game
Track:            game-dev
Engine:           [Unity 6.x | Godot 4.x | Unreal Engine 5.x | other]
Language:         [C# | GDScript | C++ | Blueprint | GDScript+C#]
Genre:            [platformer | RPG | puzzle | shooter | strategy | simulation | other]
Target Platform:  [PC | mobile | console | web | all]
Current Phase:    [concept | prototype | production | polish | shipped]
Current Sprint:   [sprint number and name]
```

## Project Structure
```
[Engine-specific — see /start output for your stack]

docs/
  game/
    vision.md           ← creative vision document
    mechanics/          ← one spec per mechanic
    levels/             ← one document per level
    narrative/
      bible.md          ← story, characters, world
  sprints/

wiki/
  dashboard.md
  architecture.md
  decisions/
  discoveries/
```

## Game-Specific Session Rules
- Read `docs/game/vision.md` at the start of every session — every decision is measured against it
- No mechanic gets implemented without a spec in `docs/game/mechanics/`
- Parameters that designers tune belong in config assets, not hardcoded
- Profile on target hardware before reporting any performance issue
- Test on the oldest/weakest target device before marking any feature complete

## Active Agents
**Core:** game-director, game-designer, level-designer, narrative-director
**Engineering:** [unity-developer | godot-developer | unreal-developer], gameplay-programmer, ai-programmer, tools-programmer
**Studio:** tech-lead, qa-lead, devops-lead (for build pipeline)

## Active Skills
- `game-design-patterns` — core loops, economy, difficulty
- `[unity-patterns | godot-patterns | unreal-patterns]` — engine-specific
- `sprint-methodology` — sprint discipline

## Key Commands
- `/start` — if starting fresh
- `/sprint-plan` — generate sprint roadmap
- `/sprint-start [N]` — begin a sprint
- `/sprint-end [N]` — close sprint with retrospective
- `/review` — code review before merging any mechanic
- `/audit` — pre-release quality pass
