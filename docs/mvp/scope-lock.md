# **Explicit non-goals** (what you will not build for MVP)

## **MVP User Stories**

As a **space pilot**, I want to **control** a spaceship using left and right key, so that I can **collect energy and avoid asteroids**, change my direction of travel.
    - Acceptance Criteria
1.	Left/Right: The player can movethe ship in left and right  direction using an input key.
2.	Visual effect: The ship moves left/right.

As a **player**, I want to **collect energy** from my spaceship, so that I can **get more score** and survive the game. 
    - Acceptance Criteria
1.	Input Trigger: Pressing left and right arrow key moves the space ship.
2.	Collision: When a space ship  hits an asteroid, score is reduced.
3.	Collision: When a space ship  hits anenergy, score is increased.

As a **player**, I want asteroids to **fall down** upon spawning, so that the game-play is **unpredictable and challenging**. 
    - Acceptance Criteria
1.	Randomized Initial Direction: When an asteroid spawns, it must be assigned a random position of movement.
2.	Constant Movement: Once initialized, the asteroid must maintain its speed and direction.

As a **player**, I want to **experience** when collecting energy and avoid astroids so that the game feels **challenging** and my survival depends on skillful navigation
    - Acceptance Criteria
1.	Life Reduction: Decrease the current life count by one immediately upon missing the energy.
2.	Score change: Increase the score count immediately catching the energy and decrease upon catching the asteroids.
3.	Visual Feedback: Provide a clear on-screen indicator when a life is lost and score is changed.
4.	Game Over Trigger: Automatically transition to the Game Over screen.

As a **player**, I want to **see my current score** on the main game screen, so that I **know how well I am doing** without navigating away from the game. 
    - Acceptance Criteria
1.	Visibility: The current score is displayed in a consistent, clearly visible location on the main player dashboard.
2.	Accuracy: The score displayed accurately reflects the total points earned from completed actions in real-time or upon screen refresh.
3.	Default State: If the user has a score of zero, the screen displays "0" rather than being blank.


## Explicit non-goals (Out of scope for MVP)

Summary: It is important for the team to consider user satisfaction; however, not all requested features will be included in the initial release. 
The Minimum Viable Product (MVP) focuses exclusively on core gameplay mechanics, including object spawning, collision detection, and score and attempts tracking. 
Features that are out of scope include multiplayer functionality, advanced performance optimization, an advanced user interface and persistent storage.

- Gameplay scope
    Multiplayer or online mode
    AI opponents or competitive mechanics
    Procedural level generation
    Advance difficulty scaling algorithm
- User Interface (UI)
    Advanced animations and effects
    COMplex sound design
    Visual customization (themes, skins, etc..)
    Advanced sprites design and animations
- Technical
    Object pooling or performance optimization
    Advanced data storage (saving high scores to database or cloud)
    Cross-platform
- Marketing
    Monetization features (in-app purchases)
    Analytics
    DLC content
    App store optimization

## Demo script outline
- Game environment screen
- Game over screen

## Risks
Risks (technical + scope + team)
- Technology risk — new programming language Godot/GDScript
- Resource risk — limited assets, limited testing area/tool availability. No real test user to test the game.
- Schedule risk — delivering project on time
- Integration risk — UI + game logic bugs
- Scope risk — Adding features beyond core requirements
- Quality risk — Issues with testing. Identifying user centric test scenarios for testing
- Common availability of all team members to meet during working hours.
