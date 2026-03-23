# Week 10 Security Notes

## Overview
This is a single-player offline desktop game built in Godot 3.2.2. 
There is no network, no login, and no persistent storage. 
Security risks are therefore specific to game state integrity and input validation.

---

## Risk 1 — Game state not gated during game over (FIXED)
**Risk:** Player input and game logic continued processing after game over 
was triggered. Energy objects kept spawning, score could change, and the ship 
could still move.

**Fix:** Added `if game_over: return` guard at the top of every 
input-sensitive function:
- `_on_CrystalTimer_timeout()`
- `_on_platform_body_entered()`
- `_on_Catcher_body_entered()`
- `_on_MessengerTimer_timeout()`

**Before:** Score could increment after game over if a drop landed 
on the ship during the game over transition.

**After:** All functions exit immediately when `game_over = true`. 
No state changes after game over is triggered.

PR Link: - https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/213
---

## Risk 2 — Messenger bot could continue to "talk" during game over screen (FIXED)
**Risk:** The MessengerTimer runs independently. If it starts to talk at the 
exact moment game over triggered, the dialogue box will continue to appear 
on top of the scoreboard.

**Fix:** Added `if game_over: return` at the top of 
`_on_MessengerTimer_timeout()`, which was already implemented:
```gdscript
func _on_MessengerTimer_timeout():
    if game_over:
        return
    show_message(idle_messages[randi() % idle_messages.size()])
```

**Before:** Idle message could overlap the scoreboard.

**After:** Messenger stops talking the moment game over is triggered.

**PR Link: - https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/211**

---

## Risk 3 — The asteroids trigger the loss of the attempts
**Risk:** Once the spaceship hits the asteroid, it should lose the point, 
not an attempt.

PR Link: - https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/214
---

## Input Validation Point 1 — Drop spawn boundaries
Drops are validated to spawn within screen boundaries using 
collision shape size, preventing objects from spawning off-screen 
or partially clipped:
```gdscript
var min_x = view_rect.position.x + half_w
var max_x = view_rect.position.x + view_rect.size.x - half_w
drop.position.x = rand_range(min_x, max_x)
```

## Input Validation Point 2 — Drop speed cap
Drop speed is capped to prevent it from scaling to an unplayable value:
```gdscript
drop_speed = min(400.0, 150.0 + score * 1.5)
```
Without this cap, speed would grow unbounded as score increases.

---

## Summary Table

| Risk | Severity | Fixed |
|------|----------|-------|
| Game state not gated after game over | High | Yes |
| Losing an attempt once hit asteroid | Medium | Yes |
| Messenger firing over scoreboard | Low | Yes |

---

## Evidence
- All fixes are visible in `Main.gd`

## Project Board link
https://github.com/orgs/Georgia-Southwestern-State-Univeristy/projects/21/views/1
