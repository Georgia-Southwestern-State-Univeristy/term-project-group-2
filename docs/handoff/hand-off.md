# Hand-Off Document (Final)

## Quick Start (2-Minute Setup)

For a rapid understanding and execution of the system:

1. **Clone the repository**

  https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2

2. **Open in Godot 4.6.1**
- Import project: `SpaceHunter_game`

3. **Run the Game**
- Open the main scene
- Press "Run"

4. **Controls**
- Move Left: ← or A  
- Move Right: → or D  

5. **Run Tests**
- Open GUT panel
- Run all tests

6. **Key File to Review**
- `main.gd` → central gameplay logic

---

## 1. System Overview

This project is a 2D arcade-style game built using Godot 4.6.1. The player controls a spaceship that moves horizontally to collect falling energy objects while avoiding asteroids.

### Core Gameplay Mechanics
- The spaceship moves left and right via keyboard input
- Energy objects fall from the top:
  - Catching energy increases score
  - Missing energy reduces attempts (lives)
- Asteroids fall as hazards:
  - Collisions decrease score
- The player has a limited number of attempts
- The game ends when all attempts are exhausted

### Audio Features
- Background music plays during gameplay
- UI sound effects provide interaction feedback
- Audio is implemented using Godot’s built-in audio system

### UI Features
- Main menu interface for starting the game
- HUD displaying:
  - Score
  - Remaining attempts
- Visual feedback for gameplay events

### Core Controller
The main game loop is managed by `main.gd`, responsible for:
- Spawning energy objects and asteroids
- Tracking score and attempts
- Handling collisions
- Managing game state

### Scene Structure
- Player scene (spaceship)
- Falling objects (energy, asteroids)
- UI scenes (menu and HUD)
- Audio integrated within scenes

---

## 2. Architecture Snapshot

### High-Level Structure
- `main.gd` — central controller
- Player script — input and movement
- Object scripts — falling behavior and collision handling
- UI scripts — HUD and menu updates
- Audio nodes — background music and sound effects

### Design Notes
- Core logic is centralized in `main.gd`
- Scene-based separation is implemented
- Audio is embedded within scenes

---

## 3. Tech Stack and Rationale

### Game Engine
- **Godot 4.6.1**
- Efficient for 2D development
- Built-in scene system and physics
- Fast iteration cycle

### Programming Language
- **GDScript**
- Native to Godot
- Simple and tightly integrated

### Testing Framework
- **GUT (Godot Unit Test)**
- Validates gameplay logic
- Provides regression safety

### Version Control & CI
- **Git + GitHub**
- **GitHub Actions**
- Automated test execution
- CI pipeline consistently passing

---

## 4. Setup / Deployment Summary

### Prerequisites
- Godot 4.6.1 installed

### Setup
1. Clone repository:
https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2
2. Open Godot Engine
3. Import project (`SpaceHunter_game`)

### Running the Game
1. Open project in Godot
2. Run the main scene

### Controls
- Move Left: Left Arrow or A
- Move Right: Right Arrow or D

### Running Tests
1. Ensure GUT is located in `/addons/gut`
2. Open GUT panel in Godot
3. Run all tests

### Build / Distribution
- Windows executable available
- Can be distributed as a standalone application

---

## 5. Known Issues and Constraints

### Screen Scaling
- UI does not scale correctly when the window is maximized
- Player may move partially outside visible bounds

### Centralized Logic
- `main.gd` contains most gameplay logic
- Limits scalability and maintainability

### Testing Scope
- Core mechanics are covered
- Limited edge case and integration testing

### Input Limitations
- Keyboard-only input
- No controller or mouse support

---

## 6. User / Admin Guidance

### Player Controls
- Move Left: Left Arrow Key or 'A'
- Move Right: Right Arrow Key or 'D'

### Gameplay Flow
1. Start game from main menu
2. Collect energy objects to increase score
3. Avoid asteroids
4. Game ends when attempts reach zero

### Developer Guidance
- Core logic: `main.gd`
- Gameplay tuning:
  - Adjust spawn rates and difficulty in scripts
- UI updates:
  - Modify HUD and menu scenes
- Audio:
  - Controlled via scene nodes
- Testing:
  - Located in `/tests/`
  - Run via GUT panel

---

## 7. Maintenance Notes

### Codebase Characteristics
- High coupling in `main.gd`
- Limited modular separation of responsibilities
- Audio is not abstracted into a standalone system

### Safe Modification Areas
- UI layout and visuals
- Audio assets and triggers
- Gameplay tuning parameters (spawn rates, speeds)

### High-Risk Areas
- Collision handling logic
- Game state transitions
- Core loop inside `main.gd`

### Testing Expectations
- Run all GUT tests after any change
- Add new tests when modifying gameplay logic
- Ensure CI pipeline remains passing before merging changes

### CI/CD
- GitHub Actions pipeline executes tests automatically
- Any failing test should block changes from being considered stable

---

## 8. Recommended Next Steps

### Architecture Improvements
- Refactor `main.gd` into:
  - GameManager
  - SpawnManager
  - ScoreManager
  - AudioManager

### UI & Responsiveness
- Implement responsive scaling (anchors/containers)
- Support multiple screen resolutions

### Testing Expansion
- Add integration tests:
- Multiple simultaneous collisions
- UI state transitions
- Improve regression coverage

### Gameplay Enhancements
- Introduce difficulty scaling
- Improve spawn balancing

### Input & Accessibility
- Add controller support
- Enable configurable key bindings

---

## Summary

This system is a complete and stable 2D arcade game with implemented gameplay, UI, audio, and automated testing. It is ready for execution and extension without dependency on the original development team.

Future work should prioritize modularization, improved responsiveness, and expanded testing to ensure long-term maintainability.
