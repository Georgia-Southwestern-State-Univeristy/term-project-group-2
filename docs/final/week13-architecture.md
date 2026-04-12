# Architecture Snapshot – SpaceHunter

## Overview
This document provides a high-level view of the SpaceHunter system architecture, including core components, data flow, and supporting tools used during development.

The system is built using the Godot Engine and follows a modular, node-based architecture.

---

## Core Architecture Components

### 1. Player (User Input Layer)
- Input Device: **Keyboard**
- Controls:
  - Left / Right movement
  - Restart (Enter)
- Sends input signals to the game logic

---

### 2. Game Engine Layer (Godot)

**Technologies:**
- Godot 4.6.1
- GDScript

**Core Responsibilities:**
- Scene management (`Node2D`)
- Physics handling (collisions, movement)
- Rendering (2D graphics)
- Input processing

---

### 3. Game Logic Layer (`Main.gd` and Scripts)

Handles:
- Score and life management
- Object spawning (GoodDrop / BadDrop)
- Collision detection and outcomes
- Game state (playing, game over)
- Difficulty scaling (drop speed)

Key Systems:
- **Spawner System** → Generates falling objects  
- **Collision System** → Detects hits and misses  
- **Game State Manager** → Controls score, lives, restart  
- **UI Update System** → Updates score/life display  

---

### 4. UI Layer

Displays:
- Score
- Remaining lives
- Dialogue/messages
- Game over screen

Provides feedback through:
- Text updates
- Visual effects (camera shake, pulse)
- Message system

---

### 5. Rendering & Physics APIs

- **Graphics API**
  - 2D rendering via Godot engine
  - GPU-accelerated (OpenGL / Vulkan depending on platform)

- **Physics API**
  - Collision detection using `Area2D` and `CollisionShape2D`
  - Event-driven interaction between objects

---

### 6. Testing Layer (GUT)

**Framework:** GUT (Godot Unit Test)

Purpose:
- Validate core gameplay logic
- Ensure stability during refactoring

Test Coverage:
- Score updates (happy path)
- Life reduction (failure path)
- Boundary conditions

Location:
``` id="b3sm1c"
/tests/
```

### 7. CI / Automation Layer

- GitHub Actions (.github/workflows/ci.yml)
- Runs checks on pull requests
- Helps maintain code quality and consistency

## Data Flow (Simplified)

```
[Player Input (Keyboard)]
            ↓
[Godot Input System]
            ↓
[Game Logic (Main.gd)]
   ├─ Spawner System
   ├─ Collision Detection
   ├─ Game State Update
            ↓
[UI Layer Updates]
            ↓
[Rendering Engine → Display Output]
```

## Gameplay Flow

  1. Player moves platform using keyboard
  2. Spawner generates falling objects
  3. Collision system detects:
      - Catch → increase score
      - Miss → reduce life
   5. Game state updates (score/life)
   6. UI reflects changes in real time
   7. Game ends when life reaches zero

## System Characteristics
- Single Player System
- Event-driven architecture
- Node-based composition (Godot scenes)
- Real-time feedback loop
- Modular but partially centralized (Main.gd)

## Known Limitations
- Core logic is centralized in Main.gd (tight coupling)
- Limited separation between UI and game logic
- No external analytics or backend integration

## Future Improvements
- Split Main.gd into smaller components:
  - GameManager
  - UIManager
  - Spawner
- Expand test coverage with GUT
- Add structured logging (Logger system)
- Improve observability and debugging tools
