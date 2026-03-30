# Known Issues + Beta Readiness Snapshot 

## What Works Now
- Full game session runs from main menu to scoreboard without crashes
- Energy orbs and asteroids spawn, fall, and are detected correctly 
  after Godot 3.2.2 to 4.6.1 migration
- Messenger bot reacts to player actions and sends idle messages 
  every 15 seconds independently
- Camera shake on asteroid hit and zoom pulse on orb catch both 
  working correctly
- Admin mode activates via Ctrl+Shift+Enter, grants infinite lives 
  and score manipulation for testing purposes

## Known Issues

### High
- No instructions or rules screen before gameplay starts: 
  new players have no way to learn controls or objective

### Medium
- Game over screen UI not fully polished:  button sizing and 
  layout need adjustment for 1152x648 resolution

### Low
- No audio feedback for any game events:  catches, misses, 
  game over all silent
- Stray warning in console about deleted background PNG 
  still referenced in Main.tscn

## Deferred Items
- Instructions/rules screen between main menu and game
- Sound effects for orb catch, asteroid hit and game over
- Game over screen redesign with improved button layout

## Beta Readiness
Our team is on track for Week 12 Beta. Core gameplay is fully 
functional. The game launches, plays, and ends correctly with 
all major systems working including spawning, collision detection, 
scoring, lives (label: attempts), difficulty scaling, messenger bot, camera effects, 
and admin mode. The remaining items are polish and UX improvements, no critical functionality gaps. 
The Godot 4.6.1 migration introduced several breaking changes that were all resolved this week, 
and the project now has a CI pipeline with GUT tests running on 
every push. Week 12 will focus on the instructions screen, audio, 
and final UI polish before submission.
