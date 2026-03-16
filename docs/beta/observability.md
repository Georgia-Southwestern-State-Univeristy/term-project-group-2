## Where logs live and how to view them
- Logs live on the gs-logger using gs.log()
- Go to gs-loger and view the log.

## What events are logged (requests, actions, errors)
- Input event such as mouse input, key input are logged on godot-stuff logger using input_ function

## How to correlate a user action to a log entry (request ID, timestamp, etc.)
- Events can be correlated using message id and event type
- Use gs.log() to log messages and identifying the source of user actions. 
- Filter logs by user or log message to find relevant entries. 

## Implement:
- Structured logs for at least 3 key user actions
    - func log_action(action_type: String, details: Dictionary):
    var log_entry = {
        "timestamp": OS.get_datetime(),
        "action": action_type,
        "details": details
    }
    print(JSON.print(log_entry))

- Structured logs for errors with useful context (not just “something failed”)
    - 

- Basic validation + clear error messages on 2 common failure cases
    - 

## Evidence: 
- SpaceHunter_game/scripts/game_rules.gd
- SpaceHunter_game/Asteroid.tscn
- SpaceHunter_game/asteroid_pixelart.png.import
- SpaceHunter_game/Crystal.gd
- https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/179

**Sample log snippet: -**
- 

