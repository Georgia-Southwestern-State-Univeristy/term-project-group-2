## Log at least 6 issues discovered from midterm demo or teammate testing required

- Issue with the wrong display of UI. It used to show wrong "Attempts" and switched to "Lives", while we have to have the correct number of "Attempts" all the time.
- Problem with the spaceship sprite going beyond the borders of the game
- Issue with the objects spawning in a large quantity
- Issue with the background not being able to show animation
- The scoreboard did not show up at the end of the game
- The text on the scoreboard was not visible

## Severity (Critical / Major / Minor)
- Issue with the wrong display of UI. It used to show wrong "Attempts" and switched to "Lives", while we have to have the correct number of "Attempts" all the time. - **Major**
- Problem with the spaceship sprite going beyond the borders of the game - **Major**
- Issue with the objects spawning in a large quantity - **Major**
- Issue with the background not being able to show animation - **Minor**
- The scoreboard did not show up at the end of the game - **Critical**
- The text on the scoreboard was not visible - **Critical**

## Repro steps (clear, numbered)

**1. Wrong "Attempts" display (showing "Lives" instead)**
1. Launch the game engine Godot 3.2.2 and start a new session in DEBUG window.
2. Observe the HUD/status area where attempt count is displayed.
3. Fail an attempt by missing an energy orb.
4. Observe that the label reads "Lives" instead of "Attempts."


**2. Spaceship sprite going beyond game borders**

1. Launch the game engine Godot 3.2.2 and start a new session in DEBUG window.
2. Move the spaceship toward any edge of the game window left or right.
3. Continue holding the movement input past the boundary.
4. Observe that the spaceship sprite partially exits the visible game area.

**3. Objects spawning in excessive quantity**

1. Launch the game engine Godot 3.2.2 and start a new session in DEBUG window.
2. Wait for energy orbs objects to begin spawning.
3. Observe the number of energy orbs objects appearing on screen within the first 20 seconds or once you score at least 50 points.
4. Note that objects appear in unusually large numbers simultaneously which makes the game very difficult to play - almost unplayable.

**4. Background animation not playing**

1. Launch the game engine Godot 3.2.2 and start a new session in DEBUG window.
2. Observe the game background immediately upon start.
3. Wait at least 5–10 seconds during active gameplay.
4. Observe that the background remains static dark blue color with no animation.

**5. Scoreboard not appearing at end of game**

1. Launch the game engine Godot 3.2.2 and start a new session in DEBUG window.
2. Play until all attempts are exhausted, it will trigger the Game Over state.
3. Observe the screen after the game ends.
4. Note that no scoreboard or end screen is displayed.

**6. Scoreboard text not visible**

1. Launch the game engine Godot 3.2.2 and start a new session in DEBUG window.
2. Play until the Game Over state is triggered and the scoreboard screen appears (scoreboard is fixed at this stage).
3. Observe the text elements on the scoreboard title "Game Over", "Final Score".
4. Note that text is invisible and fails to render.

## Expected vs actual behavior

**1. Wrong "Attempts" display (showing "Lives" instead)**
   - Expected: Label always reads "Attempts" with the correct count.
   - Actual: Label displays "Lives" and shows an incorrect count.
     
**2. Spaceship sprite going beyond game borders**
   - Expected: Spaceship is clamped within the game borders at all times.
   - Actual: Spaceship moves beyond the visible boundaries of the game canvas.

**3. Objects spawning in excessive quantity**
   - Expected: Objects spawn at a controlled, balanced rate per game design.
   - Actual: A disproportionately large number of objects appear at once, overwhelming the screen.
  
**4. Background animation not playing**
   - Expected: Background displays a scrolling animation of stars during gameplay.
   - Actual: Background appears as a static, solid color, non-animated image.

**5. Scoreboard not appearing at end of game**
   - Expected: A scoreboard screen appears automatically after Game Over, showing the player's final score.
   - Actual: The game ends but no scoreboard is shown.

**6. Scoreboard text not visible**
   - Expected: All scoreboard text is clearly legible against the background.
   - Actual: Text is not visible likely due to a color or rendering issue.

## Fix at least 2 issues and add regression tests when feasible
- **Wrong "Attempts" display (showing "Lives" instead)**: The wrong "Attempts" display (showing "Lives" instead) was fixed by changing the label names inside the code. The issue was that the variable is called life, which is fine within the code and does not need to be changed everywhere. However, the final decision to make a label called "Attempts" caused confusion. The solution was to double-check the name of the labels and change labels only (as visible elements) to match them all in the game.
- **Spaceship sprite going beyond game borders**: To ensure that the CollisionShape2D box is set to shape Rectangular and matches the size of the sprite. If it does not match the exact size, the game will not be able to determine where the beginning and end of the sprite are, causing it to leave the borders.
- **Objects spawning in excessive quantity**: It was a good feature to make the game more difficult as you progressed. However, there was a logical mistake: instead of faster-falling objects, they were spawning in large numbers.
  - It was caused by: $CrystalTimer.wait_time = max(0.25, 1.0 - int(score / 10) * 0.1)
  - Instead, it has to be: drop_speed = min(400.0, 150.0 + score * 1.5)
- **Background animation not playing**: Add Node2D and provide the correct path. If the Node is in the folder like background, it is important to provide the full path $Background/Stars.add_child(star)
- **Scoreboard not appearing at end of game**: Add Scoreboard node, Type: Control. Under the node add Background, and another control node with Title, Final Score and Restart. Add the code to the Main script.
- **Scoreboard text not visible**: Ensure that the "Custom Font" is chosen and the Font is actually provided (the correct path).
## Evidence: link to issues + PRs that close them
- Updated Game: https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/tree/main/SpaceHunter_game
- PR Link: https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/179/changes/967f506861df79f4f4b6f624a739f5e4d226f0c1 or https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/179
