# Project Name - SpaceHunter

This is a single player game where player plays game to catch energy and avoid astroids

## Godot Version

This project uses Godot 4.6.1

## Setup

1. Install Godot Engine 4.6.1
  https://github.com/godotengine/godot/releases/download/4.6.1-stable/Godot_v4.6.1-stable_linux.x86_64.zip
2. Clone the repository
3. Open project.godot in Godot

## Running the Project

Press F5 to run the main scene.

## Project Structure

- scenes/ - Game scenes
- scripts/ - GDScript files
- assets/ - background and sprites

## Formatting
Run:
gdformat .
gdlint .

## How to Run and Verify the Energy Catch MVP Path
Run the Project
Install Godot 4.6.1
Clone the repository
Open the project in Godot
Run the main scene

Verify the MVP Behavior
To test the Energy Catch behavior:
Move the platform using left/right keys
Catch a falling Energy object

Observe that:
The score increases by 1
The Energy object disappears
The game remains in "playing" state
This verifies the controller → service → state update → UI response path.


## Repository Structure
```
.
├─ .github/
│  └─ workflows/                         # GitHub Actions workflows
│     └─  ci.yml                         # Automated CI pull request check to review the changes and run test befor an approval
├─ SpaceHunter_game/                     # Program files for game built in Godot
│  ├─ .import/                           # Images required for the game
│  ├─ └─ ..                              # Game image files
│  ├─ ../                                # Game program files
├─ assignment/                           
│  └─ GROUP PROJECT..                    # Assignment files submitted for the week in .docx format                                   
├─ docs/                                 # Project documents in respective folders
│  ├─ adr/                               
│  │  ├─ ADR-001.md                      # Architecture diagram of the game
│  │  └─ ADR-001.md.jpeg                 # Architecture diagram image of the game
│  ├─ api/                               
│  │  ├─ openapi.yaml                    # Contract with endpoints tied to MVP 
│  ├─ beta/                               
│  │  ├─ beta-plan.md                    # Beta-plan for the week 9 - 12.
│  │  ├─ bug-triage.md                   # Bug triage document
│  │  ├─ observability.md                # Project code observability to identify issues and failures
│  │  ├─ week10-sprint.md                # Week 10 sprint goal and commitment to deliver
│  │  ├─ week10-ux.md                    # Week 10 test and usability improvements
│  │  ├─ week11-ci.md                    # Week 11 CI
│  │  ├─ week11-e2e.md                   # Week 11 end to end testing
│  │  ├─ week11-reliability.md           # Week 11 reliability and failure handling
│  │  ├─ week11-sprint.md                # Week 11 sprint goal
│  │  ├─ week11-status.md                # Week 11 sprint status
│  │  ├─ week12-known-issues.md          # Week 12 known issues
│  │  ├─ week12-quality.md               # Week 12 quality check
│  │  ├─ week12-retro.md                 # Week 12 team retrospective
│  │  ├─ week9-pr-index.md               # Week 9 pr-index to show shipped items
│  │  ├─ week9-sprint.md                 # Week 9 sprint goal and commitment to deliver
│  ├─ data/                               
│  │  ├─ model.md                        # ERD with List entities + key fields + relationships and model diagram image link
│  ├─ deployment/                               
│  │  ├─ beta-deploy.md                   # Beta deployment document with instructions on how to deploy and run the beta version
│  ├─ mvp/                               
│  │  ├─ demo-readiness.md               # Demo readiness plan
│  │  ├─ explicit-non-goals.md           # Explicit non goals defined in the document
│  │  ├─ midterm-demo.md                 # Mide-term demo presentaion link and video link with team, date.
│  │  ├─ midterm-snapshop.md             # Midterm snapshot showing what we are delivering during midterm.
│  │  ├─ mvp-checklist.md                # MVP checklist showing done and pending stories.
│  │  ├─ mvp.md                          # MVP defined
│  │  ├─ release-notes-midterm.md        # Midterm release notes for MVP of space hunter game
│  │  ├─ scope-lock.md                   # MVP stories, scope lock, demo script outline and risk defined
│  ├─ releases/                               
│  │  ├─ beta-release.md                 # Beta release version documented with what's being released, date and known limitations
│  ├─ security/                               
│  │  ├─ auth.md                         # 
│  │  ├─ week10-security-notes           # Week 10 security notes showing the validation and security
│  ├─ team/
│  │  ├─ MARIOP.md                       # Mario's role, availability and one engineering priciple he wnats to follow
│  │  ├─ OLGARAU.md                      # Olga's role, availability and one engineering priciple he wnats to follow
│  │  ├─ RAJESHAGGARWAL.md               # Rajesh's role, availability and one engineering priciple he wnats to follow
│  │  ├─ definition-of-done.md           # Definition of done about the project                    
├─ tests/                                
│  ├─ test_code.gd                       # Test code file create for dummy testing
│  ├─ test_game_rules.gd                 # Test code file showing - 2 “happy path” tests, 1 “failure path” test (missing resource), 1 boundary test (service or data layer)
├─ CONTRIBUTING.MD                       # Contributing guidelines and conventions
├─ PULL_REQUEST_TEMPLATE.MD              # Pull request checklist
└─ READMD.MD                             # This document
```
