# Week 11 — Reliability + Failure Handling

## Overview
SpaceHunter is a single-player offline desktop game built in Godot 4.6.1.
Reliability risks are specific to game state integrity, object attemptcycle,
and user-facing feedback rather than network or database concerns.

---

## Risk 1 — Active drops trigger scoring after game over (FIXED)

**Risk:** When game over triggers, drops already falling on screen
continue to exist for a few frames. If they reach the ship or catcher
during that window, they fire collision events and change score or
attempt after game over has been declared.

**Before:**
Drops continued falling and colliding.
Score and attempts could change after scoreboard appeared.

**After:**
Two fixes applied together:

Fix 1 — All drops immediately removed on game over:
```gdscript
var drops = get_tree().get_nodes_in_group("drops")
for child in drops:
    child.queue_free()
```

Fix 2 — Every collision function checks game state first:
```gdscript
func _on_platform_area_entered(area: Area2D):
    if game_over:
        return
```

Applied to `_on_platform_area_entered` and `_on_catcher_area_entered`.

**Result:** No scoring or attempt changes possible after game over triggers.

---

## Risk 2 — Drops spawning off screen (FIXED)

**Risk:** During Godot 4.6 migration, the collision shape property
`extents` was removed. The spawn boundary calculation silently fell
back to a hardcoded `half_w = 16.0` which was too small, causing
drops to spawn partially or fully outside the visible screen area
making them uncatchable.

**Before:**
```gdscript
var half_w = shape.extents.x * drop.scale.x
drop.position.x = randf_range(half_w, screen_w - half_w)
```
Result: drops spawning cut off on left and right edges.

**After:**
```gdscript
var screen_w = get_viewport_rect().size.x
drop.position.x = randf_range(80, screen_w - 80)
```
All drops now spawn fully visible.

---

## Risk 3 — Messenger bot overlaps scoreboard (FIXED)

**Risk:** MessengerTimer appears every 15 seconds independently of
game state. If the timer works at the exact moment game over
triggers, the dialogue box appears on top of the scoreboard
obscuring the final score and restart prompt.

**Before:**
```gdscript
func _on_MessengerTimer_timeout():
    show_message(idle_messages[randi() % idle_messages.size()])
```
No guard — message could fire over scoreboard.

**After:**
```gdscript
func _on_MessengerTimer_timeout():
    if game_over:
        return
    show_message(idle_messages[randi() % idle_messages.size()])
```
Messenger truns off the moment game_over becomes true.

---

## User-Facing Error Improvements

### Improvement 1 — Messenger reacts to asteroid hits
Previously the player had no feedback when catching an asteroid
beyond the score silently decreasing. Now the Messenger bot
warns the player every 3 asteroid hits:
- "Be careful out there!"
- "Shields taking damage!"
- "That was close!"

This helps the player understand something went wrong and
why their score dropped.

### Improvement 2 — Messenger reacts to orb catches
Player now receives positive confirmation every 3 orbs caught:
- "Great job!"
- "Awesome catch!"
- "Energy secured!"

This confirms to the player that the scoring system registered
their catch, reducing confusion about whether hits were counted.

---

## Remaining Reliability Risks (Deferred to Week 12+)

### Risk A — No game rules or instructions shown before play starts
Currently the game jumps straight into gameplay after pressing Play
on the main menu. New players have no way of knowing the controls,
objective, or scoring rules without prior knowledge.

**Planned fix:** Add a rules/instructions screen between the main
menu and the game scene explaining controls (arrow keys), objective
(catch orbs, avoid asteroids), scoring (+1 per orb, -1 per asteroid),
and attempt system (5 attempts before game over).

### Risk B — Game over screen UI and buttons need adjustment
The current scoreboard is functional but basic. Layout, font sizes,
and button placement were not optimized for the final screen resolution
of 1152x648. Exit and restart options need clearer visual hierarchy.

**Planned fix:** Redesign the game over screen with properly sized
buttons, improved typography, and clearer separation between the
final score display and the action buttons.

### Risk C — Improved UI signals and audio feedback
Currently the game has no audio whatsoever. Player actions such as
catching orbs, hitting asteroids, and game over have no sound feedback.
UI signals between scenes could also be improved for smoother
transitions.

**Planned fix:** Add sound effects for orb catch, asteroid hit,
and game over. Improve scene transition signals and add audio bus
configuration to the project.


### Run notes:
- Player gets feedback when energy is caught
- Players gets notification for every 3 asteroid hits
- Players gets notification for every 3 orbs caught

### Evidence
PR Link - https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/247

