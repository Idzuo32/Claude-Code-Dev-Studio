---
name: godot-patterns
description: Godot 4.x GDScript patterns — scene architecture, signals, resources, state machines, and performance patterns.
globs: "**/*.gd,**/*.tscn,**/*.tres,project.godot"
---

# Godot 4.x Patterns

## Scene Architecture Rules
- Scenes are self-contained
- Children communicate UP via signals
- Parents communicate DOWN via direct method calls
- Siblings never communicate directly — route through parent or Autoload

## Signals Over Direct References
```gdscript
signal health_changed(new_health: int)
signal died

func take_damage(amount: int) -> void:
    health -= amount
    health_changed.emit(health)
    if health <= 0:
        died.emit()
```

## Resource Pattern (data)
```gdscript
class_name EnemyConfig
extends Resource

@export var move_speed: float = 200.0
@export var max_health: int = 100
@export var attack_damage: float = 10.0
```
Save as `.tres`, assign in Inspector. Edit data without touching code.

## State Machine
```gdscript
class_name StateMachine
extends Node

var current_state: State

func transition_to(state_name: String) -> void:
    if current_state:
        current_state.exit()
    current_state = states[state_name]
    current_state.enter()

func _process(delta: float) -> void:
    if current_state:
        current_state.update(delta)
```

## Autoloads — Use Sparingly
Only for truly global, cross-scene state. Not a dumping ground.
```gdscript
# autoloads/game_events.gd — global event bus
extends Node
signal enemy_died(enemy: Node)
signal player_health_changed(new_health: int)
```

## Performance
- `@onready` for node references — never GetNode in _process
- Groups for broadcasting to many nodes
- Call deferred for modifying scene tree during physics callbacks
