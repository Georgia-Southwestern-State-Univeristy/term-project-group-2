# Demo-readiness plan
Covers spawning asteroids and energy in Godot 3.2.2 (GDScript). 
Ensuring consistent game states for a repeatable, polished demonstration.
Key steps
Use of Timer node for timed spawning at random off-screen positions

## Step-by-Step Demo Script

**Setup:**
Open Godot 3.2.2, load project, click "Run Project" (F5).

**Start:**
Click "Start Game" button (triggers game_start() signal).

**Action:**
- Observe player/ship appearing, immediately followed by asteroids (RigidBody2D) spawning from edges.
Interaction: 
- Avoid asteroids, collect energy items 
- (Area2D/Particles) to increase score.
  
**End:**
- Allow game to end (on player/asteroid collision)
- Should demonstrate game-over screen and high-score saving.

## Seed Data Plan (Consistent Demo Data)

**Seed Random Number Generator (RNG):**

In _ready() of the main scene, set seed(12345) to ensure asteroids and energy spawn in the same locations every time.

**Fixed Spawn Rates:** 
Use Timer nodes set to specific values (e.g., 2.0s for asteroids, 5.0s for energy) rather than randomized times.

**Initial State:** 
Ensure the player starts at Vector2(center) with full health.

## Known Issues & Mitigation

**Issue:**

Asteroids spawn too close to the player/ship immediately. 

**Fix:**

Add a minimum distance check from player/ship position.

**Issue:** 

Too many asteroids cause performance lag. 

**Fix:** 

Limit total active RigidBody2D instances via a counter.

**Issue:** 

Energy items spawned outside view-port. 

**Fix:** 

Use get_viewport_rect() to clamp spawn positions.

## Fallback Plan (If Environment Fails)
**Scenario:** 
Random spawning logic fails.

**Action:** 
Run pre-scripted scene (debug spawner) that spawns items at fixed coordinates.

## Repeatability Checklist
- seed(12345) active in main.gd.
- Build exported to executable (e.g., game.exe) for consistent performance testing. 
