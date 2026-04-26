# Week 15: Final QA Checklist + Demo Path Verification

## Recent Changes Verified in QA
- Background music added to Main Menu (loops automatically)
- Background music added to Scoreboard/Game Over screen
- Sound effect added to Crystal orb on catch (plays then disappears)
- Sound effect added to Asteroid on ship collision
- Game Over sound effect plays when scoreboard appears
- Play button and Exit button UI updated with new PNG assets
- Play button clickable area fixed to match full PNG dimensions
- Stretch mode set to canvas_items + expand for all screen sizes

---

## Final QA Checklist

### Startup + Deployment
-  Game launches from .exe without Godot installed
-  Main menu appears immediately on launch with background image visible
-  Background music starts playing automatically on main menu
-  Play button hover effect activates across the full button width
-  Exit button closes the game completely from main menu

### Auth + Access Control
-  Admin mode is OFF by default - lives decrease normally
-  Admin mode activates with Ctrl+Shift+Enter during gameplay
-  Messenger confirms "ADMIN MODE ON" when activated
-  Arrow Up adds 50 points only when admin mode is ON
-  Attempts do not decrease in admin mode when orbs are missed
-  Admin mode deactivates with Ctrl+Shift+Enter again
-  Messenger confirms "ADMIN MODE OFF" when deactivated

### Core Gameplay Workflow
-  Clicking Play transitions from main menu to game scene
-  Score starts at 0 and Attempts starts at 5
-  Stars scroll downward at varying speeds from game start
-  Energy orbs spawn and fall at correct speed
-  Asteroids spawn at approximately 15% of spawn events
-  Ship moves left and right with arrow keys
-  Ship stays within screen boundaries on both sides
-  Catching energy orb increases score and plays catch sound
-  Catching energy orb triggers orb pulse camera effect
-  Orb disappears immediately on catch
-  Catching asteroid decreases score and plays hit sound
-  Catching asteroid triggers camera shake
-  Asteroid disappears immediately on catch
-  Missing energy orb decreases attempts by 1
-  Missing asteroid has no penalty
-  Drop speed increases gradually as score grows
-  Drop speed never exceeds maximum cap

### Messenger Bot
-  Messenger sends positive message every 3 orbs caught
-  Messenger sends warning message with every 3 asteroids collided
-  Messenger sends idle message every 15 seconds
-  Messenger does not send messages after game over
-  Typing animation displays correctly
-  Dialogue box hides after message completes

### Game Over + Scoreboard
-  Game over triggers when attempts reach 0
-  All drops cleared from screen on game over
-  Game over sound plays when scoreboard appears
-  Background music starts when scoreboard appears
-  Scoreboard displays correct final score
-  Restart prompt visible on scoreboard
-  Pressing Enter restarts the game correctly
-  Exit button on scoreboard closes the game
-  All state resets correctly on restart (score, lives, speed)

### Error Handling
-  No errors in Godot Output during normal gameplay
-  No debug print statements visible during normal play
-  Game does not crash when restarting multiple times in a row
-  Messenger dialogue does not appear over scoreboard

### UI + Usability
-  All text is readable at 1152x648 resolution
-  Score and Attempts labels update correctly during play
-  Play button hover effect works across full button area
-  Scoreboard layout is clean and readable

---

## Demo Path

This is the exact sequence the team will follow during the
final presentation:

### Step 1 - Launch
- Run `SpaceHunter.exe` from the build folder
- Show main menu with background image and music playing
- Demonstrate Play and Exit buttons with hover effects

### Step 2 - Gameplay
- Click Play to start the game
- Move ship left and right to show controls
- Catch 3 energy orbs: show score increasing and Messenger reacting
- Deliberately catch an asteroid: show score decreasing and camera shake
- Miss 2 orbs: show attempts decreasing
- Wait for Messenger idle message to demonstrate bot system

### Step 3 - Admin Mode
- Press Ctrl+Shift+Enter to activate admin mode
- Show "ADMIN MODE ON" in Messenger dialogue
- Press Arrow Up to add 50 points instantly
- Miss several orbs to show lives do not decrease
- Press Ctrl+Shift+Enter again to deactivate

### Step 4 - Game Over
- Miss remaining attempts to trigger game over
- Show game over sound and music playing
- Show scoreboard with correct final score
- Press Enter to restart and show clean state reset

### Step 5 - Exit
- Launch again and click Exit from main menu
- Show game closes cleanly

---

## Rehearsal Notes

### What Succeeded
- Full game session ran without crashes from launch to scoreboard
- All sounds played at correct moments
- Camera shake and orb pulse effects visible and well timed
- Messenger bot reacted correctly to all trigger conditions
- Admin mode activated and deactivated cleanly
- Score and attempts updated correctly throughout session
- Restart reset all state correctly

### What Broke or Was Confusing
- Play button was only clickable on the left portion of the PNG -
  caused by button rect size not matching new PNG dimensions
- Fixed by resizing TextureButton rect to match full PNG width

### What Was Fixed as a Result
- Play button Size updated in Inspector to match PNG dimensions
- Stretch Mode set to Scale to ensure texture fills full button area
- Both fixes verified - full button area now clickable with
  correct hover effect across entire width

---

## Final Sign Off
-  All Critical items from week14-triage.md resolved
-  Demo path rehearsed at least once end to end

## Link PRs
https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/368
https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/369
https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/370
https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/371
https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/371
https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/373
-  .exe tested on Link PRsa machine without Godot installed
-  GitHub Actions CI passing on latest commit
-  All documentation committed and pushed to main branch
