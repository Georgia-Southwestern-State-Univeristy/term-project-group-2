## Architecture recap: 
  - current diagram link (C4 container is fine) - https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/tree/main/docs/adr

## What’s implemented:
  - Space ship collecting energy and avoiding asteroids.
  - Space ship moves left and right
  - Play can start to play with minimum clicks
  - Score is visibly on the screen
  - Lives/Attempts are shown on the screen

## What’s missing:
  - Show that player doesn't have to click multiple times to start the game
  - Game over with score screen
  - Updated assets for the game
  - Attempt/lives UI needs to be fixed
  - Final score board with highest score

## System run instructions: 
  - link to README section - https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/blob/main/README.md

## Test status: what tests exist and what they cover (include command)
- https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/161
    - Testing the time lapse since the previous frame 
- https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/162
    - test_energy()
    - test_asteroid()
    - test_failure()
    -	test_boundary()

## CI status: brief description of pipeline checks
- https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/160
    - Add MVP for mid term Main.gd files via upload #160
