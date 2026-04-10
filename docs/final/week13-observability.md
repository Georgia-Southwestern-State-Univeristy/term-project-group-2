# Week 13 – Observability + Support Visibility

## Overview
This document outlines improvements made to enhance observability and support visibility in our Godot 4.6.2 game project. These changes make internal game state, errors, and system behavior more visible to developers and testers, making it easier to debug gameplay issues, monitor runtime behavior, and support future development.

---

## 1. Centralized Debug Logging System

### Description
Implemented a centralized logging utility script (e.g., `Logger.gd`) to standardize debug output across the game.

### Issue / Blind Spot
Previously, debugging relied on scattered `print()` statements across scripts, making it difficult to trace issues or filter important information.

### Where It Applies
All GDScript files (player logic, enemy behavior, game manager, UI scripts)

### Improvement Details
- Created a global logging script (autoload singleton)
- Added log levels:
  - INFO
  - WARNING
  - ERROR
- Included contextual information:
  - Scene name
  - Function name
  - Timestamp (optional)

**Example:**
```gdscript
Logger.info("Player spawned", "Player.gd")
```
### Before
- Random print() statements
- No structure or filtering
- Hard to debug complex interactions

### After
- Structured, consistent logs
- Easier debugging and tracing
- Cleaner output in Godot console

### Benefit to Maintainers

Future developers can quickly understand system behavior and locate issues without digging through multiple scripts.

### PR Reference
PR #12 – Centralized Logging System

## 2. Improved Error Handling and Fallback UI
### Description

Added better error handling and user feedback in UI scenes to handle failures gracefully.

### Issue / Blind Spot

Failures such as missing assets or failed scene loads caused silent errors or crashes with no feedback to the player or developer.

### Where It Applies

UI scenes, scene transitions, asset loading

### Improvement Details
Added checks before loading scenes/resources:
```
if ResourceLoader.exists(path):
    var scene = load(path)
else:
    Logger.error("Scene not found: " + path)
```
Added fallback UI:
Display error message on screen
Retry button for failed actions

### Before
- Game could crash or freeze
- No clear indication of what went wrong

### After
- Graceful handling of errors
- Clear feedback to user/developer
- Reduced crashes

### Benefit to Maintainers

Makes bugs easier to reproduce and diagnose, especially during testing or demos.

### PR Reference
PR #13 – Error Handling + Fallback UI
 
## 3. Startup Validation (Configuration Checks)
### Description

Added validation checks when the game starts to ensure required resources, UI nodes, and input mappings are available and correctly configured.

### Issue / Blind Spot

Missing assets, unassigned scenes, or misconfigured inputs caused runtime failures that were difficult to trace and often appeared later during gameplay.

### Where It Applies

Main scene `(Main.gd)`, especially during `_ready()` initialization.

### Improvement Details

Validation logic was added to ensure:

- Required scenes (`GoodDrop`, `BadDrop`) are assigned
- UI nodes (score, life, dialogue box) exist
- Input mappings are defined

Example (based on `Main.gd`):
```
func _ready():
    # Input validation
    assert(InputMap.has_action("restart"), "Missing input: restart")
    assert(InputMap.has_action("ui_accept"), "Missing input: ui_accept")

    # Scene validation
    assert(GoodDrop != null, "GoodDrop scene is not assigned")
    assert(BadDrop != null, "BadDrop scene is not assigned")

    # Node validation
    assert(has_node("Menu/Score"), "Missing node: Menu/Score")
    assert(has_node("Menu/Life"), "Missing node: Menu/Life")
    assert(has_node("Camera2D"), "Missing node: Camera2D")
    assert(has_node("UILayer/DialogueBox"), "Missing DialogueBox UI")

    # Existing initialization
    $Menu/Score.text = "Score: 0"
    $Menu/Life.text = "Attempts: 5"
```
### Observability Impact

These checks surface configuration problems immediately at startup, making them visible to developers and testers instead of failing silently during gameplay.

### Before
- Errors occurred later during gameplay
- Hard to trace root cause
- Silent misconfigurations

### After
- Immediate detection of issues at startup
- Clear, actionable error messages
- Faster debugging and testing

### Benefit to Maintainers
- Prevents hidden initialization bugs
- Makes the project safer to modify or extend
- Reduces debugging time and onboarding effort

### PR Reference
PR #14 – Startup Validation Checks

## 4. Debug Overlay / In-Game Diagnostics
### Description

Added an optional debug overlay and runtime diagnostics tools to monitor game behavior in real time.

### Issue / Blind Spot

There was no easy way to observe live game state (FPS, score changes, player feedback, system state) during gameplay without pausing or modifying code.

### Where It Applies

In-game UI and `Main.gd` runtime systems

### Improvement Details
- Display:
  - FPS
  - Score and life updates
  - Player feedback messages (dialogue system)
- Runtime diagnostics already present in `Main.gd`:
  - Camera shake on damage (`start_shake`)
  - Visual feedback (orb pulse)
  - Message system (`show_message`)
  - Admin/debug mode toggle (Ctrl + Shift + Enter)

### Example:
```
$Label.text = "FPS: " + str(Engine.get_frames_per_second())
```
### Before
- Needed to pause or inspect manually
- Limited runtime visibility
- No real-time feedback system

### After
- Real-time diagnostics and feedback
- Easier tracking of gameplay events
- Built-in debug/admin controls

### Benefit to Maintainers

Helps developers quickly understand game behavior, reproduce issues, and test features without repeatedly modifying code.

### PR Reference
PR #15 – Debug Overlay + Diagnostics
