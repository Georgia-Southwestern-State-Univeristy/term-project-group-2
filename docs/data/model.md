Entity relationship diagram

- Game_session
  - Game_session_id PK R U
  - Player_id FK
  - Start_time
  - Current_State
  - End_time
  - is_active

- Player
  - Player_id R
  - Ship_id FK R
  - Score
  - Attempt R
  - Date_time_stamp R

- Falling_Object
  - Falling_object_id PK R
  - Game_session_id FK R
  - Player_id FK R
  - Position_x
  - Position_y
  - is_active

- Ship_object
  - Ship_object_id PK R
  - Object_name R
  - Object_size R
  - Object_create_Date R
  - Object_type R
  - is_active

- Ship
  - Ship_id PK R
  - Falling_object_id
  - Ship_description R
  - is_active R
  - Date_time_stamp
