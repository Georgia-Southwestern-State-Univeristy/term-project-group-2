# Hand-Off Document (Draft)

## 1. System Overview

This project is a 2D arcade-style game built using Godot 4.6.1. The player controls a spaceship that moves horizontally to collect falling energy objects while avoiding asteroids.

Core gameplay mechanics:
- The spaceship can move left and right
- Energy objects fall from the top of the screen:
  - Catching energy increases the score
  - Missing energy reduces attempts (lives)
- Asteroids also fall:
  - Colliding with asteroids decreases score
- The player has a limited number of attempts (lives)
- The game ends when all attempts are exhausted

The main game loop and logic are managed through `main.gd`, which handles:
- Spawning falling objects (energy and asteroids)
- Tracking score and attempts
- Handling collisions and game state updates

The system uses Godot’s scene-based architecture, with separate scenes/scripts for:
- Player (spaceship)
- Falling objects (energy, asteroids)
- UI (score and attempts display)

---

## 2. Stack and Tool Choices

### Game Engine
- Godot 4.6.1
  - Used for its built-in 2D engine, physics system, and scene management
  - Enables rapid development using a node-based structure

### Programming Language
- GDScript
  - Native to Godot
  - Used for implementing gameplay logic, UI updates, and object behavior

### Testing Framework
- GUT (Godot Unit Test)
  - Used to implement automated tests
  - Covers gameplay logic such as scoring, attempts, and object interactions
  - Helps prevent regressions in core mechanics

### Version Control
- Git + GitHub
  - Used for collaboration and version tracking

### CI (Continuous Integration)
- GitHub Actions 
  - Runs automated tests to ensure code stability

---

## 3. Setup / Run Summary

### Prerequisites
- Install Godot 4.6.1

### Setup Instructions
1. Clone the repository: https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2
2. Open Godot Engine
3. Click “Import”
4. Select the project folder "SpaceHunter_game"

### Running the Game
1. Open the project in Godot
2. Run the main scene (linked to `main.gd`)
3. Use keyboard input to move the spaceship left/right

### Running Tests (GUT)
1. Ensure GUT is available under `addons/gut`
2. Open the GUT panel in Godot
3. Run all tests or selected test scripts

---

## 4. Known Weaknesses / Technical Debt

### 1. Limited Test Coverage
- Current tests focus on core mechanics (score, attempts)
- Some gameplay scenarios (e.g., multiple simultaneous collisions) are not fully tested

### 2. Centralized Logic in `main.gd`
- A large portion of game logic is handled in a single script
- This makes the code harder to maintain and extend

### 3. Basic Collision Handling
- Collision effects (score/attempt changes) are simple
- Edge cases (e.g., overlapping collisions) may not be fully handled

### 4. Minimal Error Handling
- Missing assets or invalid scene references may not always be handled gracefully
- Logging and debugging tools are basic

### 5. Gameplay Balancing
- Spawn rates and difficulty scaling are not fully tuned
- Game progression may feel inconsistent

---

## Summary

This project implements a functional 2D game with core mechanics including movement, scoring, and collision-based interactions. The system is built around Godot’s scene architecture and uses `main.gd` as the central controller.

While the game is playable and test coverage has been introduced using GUT, future improvements should focus on modularizing the code, increasing test coverage, and enhancing observability and gameplay experience.
