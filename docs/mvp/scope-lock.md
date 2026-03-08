# **Explicit non-goals** (what you will not build for MVP)

## **MVP User Stories**

DONE - As a **space pilot**, I want to **control** a spaceship using left and right key, so that I can **collect energy and avoid asteroids**, change my direction of travel.
    - Acceptance Criteria
1.	Left/Right: The player can movethe ship in left and right  direction using an input key.
2.	Visual effect: The ship moves left/right.

DONE - As a **player**, I want to **collect energy** from my spaceship, so that I can **get more score** and survive the game. 
    - Acceptance Criteria
1.	Input Trigger: Pressing left and right arrow key moves the space ship.
2.	Collision: When a space ship  hits an asteroid, score is reduced.
3.	Collision: When a space ship  hits anenergy, score is increased.

DONE - As a **player**, I want asteroids to **fall down** upon spawning, so that the game-play is **unpredictable and challenging**. 
    - Acceptance Criteria
1.	Randomized Initial Direction: When an asteroid spawns, it must be assigned a random position of movement.
2.	Constant Movement: Once initialized, the asteroid must maintain its speed and direction.

DONE - As a **player**, I want to **experience** when collecting energy and avoid astroids so that the game feels **challenging** and my survival depends on skillful navigation
    - Acceptance Criteria
1.	Life Reduction: Decrease the current life count by one immediately upon missing the energy.
2.	Score change: Increase the score count immediately catching the energy and decrease upon catching the asteroids.
3.	Visual Feedback: Provide a clear on-screen indicator when a life is lost and score is changed.
4.	Game Over Trigger: Automatically transition to the Game Over screen.

DONE - As a **player**, I want to **see my current score** on the main game screen, so that I **know how well I am doing** without navigating away from the game. 
    - Acceptance Criteria
1.	Visibility: The current score is displayed in a consistent, clearly visible location on the main player dashboard.
2.	Accuracy: The score displayed accurately reflects the total points earned from completed actions in real-time or upon screen refresh.
3.	Default State: If the user has a score of zero, the screen displays "0" rather than being blank.

DONE - As a **player** I want to **start playing quickly** so that I **don't waste time by clicking buttons**
    - Acceptance Criteria: -
1- Game loads with no setup options
2- Game loads for 1 player only
3- Game starts with one click once loaded

DONE - As a **player**, it is important for me to be able to **use both key sets for left and right: "A" and "D" and the arrows**, so that it will be **easier to switch between my keyboards**, and one of them is a mini version with not-so-convenient arrow keys placement.
    - Acceptance Criteria: -
1- Switch between arrow and keyboard instantly
2- Control using either arrow or A & D

In Progress - As a **player**, I would like to see **my highest score** by the end of the game so that **I know how I did**.
    - Acceptance Criteria: -
1- Once the game is over, inform player of the last score during the session.
2- Display score until next click

READY - As a **player**, I want to **fully immerse myself in the game experience**, so that I can **get the real feel of the game**.
    - Acceptance Criteria: -
1- Added animations, such as the screen shaking whenever an asteroid collides with my ship

READY - As a **player**, I would like the ship to have an **appropriate speed** so that it is **not too fast** since the game would feel much easier.
    - Acceptance Criteria: -
1- I don't want sprites to be too slow when playing.
2- Gameplay balance between energy and asteroids speed should be constant.


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
- Game screen with space ship, energy and asteroids
- Game screen with score and attempts

## Risks
Risks (technical + scope + team)
- Technology risk — new programming language Godot/GDScript
- Resource risk — limited assets, limited testing area/tool availability. No real test user to test the game.
- Schedule risk — delivering project on time
- Integration risk — UI + game logic bugs
- Scope risk — Adding features beyond core requirements
- Quality risk — Issues with testing. Identifying user centric test scenarios for testing
- Common availability of all team members to meet during working hours.
