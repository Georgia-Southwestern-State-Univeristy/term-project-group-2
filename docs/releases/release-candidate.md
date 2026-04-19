### SpaceHunter – Release Candidate
**Overview**

This document describes the **Release Candidate (RC)** version of SpaceHunter. This build represents a near-final state of the game, where all core systems are complete and stable.

The purpose of this release is to validate the full gameplay experience, ensure system stability, and finalize polish before the official v1.0 release.

Unlike the Beta, which focused on feature completeness and testing infrastructure, this RC focuses on refinement, performance, and production readiness.

---

**Release Information**

```
Tag: rc-v0.9
Release Date: April 18, 2026
Engine: Godot 4.6.2
Platform: Desktop (Windows via Godot)
```

**Release Page:**

https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/releases/tag/rc-v0.9
---
#### **Release Scope**

**Included Features**

All Beta features are retained, with the following improvements and completions:

**Core Gameplay (Stable)**
- Player-controlled platform movement (refined responsiveness)
- Falling objects system:
  - Energy orbs (score gain)
  - Asteroids (hazards)
- Score tracking and life system (fully stable)

**Gameplay Systems**

- Dynamic difficulty scaling (balanced and tuned)
- Reliable object spawning system
- Improved collision handling and feedback

**Game States (Finalized)**

- Playing state
- Game Over state
- Restart flow (fully stable, no state leakage)

**UI / UX (Improved)**

- Cleaner and more consistent HUD
- Improved Game Over screen
- Real-time updates for score and lives
- Clearer player feedback messaging

**Feedback & Effects**

- Visual pulse effects (more consistent)
- Dialogue/message system (cleaned and stabilized)

**Code & Architecture:**
- Refactoring of Mian.gd into modulat components
- Improved separation of conerns
- Cleaner scene structure

**Observability and Debugging**
- Structured logging system (retained and stabilized)
- Startup validation checks
- Debug/admin mode (unchanged, stable)
---

#### Major differences from beta

**Compared to v0.1-beta, this release includes:**

**New Features**
- Refactored architecture (reduced reliance on Main.gd)

**Improvements**
- Noticeably improved performance and frame stability
- More responsive player controls
- Better fiddiculty balancing
- UI polish and consistency improvements

**Stability**
- Fixes for gameplay-breaking bugs found in beta
- More reliable state transitions
- Reduced runtime errors and edge-case failures

---

#### Core workflows (Expected stable)

The following workflows should function without failure:

**Game Flow**

1. Launch game
2. Enter gameplay from main scene
3. Play continuously with increasing difficulty
4. Reach Game Over
5. Restart game without issues

**Gameplay Loop**
- Objects spawn continuously and correctly
- Score increases when collecting orbs
- Lives decrease on missed or harmful events
- Difficulty scales with score

**System Behavior**
- UI updates in real time
- Audio triggers correctly on events
- No crashes during normal gameplay sessions

**Known Risks / Remaining Issues**
While the game is stable, the following risks remain:
- Minor UI alignment issues on certain resolutions
- Limited stress testing under extreme gameplay durations
- Some debug logs may still be overly verbose

These are non-blocking but should be reviewed before final release.

---
**Remaining Work (Week 15–16)**

**Critical Tasks**
- Fix any crashes or progression-blocking bugs
- Final performance optimization pass
- Validate stability across multiple playthroughs

**Polish**
- Final UI/UX refinements
- Improve visual feedback consistency
- Fine-tune audio levels and timing

**Testing & QA**
- Full gameplay test cycles
- Edge-case testing (rapid input, long sessions)
- Validate difficulty scaling consistency

**Release Preparation**
- Final export builds from Godot 4.6.2
- Prepare v1.0 release notes
- Clean and finalize documentation
- Create final release tag: v1.0

---
#### Release Criteria for v1.0

The game will be considered ready for final release when:

- No critical or high-severity bugs remain
- All gameplay systems function reliably
- Performance is stable across target platforms
- Player experience is polished and consistent

---
