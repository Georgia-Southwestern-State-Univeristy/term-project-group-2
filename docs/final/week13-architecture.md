Game Architecture Documentation: (Godot 4.6.1) 2D Action Game. Project Name - SpaceHunter.

1\. System Overview

The game is a 2D action game developed in Godot 4.6.1. This is a single player game where player plays game to catch energy nodes while avoiding asteroids within a confined view-port. The architecture relies on Godot's Scene Tree structure, emphasizing loose coupling between game objects to ensure maintainability.

2\. Updated Architecture Diagram (Component Snapshot)

Main Scene root:

-   Player (`CharacterBody2D`): Controlled entity.
-   Spawner (`Node2D`): Manages asteroid/energy instantiation.
-   (`CanvasLayer`): Displays Score/Lives.
-   Background (`ParallaxBackground`): Visual environment.
-   TestRunner (`GUT` Scene): Active in debug/test builds.

3\. Key System Components and Responsibilities

-   Player (`CharacterBody2D`): Handles player movement via input handling and collision detection with asteroids (death) and energy (scoring).
-   Spawner (`Node2D`): Employs `Timers` to periodically instantiate asteroid and energy scenes at top-screen coordinates.
-   Item(`Area2D`): Base class for energy/asteroids handling movement logic (`velocity * delta`) and cleanup when exiting the screen.
-   Game Manager(`Node` - Autoload): Manages global game state, score tracking, and scene transitions.
-   Test Runner (`GUT`): Handles unit tests for collision logic and score updates.

4\. Changes Since Beta

-   Integration of GUT: Added GUT (Godot Unit Test) for unit testing core game logic, allowing for automated validation of scoring mechanics and collision detection.
-   Component Decentralization: Moved away from a single "MasterManager" to specialized `Spawner` and `Player` scripts, reducing `Game Manager` coupling.
-   Object Pooling: Implemented on `Spawner` for asteroid recycling to improve performance on lower-end devices.

5\. Remaining Architectural Risks or Constraints

-   Performance Scaling: Increased asteroid count might affect physics performance in Godot 4.6.1 if pooling is not fully utilized.
-   GUT Integration: Tests are currently focused on logic.
-   Resource Management: Ensuring all dynamic nodes are freed when the scene resets to prevent memory leaks.
