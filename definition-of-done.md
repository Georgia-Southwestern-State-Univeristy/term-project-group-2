# Definition of Done

A feature is considered DONE when all items below are completed:

## Git / Workflow
Branching: Work is completed on a short-lived feature branch. No direct commits to main
Pull Request: PR is opened early for visibility. PR is not opened only at the final moment

Code Review: At least 1 teammate reviews the PR. Feedback is addressed before merge

CI / Automation: All CI checks pass. Build succeeds

Code Standards: Code follows team naming and formatting rules. Code is readable and commented if needed

Testing: New functionality includes starter tests

Documentation: Documentation is updated if behavior changes. README or feature docs reflect updates

## Code Quality (Godot)
Code follows team standards (naming, formatting, folder structure)
No debug prints
No unexpcted numbers in speed, spawn rate, damage
Timer are used cleanly, no double-spawn bugs

## Gameplay Behavior and Performance
Feature works at the **target resolution(s)** (e.g., 1024×600) without UI going off-screen
Inputs are mapped via **Input Map** (not hard-coded keys)
Game flow is correct (start → play → game over → restart)
Difficulty/spawn changes feel reasonable
No obvious bugs like bad movement, broken collisions, inconsistent speed
No memory leaks
FPS is stable

## Testing
Expected results
No bugs or issues
If any bugs are noticed needs to be documented in feature docs updates


## Documentation and Build
Feature works in an exported build
Docs updated if behavior changes (README, controls, gameplay rules)

