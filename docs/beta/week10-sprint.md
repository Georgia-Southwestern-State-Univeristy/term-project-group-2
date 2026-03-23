## Sprint goal: 
- “By Sunday, improve authorization and access to the beta version, build a main menu, improved visuals, and a structured scoreboard ready for final submission.”


## Backlog items
**Create admin / debug mode to enhance authorization and validation**

Acceptance Criteria:
- Player should not be able to enable debug mode without security code
- Player can only access the game to play
- Player can not reset the lives / attempts
- Player can not change the score

Link: - https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/issues/215
PR Link: - https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/216
https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/217

**Risk: Once the spaceship hits the asteroid, it should lose the point, not an attempt**
- Drops are validated to spawn within screen boundaries using collision shape size, preventing objects from spawning off-screen or partially clipped:
- Drop speed is capped to prevent it from scaling to an unplayable value:
- Without this cap, speed would grow unbounded as score increases.

Link: - https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/issues/206
PR Link: - 
https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/214

**Risk: Player input and game logic continued processing after game over was triggered. Energy objects kept spawning, score could change, and the ship could still move.**
- Fix: Added if game_over: return guard at the top of every input-sensitive function:
- Current: Score could increment after game over if a drop landed on the ship during the game over transition.
- After: All functions exit immediately when game_over = true. No state changes after game over is triggered.

Link: - https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/issues/204
PR Link: - https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/212

**The Messenger timer runs independently. If it starts to talk at the exact moment game over triggered, the dialogue box will continue to appear on top of the scoreboard.**
- Current: Idle message could overlap the scoreboard.
- After: Messenger stops talking the moment game over is triggered.

Link: - https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/issues/205
PR Link: - https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/211

**As a player I want to select to play so that I know when I am ready to play**
Acceptance criteria: -
- Game should not start without I selecting to play
- Game to give option to start playing
- Game cannot be started by without permission

Link: - https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/issues/200
PR Link: - https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/213

**As a player I want an option to stop playing so that I can start the game again later**
Acceptance criteria: -
- Game can be stopped at any time while playing
- Game should be ended when required
- Exit in case if player doesn't want to continue to play

Link: - https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/issues/201
PR Link: - https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/213


## Project Board link
https://github.com/orgs/Georgia-Southwestern-State-Univeristy/projects/21/views/1
