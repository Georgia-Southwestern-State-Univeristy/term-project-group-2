## SpaceHunter – Documentation Alignment & Repository Polish

### Overview

This document summarizes the final cleanup and alignment work performed on the SpaceHunter repository to ensure it is:

- Easy to navigate for new users and reviewers
- Consistent with the actual Release Candidate (rc-v0.9)
- Free of outdated, redundant, or confusing documentation

---
### What Was Reorganized

#### Documentation Structure

The ```/docs/``` directory was reviewed and organized into clearer sections:

- ```/docs/user-guide.md``` → End-user gameplay instructions
- ```/docs/admin-guide.md``` → Technical setup and maintenance
- ```/docs/releases/``` → Release documentation (including RC)
- ```/docs/final/``` → Final deliverables (runbook, repo polish, etc.)

This separation ensures that:

- Players, developers, and evaluators can quickly find relevant information
- Final submission materials are clearly grouped


### File Organization Improvements

Grouped all release-related documents under:

```/docs/releases/```

Grouped all final submission artifacts under:

```/docs/final/```

Ensured test-related files remain in:

```/tests/```

---
### What Was Renamed or Clarified
#### README.md

Updated to:

- Clearly describe the game (SpaceHunter)
- Reflect the current Release Candidate state, not the Beta
- Include:
  - How to run the game (Windows ```.exe```)
  - Controls and gameplay summary
  - Link to key documentation:
    - User Guide - https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/blob/main/docs/user-guide.md
    - Admin Guide - https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/blob/main/docs/admin-guide.md
    - Release Candidate - https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/releases/tag/rc-v0.9
    - Runbook - https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/blob/main/docs/final/week14-runbook.md


#### Release Documentation

- Added:

``` /docs/releases/release-candidate.md ```

- Clearly distinguishes RC from Beta:
  - Stable workflows
  - Improvements
  - Known risks

#### Deployment Documentation

- Aligned all instructions with actual behavior:
  - Game starts from **main screen → Play button**
  - Requires ```.exe``` + ```.pck``` files
- Removed any ambiguity about needing Godot for end users


#### User & Admin Guides

- Updated to match real system behavior:
  - Main screen exists (not direct start anymore)
  - No settings system
  - No save or persistence

---

### What Was Removed or Updated

**Outdated Beta Assumptions**

The following inconsistencies were corrected:

- References implying the game starts immediately → updated to **main screen flow**
- Mentions of incomplete systems → updated to reflect **RC stability**
- Early-stage descriptions of architecture → aligned with refactored structure

#### Redundant or Confusing Content
- Removed duplicate explanations across multiple documents
- Consolidated setup instructions into:
  - User Guide (for players)
  - Admin Guide (for developers)
- Eliminated unclear or overly technical descriptions in user-facing docs

#### Stale Technical Notes

- Updated references to:
  - Godot version → now **4.6.2**
- Ensured all file paths and commands are accurate
- Removed references to features no longer relevant or implemented

---
### Documentation Alignment

All major documents are now consistent with the Release Candidate:

|Area |	Status|
|-----|-------|
|README |Updated and aligned |
|User Guide|Matches gameplay and controls|
|Admin Guide|Matches setup and debugging|
|Release Notes (RC)|Reflects final system state|
|Runbook|Verified against real execution|
|Architecture Docs|Consistent with refactoring|

---
### Where Reviewers Should Start

To quickly understand and evaluate the project, reviewers should follow this order:

#### 1. README.md
- High-level overview of the project
- Quick instructions to run the game


#### 2. Run the Game
- Download the Release Candidate (````rc-v0.9````)
- Run the ````.exe```` file
- Click **Play** to begin


#### 3. User Guide

```` /docs/user-guide.md ````
- Explains gameplay and controls
- Helps verify expected behavior


#### 4. Runbook Verification

````/docs/final/week14-runbook.md ````

- Confirms the system runs correctly
- Shows verified deployment steps


#### 5. Release Candidate Notes

```` /docs/releases/release-candidate.md ````
- Details system scope and stability
- Lists remaining risks and improvements


#### 6. Admin Guide (Optional)
```` /docs/admin-guide.md ````
- For deeper technical understanding
- Includes debugging and maintenance details

----
