# Week 14 Final Bug Triage

## Closed This Week
**Main.gd refactored into separate scripts**  `Main.gd` was split into
  `Messenger.gd`, `Scoreboard.gd`, and `Spawner.gd` to improve
  testability and code organisation. All game logic preserved.
  Link to PR: 

---

## Remaining Issues

### 1. Debug print statements left in Main.gd
**Priority: Critical**

**Description:** Several `print()` statements used during development
are still active in the release build. These output game events to
the console which is visible when running from the Godot editor or
command line. Not appropriate for a final release.

**Affected component:** `Main.gd`  `_on_platform_area_entered`
and `_on_catcher_area_entered`

**Owner:** Olga

**Disposition:** Remove all print statements before Week 15 presentation.

---

### 2. Score can go negative
**Priority: Important**

**Description:** Catching multiple asteroids pushes score below zero
with no floor enforced. The scoreboard can display a negative final
score which is confusing and unintended.

**Affected component:** `Spawner.gd`  `update_speed()`,
`Main.gd`  `_on_platform_area_entered`

**Owner:** Olga

**Disposition:** Add `score = max(0, score)` after every deduction
before Week 15.

---

### 3. No audio in any part of the game
**Priority: Moderate**

**Description:** The entire game runs in silence. No sound effects
for orb catch, asteroid hit, missed orb, game over, or main menu.
Audio feedback significantly improves game feel and player
understanding of what is happening.

**Affected component:** All scenes, no AudioStreamPlayer nodes
exist anywhere in the project.

**Owner:** Olga

**Disposition:** Add sound effects.

---

### 4. Scoreboard UI not fully polished
**Priority: Important**

**Description:** The game over scoreboard layout was not redesigned
after the window resolution changed to 1152x648. Font sizes, button
spacing, and element positioning are not optimal for the final
resolution. The restart and exit buttons lack clear visual hierarchy.

**Affected component:** `Main.tscn`: `Menu/Scoreboard` node
and its children.

**Owner:** Olga

**Disposition:** Resize and reposition scoreboard elements before
Week 15 presentation.


---

### 5. No visual warning when attempts are critically low
**Priority: Optional**

**Description:** When the player has only 1 attempt remaining there
is no visual indication that they are close to game over. The
attempts label updates but does not draw attention to itself.
Players may not notice until it is too late.

**Affected component:** `Main.gd`: `_on_catcher_area_entered`,
`Menu/Life` label node.

**Owner:** Group 2

**Disposition:** Flash the attempts label red when life reaches 1.
Implement in Week 15 if time allows.

---

### 6. Window stretching behaviour not tested on all screen sizes
**Priority: Optional**

**Description:** Stretch mode is set to `canvas_items` with `expand`
aspect. This was tested on the development machine but not verified
on significantly different resolutions such as ultrawide monitors
or 1080p screens. UI elements may shift or overlap at extreme
aspect ratios.

**Affected component:** Project Settings, Stretch Mode,
all UI nodes in `Main.tscn` and `MainMenu.tscn`.

**Owner:** Olga

**Disposition:** Test on at least one additional screen resolution
before Week 15. Switch to `keep` aspect if layout breaks.
