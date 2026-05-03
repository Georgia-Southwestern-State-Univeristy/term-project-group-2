# Final Defense

## 1. Why did your team choose this architecture and stack?

The team selected **Godot 4.6.1 with GDScript** due to its lightweight nature, fast iteration cycle, and strong support for 2D game development. The scene-based architecture allowed rapid prototyping and clear separation of components.

Originally, the project was prototyped in Godot 3.6; however, the team migrated to Godot 4.6.1 due to **incompatibilities with GUT (Godot Unit Test) integration in 3.6**. This migration ensured stable automated testing and CI pipeline support.

A centralized controller (`main.gd`) was used to simplify early development and ensure all core gameplay logic (spawning, scoring, collisions, and game state) could be implemented and debugged efficiently within a single control flow.

---

## 2. What were the most important technical trade-offs?

The primary trade-off was **simplicity vs. scalability**.

- Centralizing logic in `main.gd` made development faster and reduced coordination complexity
- However, this introduced tighter coupling and reduced modularity

Another trade-off was:
- **Embedded audio handling vs. dedicated audio system**
  - Faster to implement within scenes
  - Less flexible for future expansion

The team prioritized delivering a stable, complete system over building a highly modular architecture.

---

## 3. What is the system’s biggest current weakness?

The biggest weakness is the **centralized architecture in `main.gd`**, which:
- Limits maintainability
- Makes future feature expansion more difficult
- Increases risk when modifying core logic

A secondary weakness is **lack of responsive UI scaling**, which affects usability on different screen sizes.

---

## 4. What testing and CI evidence gives you confidence in the release?

The system includes **unit testing using GUT**, covering:
- Scoring logic
- Attempt (lives) handling
- Core gameplay interactions

Additionally:
- A **GitHub Actions CI pipeline** automatically runs tests on each change
- The pipeline has been consistently passing, indicating stability and no regression in core features

This combination provides confidence that the primary gameplay loop behaves as expected.

---

## 5. If another team inherited this project, what should they tackle first?

The first priority should be **refactoring the architecture** by breaking down `main.gd` into modular components:
- GameManager
- SpawnManager
- ScoreManager
- AudioManager

This will:
- Improve maintainability
- Reduce risk of future changes
- Enable easier feature expansion

The next priority should be:
- Fixing UI scaling for different resolutions
- Expanding test coverage to include integration scenarios

---

## Summary

The system was designed to prioritize simplicity, stability, and rapid development using Godot’s strengths. While the current implementation is fully functional and tested, future improvements should focus on modular architecture, scalability, and broader test coverage.
