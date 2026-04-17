Who is the User?

- Arcade Gamers:
  - Individuals looking for a quick, skill-based challenge.
- Beta Testers:
  - Users providing feedback on game-play feel, performance, and bug reporting.

Main Tasks

- Navigation:
  - Control the ship's movement in 2D space.
- Collection:
  - Gather energy orbs to increase your score/survival time.
- Evasion:
  - Avoid collisions with procedurally generated asteroids.
- Score Tracking:
  - Monitor your performance via the in-game HUD.

Step-by-Step Core Workflow

- Launch:
  - Open the executable or run the project via the Godot editor.
- Start Game:
  - Select "Start" from the Main Menu.
  - Press enter to start
- Game-play:
  - Use WASD or Arrow Keys to move the ship.
  - Navigate toward glowing Energy Orbs.
    - Missed energy Orbs results in decreased attempts
    - Will result in game over after exceeded number of attempts
  - Keep distance from brown/gray Asteroids.
    - Score is reduced when hit by an asteroid:
  - Game over:
    - Your final score is displayed.
    - Select "Retry" to start a new session.
    - Select "Exit" to quite the game.

Known Limitations & Constraints

- Beta Status:
  - May experience frame drops if a very high number of entities are on screen.
- Window Mode:
  - Resizing the window may affect UI scaling.
