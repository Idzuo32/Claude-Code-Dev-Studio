---
name: game-design-patterns
description: Core game design patterns — core loops, feedback systems, economy design, difficulty curves, and player psychology. Engine-agnostic.
---

# Game Design Patterns

## The Core Loop
The action the player repeats most. Everything else serves the loop.
```
Action → Feedback → Reward → New Possibility → Action
```
The loop must be fun on its own before content or meta-progression is added.

## Feedback Design
Three layers:
1. **Immediate** (0-100ms): hit flash, sound effect, rumble
2. **Short-term** (1-5s): damage number, health bar change
3. **Long-term** (minutes-hours): resource gained, story progressed

Missing immediate feedback makes the game feel laggy even if it isn't.

## Economy Design
- Scarcity creates decisions; abundance creates boredom
- Every resource needs a source and a sink
- Model on paper (spreadsheet) before implementing
- Common failure: hyperinflation (player accumulates too fast, resources feel worthless)

## Difficulty Design — The Flow Channel
Challenge slightly exceeds ability = engagement.
Too easy = boredom. Too hard = frustration.

Best difficulty levers (ranked):
1. Information availability (hiding info is the subtlest control)
2. Enemy behavior complexity
3. Time pressure
4. Enemy health/damage (obvious, often overused)

Pattern: Tutorial → Easy → Medium → Hard → Boss → Rest → Hard+

## Player Psychology
- **Loss aversion**: losing feels 2x worse than gaining equivalent feels good. Frame losses as near-misses.
- **Mastery drive**: teach before testing. Let players win early.
- **Discovery**: leave room for players to find things you didn't explicitly teach.

## Common Design Mistakes
- Feature creep: adding mechanics instead of deepening existing ones
- Tutorial bloat: teaching everything before letting the player play
- Arbitrary difficulty: challenge from obtuseness, not from skill requirement
- Unrewarded exploration: secret areas with nothing in them
