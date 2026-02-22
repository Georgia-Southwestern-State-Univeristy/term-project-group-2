# Project Name - SpaceHunter

This is a single player game where player plays game to catch energy and avoid astroids

## Godot Version

This project uses Godot 3.2.2

## Setup

1. Install Godot Engine 3.2.2
  https://godotengine.org/download/archive/3.2.2-stable/
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

## Repository Structure
```
.
├─ .github/
│  └─ workflows/                         # GitHub Actions workflows
│     └─  ci.yml                         # Automated CI pull request check to review the changes for an approval
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
│  ├─ data/                               
│  │  ├─ model.md                        # ERD with List entities + key fields + relationships and model diagram image link
│  ├─ mvp/                               
│  │  ├─ explicit-non-goals.md           # Explicit non goals defined in the document
│  │  ├─ mvp.md                          # MVP defined
│  │  ├─ scope-lock.md                   # MVP stories, scope lock, demo script outline and risk defined
│  ├─ team/
│  │  ├─ MARIOPEHAIRE.md                 # Mario's role, availability and one engineering priciple he wnats to follow
│  │  ├─ OLGARAU.md                      # Olga's role, availability and one engineering priciple he wnats to follow
│  │  ├─ RAJESHAGGARWAL.md               # Rajesh's role, availability and one engineering priciple he wnats to follow
│  │  ├─ definition-of-done.md           # Definition of done about the project                    
├─ tests/                                
│  ├─ test_code.gd                       # Test code file create for dummy testing
├─ CONTRIBUTING.MD                       # Contributing guidelines and conventions
├─ PULL_REQUEST_TEMPLATE.MD              # Pull request checklist
└─ READMD.MD                             # This document
```
