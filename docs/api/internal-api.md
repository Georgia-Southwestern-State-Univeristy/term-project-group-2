# API / Interface Documentation

## Overview
SpaceHunter is a standalone desktop game with no REST API, no network
layer, and no external integrations. This document describes the
internal module interfaces how the major scripts communicate with
each other, what each module expects as input, and what it returns
or modifies.

---

## Module Map and Data Flow

Data flows in one direction `Main.gd` calls into each module.
Modules do not call each other directly.

---

## Messenger.gd

**Purpose:** Controls the Messenger bot dialogue box typing
animation, message selection, and trigger counters.

**Setup:**
```gdscript
messenger.setup(dialogue_box_node)
```
Must be called once in `Main._ready()` before any messages are shown.
Expects a node with two children: `NameLabel` and `MessageLabel`.

### Methods

#### `setup(box: Node)`
| Parameter | Type | Description |
|-----------|------|-------------|
| box | Node | Reference to the DialogueBox node in UILayer |

#### `show_message(text: String)`
Displays a message with typing animation. Silently ignored if
a message is already typing (`is_typing = true`).

| Parameter | Type | Description |
|-----------|------|-------------|
| text | String | Message to display |

**Behavior:**
- Sets `NameLabel` to `"> Messenger"`
- Types `text` character by character at 0.05s per character
- Holds message visible for 2.5 seconds
- Hides DialogueBox on completion
- Sets `is_typing = false` when done

#### `on_orb_caught()`
Increments `orbs_since_message`. Triggers a random positive message
every 3 calls.

#### `on_asteroid_missed()`
Increments `asteroids_since_message`. Triggers a random warning
message every 3 calls.

#### `on_idle()`
Triggers a random idle message. Called by `MessengerTimer` every
15 seconds.

**State variables:**
| Variable | Type | Default | Description |
|----------|------|---------|-------------|
| is_typing | bool | false | Blocks new messages while one is active |
| orbs_since_message | int | 0 | Counter for orb catch trigger |
| asteroids_since_message | int | 0 | Counter for asteroid miss trigger |

---

## Scoreboard.gd

**Purpose:** Controls the game over scoreboard display.

**Setup:**
```gdscript
scoreboard.setup(scoreboard_node)
```
Must be called once in `Main._ready()`.
Expects a node with children at `VBox/FinalScore` and
`VBox/RestartHint`.

### Methods

#### `setup(node: Node)`
| Parameter | Type | Description |
|-----------|------|-------------|
| node | Node | Reference to Menu/Scoreboard node in Main scene |

#### `show(score: int)`
Makes the scoreboard visible and populates it with the final score.

| Parameter | Type | Description |
|-----------|------|-------------|
| score | int | Final score to display |

**Behavior:**
- Sets `VBox/FinalScore` text to `"Final Score: {score}"`
- Sets `VBox/RestartHint` text to `"Press ENTER to play again"`
- Sets scoreboard node visible
- Logs error and returns early if node is invalid

#### `hide_board()`
Hides the scoreboard node. Used if a soft reset is implemented
in future without full scene reload.

---

## Spawner.gd

**Purpose:** Instantiates and positions drop objects (orbs and
asteroids). Controls fall speed scaling.

**Setup:**
```gdscript
spawner.setup(parent_node)
spawner.GoodDrop = preload("res://Crystal.tscn")
spawner.BadDrop = preload("res://Asteroid.tscn")
```
Must be called once in `Main._ready()`.

### Methods

#### `setup(p: Node)`
| Parameter | Type | Description |
|-----------|------|-------------|
| p | Node | Parent node that drops are added to (Main) |

#### `spawn()`
Instantiates one drop and adds it to the scene.

**Behavior:**
- Returns early if `game_over = true`
- Selects `BadDrop` with probability `bad_chance` (default 0.15)
- Spawns drop at random x between `80` and `screen_w - 80`
- Spawns drop at `y = -50` (above screen)
- Sets `drop.speed = drop_speed`
- Adds drop to `"drops"` group for cleanup tracking
- Logs error if scene is null

#### `update_speed(score: int)`
Recalculates drop speed based on current score.

| Parameter | Type | Description |
|-----------|------|-------------|
| score | int | Current player score |

**Formula:**
```gdscript
drop_speed = min(400.0, 200.0 + score * 1.5)
```
Speed starts at 200.0 and increases by 1.5 per point,
capped at 400.0.

#### `stop_all()`
Sets `game_over = true` and removes all active drops from the scene
by iterating the `"drops"` group and calling `queue_free()`.

**State variables:**
| Variable | Type | Default | Description |
|----------|------|---------|-------------|
| drop_speed | float | 200.0 | Current fall speed assigned to new drops |
| game_over | bool | false | Blocks new spawns when true |
| bad_chance | float | 0.15 | Probability of spawning an asteroid |
| GoodDrop | PackedScene | null | Crystal scene reference |
| BadDrop | PackedScene | null | Asteroid scene reference |


 
