# Sprint Retrospective

## What Went Well

### Architecture enabled safe iteration and controlled change
The system design demonstrated strong separation of concerns, allowing the team to evolve functionality without introducing regressions. Core gameplay logic was decomposed into focused, single-responsibility handlers (e.g., `_on_platform_area_entered`, `_on_catcher_area_entered`, `_on_MessengerTimer_timeout`).

State control via a centralized `game_over` flag provided a clear execution boundary across systems, reducing ambiguity and preventing inconsistent state transitions. This made both debugging and feature extension predictable.

### Migration was executed with containment and discipline
The transition to Godot 4.6.1 was handled incrementally, with breaking API changes isolated and resolved systematically (`yield → await`, signal updates, node changes).

Because gameplay logic was decoupled from engine-specific implementations, migration did not introduce cross-system regressions. This validates the architectural decision to isolate game rules from engine behavior.

### Automated testing improved correctness and confidence
The introduction of GUT tests established a baseline for validating core gameplay rules. Tests covering key logic paths (`energy_catch`, `asteroid_hit`, `check_game_over`) successfully identified a scoring defect that would likely have persisted under manual testing.

This demonstrates effective use of tests to enforce correctness of core mechanics rather than relying on visual verification.

### CI/CD pipeline enforces quality gates
The CI pipeline is not just functional—it enforces delivery discipline. Test failures block merges, and all changes flow through pull requests before integration into `main`.

Key pipeline improvements (e.g., correct project path, asset import step before test execution) ensure deterministic execution. This establishes CI as a gatekeeper for code quality, not just a diagnostic tool.

## What Slowed Team Progress

### Binary asset handling was not enforced at the process level
A `.tscn` scene file corruption exposed a gap in repository configuration and team workflow. Treating scene files as mergeable text led to unresolved conflicts and full asset reconstruction.

This was a preventable process failure rather than a technical limitation.

Action taken: move to CLI-based Git workflow and recognition of the need for enforced `.gitattributes`.

### Engine behavior changes were not validated early
The migration underestimated behavioral differences in physics (e.g., gravity defaults, `linear_velocity`). Assumptions of parity between versions delayed root cause identification.

The eventual shift to deterministic movement (`position.y += speed * delta`) improved system predictability and testability, but earlier validation of engine-level changes would have reduced iteration time.

### Lack of defensive checks in rendering logic
Spawn boundary logic relied on deprecated properties and introduced silent failure (`half_w = 16.0`). The system lacked assertions or validation to catch out-of-bounds spawning early.

This highlights the need for stronger guardrails around visual and positional correctness.

### Scope expansion reduced delivery focus during stabilization
Introducing new features during the beta phase increased system complexity and testing surface area. While implementations were clean, they diluted focus from stabilization and increased integration risk late in the cycle.

This reflects a need for stricter scope control during critical delivery phases.

## Top 5 Key Lessons Learned

### 1. Decoupled architecture reduces upgrade and regression risk
Separating game rules from engine behavior enabled a controlled and low-risk migration.

### 2. CI-enforced workflows improve delivery reliability
Using PRs with mandatory CI pass before merge ensures that only validated changes reach `main`, significantly reducing integration risk.

### 3. Testing should focus on invariants and rules, not just flows
Validating core mechanics (scoring, state transitions) provides high value and catches non-obvious defects.

### 4. Repository configuration is part of engineering quality
Binary asset handling must be explicitly enforced to prevent avoidable rework.

### 5. Scope discipline is critical during late-stage development
Feature additions during stabilization phases introduce disproportionate risk relative to their value.

## Top 5 Priorities for Weeks 13–15

### 1. Enforce repository and asset handling rules

- Add `.gitattributes` (`*.tscn merge=binary`)
- Standardize merge and conflict resolution practices

### 2. Expand test coverage and depth

- Add edge case tests (simultaneous collisions, rapid state changes)
- Ensure critical gameplay paths are fully covered

### 3. Strengthen CI pipeline as a release gate

- Add automated `.exe` build step
- Validate build artifacts within CI (not manually)

### 4. Improve UI and runtime robustness

- Resolve layout inconsistencies
- Ensure correct behavior across window states (minimize/maximize)

### 5. Formalize release discipline

- Introduce a pre-release checklist (tests passing, clean logs, build success)
- Remove debug statements systematically before release
