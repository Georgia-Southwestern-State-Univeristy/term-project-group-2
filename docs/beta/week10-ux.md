## At least 2 tests for authorized vs unauthorized behavior (if auth exists)
- Player cannot enter debug/admin mode to change attempts/score.
- Player can't start to play wihtout clicking on play button
- Player can exit game by clicking on exit button


## At least 1 validation failure test
- Player can make changes with entering in admin mode.
- Done in Godot engine

## At least 1 regression test for a previously fixed bug
- Done in Godot engine

## CI run link
https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/actions/runs/23413318966

## PR links
https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/217
https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/211
https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/213

## Short “before/after” note
- Before: -
  - No option to enter debug/admin mode to make changes to the features
- After: -
  - Player has control to enter in debug/admin mode to make changes 

### Risk 1 — Game state not gated during game over (FIXED)
- Risk: Player input and game logic continued processing after game over was triggered. Energy objects kept spawning, score could change, and the ship could still move.
- Before: Score could increment after game over if a drop landed on the ship during the game over transition.
- After: All functions exit immediately when game_over = true. No state changes after game over is triggered.


### Risk 2 — Messenger bot could continue to "talk" during game over screen (FIXED)
- Risk: The MessengerTimer runs independently. If it starts to talk at the exact moment game over triggered, the dialogue box will continue to appear on top of the scoreboard.
- Before: Idle message could overlap the scoreboard.
- After: Messenger stops talking the moment game over is triggered.


## Project Board link
https://github.com/orgs/Georgia-Southwestern-State-Univeristy/projects/21/views/1

