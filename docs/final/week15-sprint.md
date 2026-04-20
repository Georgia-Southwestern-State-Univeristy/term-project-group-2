## Goal: - Deliver a stable, demo-ready release candidate with all critical issues resolved and validated through final QA.

### Backlog Items

**1. Final Regression QA Pass**

|Owner: QA Lead (Mario)| Priority: P1|

Acceptance Criteria:
- All core gameplay loops tested without blockers or crashes
- No high-severity bugs remain open
- Test report completed and shared with team
---
**2. Critical Bug Fixes (P0/P1 Only)**

|Owner: Tech Lead (Olga)|  Priority: - P0|

Acceptance Criteria:
- All P0 and P1 issues on the board are resolved and verified
- Fixes do not introduce new regressions
- Build passes without errors
---
**3. Remove Debug Output from Release Build**

|Owner: Olga| Priority: P0|

Acceptance Criteria:
- All print() statements removed from Main.gd
- No debug logs appear during normal gameplay
- Code reviewed to ensure no leftover debug hooks
---
**4. Enforce Non-Negative Score**

|Owner: Olga|  Priority: P0|

Acceptance Criteria:
- Score never drops below 0 during gameplay
- Fix applied in all deduction paths (Spawner.gd, Main.gd)
- Verified via test case (multiple asteroid hits)
---
**5. Implement Core Audio Feedback**

|Owner: Olga|  Priority: - P2|

Acceptance Criteria:
- Sound plays for: orb catch, asteroid hit, missed orb, and game over
- Audio nodes (AudioStreamPlayer) added and properly configured
- Sounds trigger reliably without overlap issues or silence bugs
---
**6. Final Scoreboard UI Polish**

|Owner: Olga|  Priority: - P1|

Acceptance Criteria:
- UI layout fits 1152×648 resolution without overlap or clipping
- Buttons (restart/exit) have clear visual hierarchy
- Font sizes and spacing are consistent and readable
---
**7. Final Integration & Playtest Verification**

|Owner: Entire Team|  Priority: P1|

Acceptance Criteria:
- All above fixes verified together in a full playthrough
- No regressions introduced by fixes
- Build deemed demo-ready by team consensus


Evidence to project board: - https://github.com/orgs/Georgia-Southwestern-State-Univeristy/projects/21
