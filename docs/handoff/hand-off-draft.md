# Hand-Off Document (Final Draft)

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
- UI sound effects are triggered for interactions and feedback
- Audio is integrated using Godot’s built-in audio system

### UI Features
- Improved main menu interface
- Polished HUD displaying:
  - Score
  - Remaining attempts
- Clear visual feedback for gameplay events

### Core Controller
The main game loop is managed by `main.gd`, responsible for:
- Spawning energy objects and asteroids
- Tracking score and attempts
- Handling collisions and game state updates

The system follows Godot’s scene-based architecture:
- Player scene (spaceship)
- Falling objects (energy, asteroids)
- UI scenes (menu and HUD)
- Audio integrated within scene structure

---

## 2. Architecture Snapshot

### High-Level Structure
- `main.gd` (central controller)
- Player script (movement and input handling)
- Object scripts (falling logic and collision)
- UI scripts (HUD and menu updates)
- Audio nodes (background music + UI SFX)

### Design Notes
- Logic is currently centralized in `main.gd`
- Scene-based separation exists, but logic modularity can be improved
- Audio integration is layered into existing scenes without a dedicated manager

---

## 3. Stack Rationale

### Game Engine
- **Godot 4.6.1**
  - Lightweight and efficient for 2D games
  - Built-in physics and scene system
  - Rapid iteration and testing

### Programming Language
- **GDScript**
  - Native to Godot
  - Simple and tightly integrated with engine APIs

### Testing Framework
- **GUT (Godot Unit Test)**
  - Used for validating gameplay logic
  - Covers scoring, attempts, and interactions
  - Ensures regression safety

### Version Control & CI
- **Git + GitHub**
- **GitHub Actions**
  - Automated test execution
  - Current CI status: consistently passing

---

## 4. Deployment / Setup Summary

### Prerequisites
- Godot 4.6.1 installed

### Setup
1. Clone repository:
   https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2
2. Open Godot Engine
3. Import project (`SpaceHunter_game`)

### Running the Game
1. Open project in Godot
2. Run main scene
3. Use keyboard input:
   - Left / Right arrows to move

### Running Tests
1. Ensure GUT is in `/addons/gut`
2. Open GUT panel
3. Run all tests

### Build / Distribution
- Exported build available for **Windows platform**
- Can be distributed as a standalone executable

---

## 5. Known Issues and Constraints

### 1. Screen Scaling Issue
- When the game is maximized:
  - UI may not scale correctly
  - Player ship can move out of visible bounds
- Cause: viewport scaling not fully responsive

### 2. Centralized Game Logic
- `main.gd` contains a large portion of logic
- Reduces maintainability and scalability

### 3. Limited Advanced Testing
- Core gameplay is well-tested
- Edge cases and integration scenarios need expansion

### 4. Keyboard-Only Input
- No controller or mouse support
- Limits accessibility

---

## 6. Recommended Next Steps

### Architecture Improvements
- Refactor `main.gd` into smaller components:
  - GameManager
  - SpawnManager
  - ScoreManager
  - AudioManager

### UI & Responsiveness
- Implement proper screen scaling and anchors
- Ensure consistent layout across resolutions

### Testing Expansion
- Add integration tests for:
  - Multiple collisions
  - UI state transitions
- Improve regression coverage

### Gameplay Enhancements
- Improve difficulty scaling
- Fine-tune spawn rates and balancing

---

## 7. User / Admin Guidance

### Player Controls
- Move Left: Left Arrow Key or 'A'
- Move Right: Right Arrow Key or 'D'

### Gameplay Flow
1. Launch game
2. Start from main menu
3. Collect energy objects to increase score
4. Avoid asteroids
5. Game ends when attempts reach zero

### Admin / Developer Notes
- Modify gameplay via `main.gd`
- Adjust spawn rates and difficulty parameters directly in scripts
- Audio settings managed within scene nodes
- Tests can be executed through GUT panel

---

## Summary

The project is a fully functional 2D arcade game with stable gameplay, integrated audio, polished UI, and consistent automated testing. A Windows build is available for distribution.

While the system is feature-complete for its scope, improvements in modular architecture, UI responsiveness, and expanded testing will further strengthen maintainability and scalability heading into final submission.


