# Game Development Guide

## Getting Started
Run `/start` with your game idea. Select or confirm the `game-dev` track. Specify your engine (Unity, Godot, or Unreal).

## The Game Dev Hierarchy

**Game Director** — Creative vision and cross-department authority. Every feature decision is measured against the vision document at `docs/game/vision.md`. Read this before starting any session.

**Game Designer** — Mechanics, economy, progression. Every mechanic gets a spec at `docs/game/mechanics/[name].md` before implementation begins.

**Level Designer** — Spatial experience, pacing, encounter design.

**Narrative Director** — Story, dialogue, lore. Maintains `docs/game/narrative/bible.md`.

**Engine Developer** (Unity/Godot/Unreal) — Implementation in your specific engine.

**Gameplay Programmer** — Engine-agnostic mechanic implementation; escalate to engine developer for engine-specific questions.

**AI Programmer** — NPC and enemy behavior, state machines, pathfinding.

**Tools Programmer** — Editor tools, build pipeline, developer productivity.

## Game Dev Sprint Cadence
Game sprints follow the standard cadence but with game-specific exit criteria:

Sprint 0: Engine project initialized, target platform building, blank scene running on device.
Sprint 1: Core mechanic playable. The primary game loop works, even if ugly.
Sprint 2-N: Each sprint adds one complete system (combat, inventory, progression, etc.)
Pre-launch: Performance profiling on target hardware, platform certification checklist.

## Key Documents
```
docs/game/
  vision.md           ← read every session
  mechanics/          ← spec before implementing
  levels/             ← layout and design per level
  narrative/bible.md  ← story, characters, world
```

## Engine-Specific Notes
- **Unity**: See `unity-patterns` skill. Use URP unless specified otherwise.
- **Godot**: See `godot-patterns` skill. Prefer GDScript; use C# for performance-critical code.
- **Unreal**: See `unreal-patterns` skill. C++ for base classes, Blueprint for designer iteration.
