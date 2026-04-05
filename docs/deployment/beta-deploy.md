# Beta Deployment: SpaceHunter

## Overview
SpaceHunter is a standalone Windows desktop game exported from Godot 4.6.1. (Previously Godot 3.2.2)
No installation, no internet connection, no environment variables, 
No database, and no dependencies are required.
Atleast 150 MB of disk space required to save and 24 MB RAM required to run the game on local windows machine

---

### There are 2 options to run the game. Option 2 is the preferred option as no software needs to be installed to run and test.

## Option 1: Run from source in Godot Editor (Main)

### Requirements
- Godot 4.6.1 (exact version): download from https://godotengine.org
- No plugins need to be installed manually. GUT addon is included in repo

### Steps
1. Clone the repository:
``` bash
git clone term-project-group-2
```
2. Open Godot 4.6.1
3. Click **Import** → navigate to `SpaceHunter_game/` folder
4. Select `project.godot` → click **Import & Edit**
5. Wait for Godot to import all assets it may take around 2 minutes
6. Press **F5** to run the game


## Option 2 — Run the exported .exe and .pck

### Requirements
- Windows 10 or Windows 11
- No additional software needed

### Steps
1. Download the latest release from the GitHub repository from folder "SpaceHunter_Game" (SpaceHunter.exe and SpaceHunter.pck)
2. Extract the ZIP file to any folder if downloaded as zip else ensure both .exe and .pck files are in same location
3. Double click `SpaceHunter.exe` to launch
4. The main menu appears immediately with the instruction to play

### What to do first after launch
1. Read the main menu: click **Play** to start or **Exit** to quit
2. Once clicked Play you will see a screen with the rules, press **Enter** to proceed with the game
3. Use **arrow keys** to move the ship left and right
4. Catch energy orbs objects to gain points
5. Avoid or let asteroids fall through because catching them loses points
6. Missing an energy orb costs 1 attempt, in total you have 5 attempts
7. Game ends when all attempts are used, scoreboard shows final score
8. Press **Enter** to restart or click **Exit** on the scoreboard


---
## Environment Variables
None required. This is a fully offline desktop application.

## Database / Setup Steps
None required. No persistent data is stored between sessions.
All game state is held in memory and resets on every launch.

## Seed Data / Test Accounts
None required. However an admin debug mode is available for reviewers
Who want to test scoring and attempts behavior:

- Launch the game and start a session as per instruction provided above
- Press **Ctrl + Shift + Enter** during gameplay
- **Arrow Up** adds 50 points instantly
- Attempts will not decrease in admin mode
- Press **Ctrl + Shift + Enter** again to disable admin mode
---

## How to export a new version of .exe Build (For Team)

1. Open project in Godot 4.6.1
2. Go to **Project → Export**
3. Select **Windows Desktop** preset
4. Click **Export Project**
5. Save as `SpaceHunter.exe`
6. Upload to GitHub releases or share the ZIP

---

## Evidence of Tested Run Path
The following was verified by the team before submission:

- [x] Main menu loads correctly
- [x] Play button transitions to rules scene
- [x] Rule scene transitions to play scene upon pressing Enter
- [x] Objects spawn and fall correctly
- [x] Scoring and attempts update correctly
- [x] Game over triggers at 0 attempts
- [x] Scoreboard displays correct final score
- [x] Restart and Exit buttons work from scoreboard
- [x] Admin mode activates and deactivates correctly


## Evidence of the game tested by team

- Image of executable file downloaded

<img width="652" height="157" alt="image" src="https://github.com/user-attachments/assets/6f3650bb-23ba-46d4-a4ad-8455383b0c3e" />


- Image of game instructions

<img width="566" height="326" alt="image" src="https://github.com/user-attachments/assets/3b27c3f2-dd28-4dea-beb3-4a0ed2abeeca" />


- Image of game score increased by entering admin mode

<img width="574" height="341" alt="image" src="https://github.com/user-attachments/assets/e3d60d60-0ec6-4440-a35b-b07677ace89a" />

---

## Known Limitations
- **Windows only**: no Mac or Linux build currently available
- **Requires Windows 10 or later**, not tested on Windows 7/8
- **No installer** game runs directly from the extracted folder
