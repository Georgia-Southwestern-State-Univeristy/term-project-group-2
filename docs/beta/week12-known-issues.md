# Week 12 — Known Issues + Triage List

## Issue 1: Scoreboard UI needs final adjustment
**Priority: High**

**Description:** The game over scoreboard layout was built for the 
original 1024x600 resolution and migrated to 1152x648. Button sizing, 
font sizes, and element positioning are not fully optimized for the 
final resolution. The restart and exit buttons need clearer visual 
hierarchy and better spacing.

**Affected area:** `Main.tscn` Scoreboard node and its children, 
`Menu/Scoreboard/VBox` layout.

**Planned action:** Resize and reposition all scoreboard elements 
for 1152x648, adjust font sizes via Theme Overrides, and ensure 
buttons are clearly visible and clickable.

---

## Issue 2: Scene file corruption risk from Git conflicts
**Priority: High**

**Description:** During development, `MainMenu.tscn` became corrupted 
due to an unresolved Git merge conflict. The conflict markers 
(`<<<<<<<`, `=======`, `>>>>>>>`) were saved into the `.tscn` file 
causing Godot to fail parsing it entirely. The file had to be 
deleted and recreated from scratch.

**Affected area:** All `.tscn` and `.gd` files, any file edited 
by multiple team members simultaneously is at risk.

**Planned action:** Establish a team rule: do not use GitHub Desktop 
auto-merge on `.tscn` files. Always resolve conflicts manually in 
a text editor before opening in Godot.

---

## Issue 3: Planned scope additions not yet confirmed safe
**Priority: Medium**

**Description:** The game lead has requested additional features 
beyond the current scope. However, we have to evaluate
technical risk and time at this stage of development. 
There could be issues introducing new features in Week 12.

**Affected area:** Potentially all game systems depending on 
what features are requested.

**Planned action:** Game lead to present specific feature requests 
to the team. Each feature to be evaluated against two criteria:

- Can it be implemented in isolation without touching existing systems?
- Can it be completed and tested within the remaining time?


---

## Issue 4: No audio output in any part of the game
**Priority: Medium-Low**

**Description:** The game currently has no sound effects.
This significantly reduces the game feel and player feedback.

**Affected area:** All scenes.

**Planned action:** Add an `AudioStreamPlayer` node to Main.tscn. 
Source royalty-free sound effects. Howver it is not crucial for the project.

---

## Issue 5: Game performance not stress tested
**Priority: Low**

**Description:** No major performance issues have been detected 
during normal gameplay. However the game has not been stress tested 
under edge cases, for example very high scores where drop speed 
approaches the 400.0 cap and spawn rate is at maximum, or running 
on lower-spec hardware.

**Affected area:** `Main.gd` star scrolling loop in `_process()`, 
drop spawning in `_on_CrystalTimer_timeout()`.

**Planned action:** Playtest at high score values to confirm 
performance stays smooth. Use the ADMIN Mode to stress test the game.
