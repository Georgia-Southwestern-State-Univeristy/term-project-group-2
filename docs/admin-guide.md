## SpaceHunter – Admin & Maintenance Guide
### Overview

This guide is intended for **developers, testers, or maintainers** responsible for running, debugging, and deploying SpaceHunter.

It is written for individuals who are **not part of the original development team.**
---

### Environment Overview
- Engine: Godot 4.6.2
- Platform: Windows (primary target)
- Language: GDScript
- Entry Point: ``` project.godot ```
---
### Setup Instructions
#### Clone Repository
```
git clone https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2
cd SpaceHunter_game
```
#### Open Project
- Launch Godot 4.6.2
- Click Import
- Select: ``` project.godot ```
- Open the project

#### Run Project

- Press F5
- The game opens to the **main screen**
- Click **Play** to start

---

### Build / Deployment (Windows)
#### Export Executable
- Open the project in Godot
- Navigate to Project → Export
- Select Windows Desktop
- Click Export Project
- Output:
  - ```.exe ```file
  - required data files

#### Configuration Notes
- No external configuration files are required
- No runtime settings system is implemented
- Game behavior is defined entirely in code

---
### Debug / Admin Features
#### Enable Debug Mode

- Press:
  ``` Ctrl + Shift + Enter```
- Enables:
  - Debug messaging
  - Additional runtime diagnostics

#### Common Operations

**Start Game**
- Launch application
- Click **Play** on main screen

**Restart Game**
- Press **Enter** after Game Over
- Or restart using Godot (F5)

**Reset Game State**
- Game state resets automatically
- No persistent data to clear

**Rebuild Project**
- Export again using Godot
- Replace previous build files

#### Logs and Diagnostics
**Logging System**

- Managed via:
  ```` Logger.gd ````

**Where to View Logs**

- **Godot Output Console** (primary)
- In-game debug messages (if enabled)

**What to Monitor**
- Startup validation checks
- Runtime warnings/errors
- Object spawning system
- State transitions:
  - Main screen → gameplay
  - Gameplay → game over
  - Restart flow

---
### Testing

**Test Location**
```/tests/```

**Framework**

- GUT (Godot Unit Testing)

**CI Pipeline**
- GitHub Actions:
  ``` .github/workflows/ci.yml ```
- Performs:
  - Code validation
  - Automated checks on pull requests

---
### Common Issues & Recovery

**Game Does Not Start**
- Verify Godot version is 4.6.2
- Check for missing/corrupted files
- Review console output


**Game Crashes or Freezes**
- Inspect logs in console
- Restart application
- Review recent changes

**Objects Not Spawning**
- Check runtime errors
- Verify initialization logic

**Performance Issues**
- Use exported build instead of editor
- Disable debug mode if active

**Maintenance Guidelines**
- Maintain modular structure (avoid returning logic to ``` Main.gd ```)
- Keep logging consistent and structured
- After RC, only implement:
  - Critical bug fixes
  - Performance improvements
  - Minor polish

---
#### Notes
- The game is session-based:
  - No persistent storage
  - No backend services
  - All functionality runs locally
