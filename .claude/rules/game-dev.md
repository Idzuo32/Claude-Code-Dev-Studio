---
description: Game development coding standards — applies when working in game project files across any engine.
globs: "Assets/**/*.cs,Source/**/*.cpp,Source/**/*.h,**/*.gd"
---

# Game Development Standards

## Code Quality
- State machines over if-else chains for character and AI behavior
- Data-driven design: stats and parameters in config files/ScriptableObjects, not hardcoded
- Object pooling for anything spawned and destroyed repeatedly
- Never cache expensive operations in hot paths (Update, _process, Tick)

## Architecture
- Separate data (stats, config) from behavior (logic, physics)
- Decouple systems via events/signals — gameplay programmer doesn't reach into UI
- Game logic must be testable without running the full game
- Editor scripts and tools live in dedicated editor folders, never in runtime builds

## Performance Rules
- Profile before optimizing. Intuition is wrong.
- Target platform is the benchmark — not your development machine
- AI update frequency should scale with distance from player
- Physics layers and collision matrices must be configured intentionally — not left as defaults

## Naming Conventions
- Unity C#: PascalCase classes, camelCase fields, _prefixedPrivate
- Godot GDScript: snake_case everything, PascalCase class names
- UE5 C++: FStructName, UClassName, AActorName, IInterfaceName, EEnumName
- All engines: descriptive names — PlayerMovementController, not PMC

## Design-Engineering Contract
- No mechanic gets implemented without a spec in `docs/game/mechanics/`
- Parameters exposed to designers via config/Inspector — not buried in code
- Designer changes must not require recompilation (ScriptableObjects, .tres, DataAssets)
- Designers must be able to iterate levels without programmer involvement

## Version Control for Game Assets
- Binary assets (textures, audio, models) use Git LFS
- Scene files are text format where engine supports it
- Never commit build artifacts, library folders, or generated cache
- Commit message format: `feat(player): add coyote time to jump mechanic`
