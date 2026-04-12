## Sprint goal: Adding regression and reliability test to enhance  product reliability by Sunday

## Committed items: 5–8 backlog items maximum
### 1. Add edge case test for gameplay logic - https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/299
#### Improve robustness of rule validation
- Actions:
  - Add tests for:
    - Simultaneous collisions
    - Rapid repeated inputs/events
    - Boundary conditions (score = 0, attempts = 0)
- Acceptance Criteria:
  - Tests fail when logic is intentionally broken
- Tests pass in CI pipeline - https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/actions/runs/24242877148/job/70781589821
- Definition of Done:
  - Coverage increased for core gameplay modules
  - No flaky tests

### 2. Add binary handling for scene files - https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/322
#### Configure Git to prevent merge conflicts in .tscn files
- Actions:
  - Add *.tscn merge=binary to .gitattributes
  - Commit and validate behavior in a test branch
- Acceptance Criteria:
  - Git no longer attempts line-based merges on .tscn files
  - Conflicts require explicit resolution (no silent corruption)
- Definition of Done:
  - Merged to main via PR
  - Verified by simulating a conflict

### 3. Define stress test scenarios and using ADMIN mode - https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/298 , https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/299
#### Identify edge cases for performance validation. Validate performance under extreme conditions
- Actions:
  - Use ADMIN mode to simulate high score states
  - Observe FPS, input lag, and stability
- Define scenarios:
  - Max drop speed (~400.0)
  - Max spawn rate
  - Extended runtime sessions
- Acceptance Criteria:
  - Test scenarios documented and reproducible
  - No major frame drops or crashes
- Definition of Done:
  - Shared with team
  - Results documented

### 4. Remove debug statements - https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/320
#### Ensure clean production output
- Actions:
  - Remove or gate all debug print statements
- Acceptance Criteria:
  - No debug logs in release build
- Definition of Done:
  - Verified via code search and runtime check
    
### 5. Collect and document feature request
#### Capture all proposed features from the game lead in a structured format. Evaluate each feature against architecture and risk
- Actions:
  - Schedule review session with game lead
  - Systems touched (UI, gameplay, physics, input)
  - Coupling risk (isolated vs cross-system)
- Acceptance Criteria:
  - All requested features are documented in backlog
  - No feature proceeds without written definition
- Definition of Done:
  - Feature list reviewed and agreed by team

## Evidence: link to the Project Board sprint view
- https://github.com/orgs/Georgia-Southwestern-State-Univeristy/projects/21
