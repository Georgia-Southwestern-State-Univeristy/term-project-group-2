## Where logs live and how to view them
- Logs live on the gs-logger using Logger.info()
- While running the debugger, open the Output on the bottom of the Godot Engine. The Logs will be presented there.

## What events are logged (requests, actions, errors)

**The events that are logged include the start of the game, energy object collection +1 point, missed energy object -1 attempt, asteroid hit -1 point, game over screen with final score and increasing speed.**

## How to correlate a user action to a log entry (request ID, timestamp, etc.)
- Events can be correlated using message id and event type
- Use Logger.info() to log messages and identifying the source of user actions. 
- Filter logs by the name of the logs shown in the Output window.

## Implement:
- Structured logs for at least 3 key user actions
    - func log_action(action_type: String, details: Dictionary):
    var log_entry = {
        "timestamp": OS.get_datetime(),
        "action": action_type,
        "details": details
    }
    print(JSON.print(log_entry))

- Structured logs to show game behavior, and if something fails. Everything worked fine.

- Basic validation + clear error messages on 2 common failure cases
    - Nothing failed.
    - Bugs were found and fixed.

## Evidence: 
- SpaceHunter_game/scripts/game_rules.gd
- SpaceHunter_game/Asteroid.tscn
- SpaceHunter_game/asteroid_pixelart.png.import
- SpaceHunter_game/Crystal.gd
- https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/179

**Sample log snippet: -**

godot-stuff Logger
https://gitlab.com/godot-stuff/gs-logger
Copyright 2018-2019, SpockerDotNet LLC
Version 3.2-R4
 
** Console Appender Initialized **
 
INFO       1        Game started!
INFO       2        Energy object collected (+1 point)
INFO       3        Increased Speed
INFO       4        Energy object collected (+1 point)
INFO       5        Increased Speed
INFO       6        Energy object collected (+1 point)
INFO       7        Increased Speed
INFO       8        Missed energy object (-1 attempt)
INFO       9        Missed energy object (-1 attempt)
INFO       10       Missed energy object (-1 attempt)
INFO       11       Missed energy object (-1 attempt)
INFO       12       Energy object collected (+1 point)
INFO       13       Increased Speed
INFO       14       Energy object collected (+1 point)
INFO       15       Increased Speed
INFO       16       Asteroid hit (-1 point)
INFO       17       Energy object collected (+1 point)
INFO       18       Increased Speed
INFO       19       Energy object collected (+1 point)
INFO       20       Increased Speed
INFO       21       Energy object collected (+1 point)
INFO       22       Increased Speed
INFO       23       Energy object collected (+1 point)
INFO       24       Increased Speed
INFO       25       Energy object collected (+1 point)
INFO       26       Increased Speed
INFO       27       Energy object collected (+1 point)
INFO       28       Increased Speed
INFO       29       Energy object collected (+1 point)
INFO       30       Increased Speed
INFO       31       Missed energy object (-1 attempt)
INFO       32       Game Over. Final Score: 10

