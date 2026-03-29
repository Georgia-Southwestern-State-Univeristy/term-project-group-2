## Define one primary workflow from start to finish required

- Player collects a coin and score updates
  - Player starts game → moves → collects item → score updates


## Document:
- Entry point and user role (Main.tscn)
- Major system components involved
    - Player controller script
    - Input system (keyboard input)
    - Collision detection
    - Coin scene
    - Score manager
    - UI (score label)

- Expected output or system state at completion
    - Coin disappears
    - Score increases
    - UI updates


## Provide evidence:
- PR links for fixes required to make it work
    - https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/239
    - https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/247
      
- Short run notes
    - Game launches successfully
    - Player collects coin
    - Score increaments correctly
    - Tested on windows

- Screenshots
  
![Debugging process](https://github.com/user-attachments/assets/cf116100-9015-4501-a2ab-849fc976ab61)

- Debug log event
  - Game running
  - Score changes

  - Before
```
screenshot attached
```
  - After
```
screenshot attached
```
      
- Link to a passing CI run
    - https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/actions/runs/23701305201/job/69045356512
 
