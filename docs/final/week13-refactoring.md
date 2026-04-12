# Week 13 – Refactoring & Technical Debt Reduction

## Overview
This document outlines technical debt identified in the SpaceHunter project and the refactoring work performed to improve code quality, maintainability, and long-term scalability.

The goal is to make the system easier to evolve, debug, and defend during future development.

---

## Identified Technical Debt Areas

### 1. Large Unstructured `Main.gd` Script

#### Problem
The `Main.gd` file contains multiple responsibilities in a single script, including:
- Game state management (score, life, game over)
- Input handling (restart, admin mode)
- UI updates (score, life, dialogue)
- Gameplay logic (spawning drops, collision handling)
- Visual effects (camera shake, starfield, orb pulse)
- Messaging system (dialogue display)

This violates separation of concerns and creates:
- Difficult debugging and testing
- High risk of unintended side effects
- Reduced readability and maintainability

---

### 2. Repeated and Unstructured Logging (`print()` usage)

#### Problem
Debugging output is handled using scattered `print()` statements across gameplay logic, such as:

```
gdscript
print("Asteroid hit %d point, total points: %d" % [area.points, score])
```

Issues:

- No consistent format or structure
- No log levels (info, warning, error)
- Difficult to filter or trace issues
- Not suitable for scaling or debugging complex interactions

### What Changed

A centralized logging system ```(Logger.gd)``` was introduced:

- Implemented as a global autoload singleton
- Replaced ```print()``` statements with structured logging methods:
  - ```Logger.info()```
  - ```Logger.warning()```
  - ```Logger.error()```

### Before:
```
print("Energy orb +%d point, total points: %d" % [area.points, score])
```
### After:
```
Logger.info("Energy orb collected: +" + str(area.points), "Main.gd")
```

Additional improvements:

- Standardized log message format
- Added optional context (script name, event type)
- Prepared system for future enhancements (timestamps, filtering)

### Tests Added / Updated

- Updated test scripts to ensure logging changes did not break gameplay behavior
- Existing tests in:
```
/tests/test_game_rules.gd
```

Coverage includes:

- Score updates on orb collection
- Life reduction on missed objects

### PR References
PR Link # https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/330 - Minor cleanup in ```Main.gd``` for readability

