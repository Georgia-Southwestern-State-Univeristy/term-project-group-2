# Authentication & Access Control

## Overview
This is a single-player offline desktop game built in Godot 3.2.2.
Security is implemented through game state control and a protected admin mode.

---

## How Users Authenticate

### Player (default role)
No authentication required. The player launches the game and plays immediately.
Access is controlled by game state.

### Admin (debug role)
Admin mode is activated by a secret key combination during gameplay:
**Ctrl + Shift + Enter**

---

## What is Protected

| Area | Protection Method |
|------|------------------|
| Game actions during game over | `if game_over: return` the game does not continue |
| Score manipulation | Only available in admin mode |
| Infinite attempts | Only available in admin mode |
| Admin mode access | Secret key combination unknown to regular players |

---

## Role Model

| Role | How to Access | Permissions |
|------|--------------|-------------|
| Player | Launch the game | Play, move ship, catch objects |
| Admin | Ctrl + Shift + Enter during gameplay | All player actions + score change + infinite attempts |

---

## Access Control Rules

### Rule 1 — Game state
Player cannot interact with game objects when `game_over = true`.
Every sensitive function checks this at the top:
```gdscript
if game_over:
    return
```
Applies to:
- `_on_CrystalTimer_timeout()`
- `_on_platform_body_entered()`
- `_on_Catcher_body_entered()`
- `_on_MessengerTimer_timeout()`

### Rule 2 — Admin only actions
Score manipulation and infinite attempts are protected and can be used only in admin mode:
```gdscript
if admin_mode and Input.is_action_just_pressed("ui_up"):
    score += 50

if body.points > 0:
    if not admin_mode:
        life -= 1
```
Regular players cannot access these without knowing the key combination.

### Rule 3 — Admin mode is session only
`admin_mode` is a boolean variable that defaults to `false` on every 
game launch and resets on restart:
```gdscript
var admin_mode = false
```
There is no way to permanently enable admin mode.

## PR Links

PR Link: - 
https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/216
https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/217


## Demo notes

- Only admin with the access code can enter the admin mode and make changes to the features such as attempt/lives and score.
- Player cannot play in admin mode permanently. 
