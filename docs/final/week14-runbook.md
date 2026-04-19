## SpaceHunter – Deployment & Runbook Verification
### Overview

This document verifies that the **Release Candidate** (```rc-v0.9```) of SpaceHunter can be successfully deployed and run by following the provided documentation.

The goal is to ensure that:

- The system can be started using only documented steps
- No hidden knowledge is required
- The game behaves as expected after launch

This serves as proof that the project is  **ready for final release validation.**

---
### Environment & Requirements
#### Target Platform
- Operating System: Windows 10 or later
- Engine: Godot 4.6.2 (only required for development mode, not for running the build)

#### Deployment Artifact
The Release Candidate is distributed as:
- ```.exe``` (executable)
- ```.pck``` (game data file)

Both files must be present in the same directory for the game to run correctly.

#### Exact Startup Steps

The following steps were used to verify deployment:

**1. Download Release**
- Download ```rc-v0.9``` from the GitHub Releases page
- Extract the  ```.zip``` archive

**2. Verify Files**
Ensure the following files exist in the same folder:
- ```SpaceHunter.exe```
- ```SpaceHunter.pck```

**3. Launch Game**
- Double-click ``` SpaceHunter.exe ```

**4. Start Gameplay**
- Main screen appears with instructions
- Click the **Play** button
- Gameplay begins


--- 

### Database / Migration / Seeding
Not applicable.
- The system does not use a database
- No migration or seeding steps are required
- The game is fully local and session-based

---

### System Health Verification

After startup, the following checks were performed to confirm the system is functioning correctly:

**Startup Validation**
- Game launches without errors
- Main screen displays correctly
- Instructions are visible

**Gameplay Validation**

After clicking **Play**:

- Player can move left and right using arrow keys
- Objects (energy orbs and asteroids) spawn continuously
- Catching an orb:
  - Score increases
  - Visual feedback triggers
- Missing an orb:
  - Player attempts decrease
- Catching an asteroid:
  - Player score decreases
- Missing an asteroid:
  - No negative effect on attempts and score
- Negative events trigger feedback

**Game Loop Validation**
- Difficulty increases over time (faster object speed)
- Game Over occurs when attempts reach zero
- Final score is displayed
- Pressing **Enter** successfully restarts the game

---

### Verification Evidence
The runbook steps were tested on a **clean Windows environment** with no prior project setup.

**Test Conditions**
- Fresh system (no development environment required)
- Only the exported ```.exe``` and ```.pck``` files were used
- No access to source code or internal tools

**Result**
- The game launched successfully
- All documented steps worked as written
- Core gameplay loop functioned correctly
- No additional configuration or setup was required

**Issues Encountered**

No issues were encountered during deployment or execution.
- No missing dependencies
- No runtime errors
- No unclear steps in the documentation


**Corrections Made**

No corrections to the system or documentation were required after testing.

The existing documentation was sufficient to:

- Locate and run the build
- Understand how to start gameplay
- Verify system functionality

---

#### Validation Against Requirements

This release candidate meets the runbook requirements:

- Fully runnable using documented steps
- No hidden setup knowledge required
- Clear startup and verification process
- Works on a clean system environment
- Produces expected gameplay behavior

---
#### Conclusion

The SpaceHunter Release Candidate (```rc-v0.9```) has been successfully validated through this runbook process.

The system:

- Deploys without issues
- Runs as expected
- Requires no undocumented setup

This confirms that the project is **ready for final release (v1.0)** from a deployment and usability standpoint.
