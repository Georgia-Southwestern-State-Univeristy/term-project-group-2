# Sprint Retrospective

## What went well

### Architecture decisions held up
The decision to separate game logic into distinct functions 
(`_on_platform_area_entered`, `_on_catcher_area_entered`, 
`_on_MessengerTimer_timeout`) made it straightforward to add 
guards and new behavior without touching unrelated systems. 
The `game_over` flag as a single source of truth for state 
control proved reliable across all functions.

### Godot 4.6.1 migration was contained
Breaking changes were isolated and fixed systematically:
- `yield` → `await`
- `rand_range` → `randf_range`
- `RigidBody2D` → `Area2D` for drops
- `body_entered` → `area_entered` signals
- `shape.extents` → `shape.size`

No migration changes broke unrelated systems because the 
codebase had clear separation between game logic and physics.

### GUT tests added confidence
Writing tests against game rules (`energy_catch`, `asteroid_hit`, 
`check_game_over`) caught a logic error where asteroid hits were 
incorrectly costing attempts instead of deducting score.

### CI pipeline functional
`--path SpaceHunter_game` flag resolved the subfolder issue. 
Import step runs before tests to avoid asset loading failures.

---

## What slowed the team down

### Git workflow caused file corruption
`MainMenu.tscn` was corrupted by an unresolved merge conflict 
from GitHub Desktop auto-merging a binary-format scene file. 
This cost significant time to diagnose and required rebuilding 
the scene from scratch. Root cause: `.tscn` files are not 
human-mergeable but were treated as text files by Git.

**Engineering fix applied:** Team switched to command line Git. 

### Physics migration was underestimated
Switching from Godot 3.2.2 to 4.6.1 changed how `RigidBody2D` 
handles gravity and linear aspects. The assumption that 
`linear_velocity` would behave identically was wrong. This 
required changing the drop architecture from physics-based 
to manual `position.y += speed * delta` movement. The fix 
was straightforward but the diagnosis took longer than it 
should have because the root cause (gravity_scale default 
change) was not immediately obvious.

### Spawn boundary calculation was fragile
The original spawn code relied on `shape.extents.x` which 
was removed in Godot 4. The fallback `half_w = 16.0` was 
silently wrong drops spawned off screen with no error. 
A hardcoded margin of `80px` was used as the fix.

### Scope additions mid-beta introduced risk
New features (Messenger bot, camera shake, admin mode, 
HowToPlay screen) were added during the beta sprint. Each 
was implemented cleanly but collectively they increased 
the surface area for bugs.

---

## Top 3 lessons learned
- Core gameplay is stable and exportable even though it was a difficult transition.
CI is running. Documentation is complete. We learend that the previous
version of Godot did not support the GUT testing.
This is why we had to transition, since testing is important.
- Setting up the repository correctly to sync from desktop to repository without any problems.
- Keeping the scope intact and working towards it.



---

## Top 5 priorities for Weeks 13–15

- Add `*.tscn merge=binary` to `.gitattributes`
- Fix UI of the game
- Fix the problem when the window is minimized/ maximized 
- Export and test the .exe build after every significant change
- Remove all debug print statements before any export
