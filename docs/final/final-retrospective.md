# Final Retrospective

## 1. What the team did well

The team successfully delivered a complete and playable 2D arcade-style game with a full gameplay loop, UI system, audio integration, and automated testing.

Key strengths included:
- Successful implementation of core gameplay systems (spawning, collision, scoring, and game state management)
- Early integration of **GUT testing**, enabling regression testing during development
- Adoption of **GitHub Actions CI/CD**, ensuring automated validation of builds and tests
- Successful migration from **Godot 3.6 to 4.6.1** to support stable testing and tooling compatibility
- Clear scene-based architecture separating player, objects, UI, and audio components

Despite constraints, the final system is stable, functional, and ready for deployment.

---

## 2. What the team would change earlier next time

Several improvements would be made if restarting the project:
- Introduce **modular architecture earlier**, rather than centralizing logic in `main.gd`
- Establish **CI/CD and testing infrastructure in the first development phase**
- Define UI scaling and responsiveness requirements earlier to avoid late-stage adjustments
- Finalize engine version and tooling compatibility at project kickoff to avoid migration overhead
- Enforce clearer early alignment between individual contributions and system architecture

Earlier structure and alignment would have reduced rework and improved maintainability.

---

## 3. Most valuable engineering practice adopted

The most valuable engineering practice was the adoption of **automated testing (GUT) combined with CI/CD via GitHub Actions**.

This provided:
- Continuous validation of gameplay logic
- Early detection of regressions
- Increased confidence during feature integration
- A more professional, industry-aligned development workflow

This significantly improved system stability during later development stages.

---

## 4. Most costly mistake or rework point

The most costly rework point was the **engine migration from Godot 3.6 to 4.6.1**, required due to incompatibility between GUT and the original engine version. This resulted in:
- Rework of project configuration and scripts
- Delay in stabilizing the testing pipeline
- Additional effort spent ensuring compatibility with the new engine version

A secondary issue was **early over-centralization of logic in `main.gd`**, which improved development speed initially but reduced modularity and will require refactoring for long-term scalability.

---

## 5. How the project improved from proposal to final release

The project evolved significantly from the initial proposal:
- Core gameplay loop was fully implemented and stabilized
- Testing and CI/CD systems were added beyond original scope
- UI and audio systems were refined during later development stages
- Overall stability and polish improved substantially toward final release

However, the final architecture still reflects early-stage design simplifications made to prioritize delivery.

---

## 6. Team collaboration and execution reality

The project was developed by a three-member team; however, contribution was uneven across the semester.

- Two members consistently contributed to core gameplay, integration, testing, and final system assembly
- One member contributed during the early phase (Weeks 1–4), producing general work that did not fully align with the evolving system architecture
- After Week 4, no meaningful contributions were made despite multiple reminders and attempts to reassign tasks

As a result, workload redistribution was necessary to ensure project completion and maintain delivery timelines. The final system was completed and stabilized by active contributors.

---

## Summary

The project successfully delivers a functional, tested, and deployable 2D game system with CI/CD integration and a complete gameplay loop. While technical debt exists due to early architectural decisions and uneven team contribution, the final outcome demonstrates strong engineering execution under real-world constraints.

Key takeaways include the importance of early alignment on architecture, early adoption of testing/CI practices, and consistent contribution across all team members.
