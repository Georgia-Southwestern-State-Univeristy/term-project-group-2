**MVP User Stories**

As a **space pilot**, I want to **control** a spaceship using forward thrust and rotational turning (clockwise/counter-clockwise), so that I can **navigate through open space**, change my direction of travel, and avoid obstacles.
    - Acceptance Criteria
1.	Rotation Control: The player can rotate the ship left and right using input keys (e.g., Left/Right Arrow).
2.	Forward Thrust: The player can apply forward acceleration (thrust) in the direction the ship is currently facing using an input key (e.g., Up Arrow).
3.	Inertia/Physics: The ship maintains momentum when thrust is released (no automatic braking), adhering to Newtonian physics (velocity continues until acted upon by opposite thrust).
4.	Rotational Momentum: The ship retains rotational inertia; turning stops gradually rather than instantly when input is released.
5.	Visual Feedback: The ship sprite/model rotates, and a thruster effect appears when accelerating forward.

As a **player**, I want to **shoot projectiles** from my spaceship, so that I can **destroy incoming asteroids** and survive the game. 
    - Acceptance Criteria
1.	Input Trigger: Pressing the space-bar (or designated primary button) spawns a projectile at the ship's current position.
2.	Movement: Projectiles travel in a straight line in the direction the ship is facing at a constant speed
3.	Collision: When a projectile hits an asteroid, both the projectile and the asteroid are destroyed/removed from the game
4.	Optimization: Projectiles are destroyed automatically if they leave the screen boundaries to prevent memory leaks
5.	Rate of Fire: A minimum delay (cool-down) exists between shots to prevent projectiles spamming

As a **player**, I want asteroids to **move** in random directions upon spawning, so that the game-play is **unpredictable and challenging**. 
    - Acceptance Criteria
1.	Randomized Initial Direction: When an asteroid spawns, it must be assigned a random angle of movement (0-360 degrees) or a random velocity vector function so it does not move in the same direction every time.
2.	Constant Movement: Once initialized, the asteroid must maintain its random speed and direction.
3.	Randomized Spawn Speed: Each asteroid should have a unique, random velocity speed component to add further variability.
4.	Edge Wrapping: Asteroids should move across the screen and wrap around to the opposite edge, keeping the random trajectory consistent.
5.	Randomized Rotation: In addition to movement, asteroids should rotate at a random speed function to increase visual complexity. 

As a planetary **defense officer** and spaceship pilot, I want to **deploy** a kinetic impactor to deflect incoming asteroids, so that earth is **protected from catastrophic collisions** and humanity is safe.
    - Acceptance Criteria:
1.	The system must identify and track hazardous asteroids greater than a certain diameter.
2.	The system must simulate the impact to ensure the asteroid is safely deflected off its collision course with earth.
3.	The system must successfully launch a robotic kinetic impactor and achieve a collision with the target.
4.	The system must verify through post-impact observation that the asteroid's orbit has been successfully altered and no longer poses a threat to earth.

As a **player**, I want to **experience** stakes when colliding with obstacles so that the game feels **challenging** and my survival depends on skillful navigation
    - Acceptance Criteria
1.	Life Reduction: Decrease the current life count by one immediately upon being hit by an asteroid.
2.	Visual Feedback: Provide a clear on-screen indicator (such as a screen shake or health bar flash) when a life is lost.
3.	Game Over Trigger: Automatically transition to the Game Over screen if the total number of hits reaches the predefined limit (e.g., 3 hits).
4.	Invulnerability Period: Grant a brief moment of invincibility after being hit to prevent losing all lives from a single collision event. 

As a **player**, I want to **see my current score** on the main game screen, so that I **know how well I am doing** without navigating away from the game. 
    - Acceptance Criteria
1.	Visibility: The current score is displayed in a consistent, clearly visible location on the main player dashboard.
2.	Accuracy: The score displayed accurately reflects the total points earned from completed actions in real-time or upon screen refresh.
3.	Default State: If the user has a score of zero, the screen displays "0" rather than being blank.
4.	Formatting: The score is formatted as a whole number (integer).
5.	Performance: The score loads within 2 seconds of the page/screen loading.

As a **player**, I want my **character to wrap around** to the opposite edge of the screen when moving off-screen, so that I **don't get trapped in a corner** . 
    -	Acceptance Criteria
1.	Horizontal Wrap: When the character moves beyond the left screen boundary, they immediately reappear on the right boundary, and vice-versa.
2.	Vertical Wrap: When the character moves beyond the top screen boundary, they immediately reappear on the bottom boundary, and vice-versa.
3.	Velocity Retention: The character’s speed and direction remain consistent throughout the wrap-around process. 
4.	No Visual Stuck State: The character does not briefly appear stuck at the edge before disappearing.

