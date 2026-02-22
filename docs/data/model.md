**Entity relationship diagram (ERD)**

- Game_session
  - Game_session_id PK R U
  - Player_id FK
  - Start_time
  - Current_State
  - End_time
  - is_active
  
- Player
  - Player_id PK R
  - Ship_id FK
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
    
- Score
  - Player_id FK R
  - Score
  - Date_time_stamp R

- Ship
  - Ship_id PK R
  - Falling_object_id FK R
  - Ship_description
  - is_active R
  - Date_time_stamp R


**Entity relationship diagram**

Below is the link to the ERD: -
Kindly copy the link and paste on the browser or click the link to view the ERD.

https://viewer.diagrams.net/?tags=%7B%7D&lightbox=1&highlight=0000ff&edit=_blank&layers=1&nav=1&dark=auto#R%3Cmxfile%3E%3Cdiagram%20name%3D%22Page-1%22%20id%3D%22hVXz75ZY3PMpb9rEVTFG%22%3E7V1bb6M4FP41feyIS8jlcZK0nZltd0btSju7L5Ub3MQrgiNw26S%2Ffm0uSSCGuilgQo9Uqdgxhtgf5%2FM5%2FnI4syfL9VWAVosb6mLvzDLc9Zk9PbMsszey%2BT9Rs4lrhtYgrpgHxE0a7SruyCtOKo2k9om4OMw0ZJR6jKyylTPq%2B3jGMnUoCOhLttkj9bJXXaE5Pqi4myHvsPZv4rJFUjswjN0H3zCZL9JLm%2BknS5S2TirCBXLpy16VfXFmTwJKWXy0XE%2BwJ0YvHZj4vMuCT7d3FmCfqZzwo38bDp8mvdl3c%2Fl8Zcx%2B4tH0XNJLUhWyTToI%2FM5X4pChB1E1DhkKWDJXtsEr%2BOgzRHwc8AozKnseWoUkah7XLIjnXqMNfWJpR2lp%2FEjW2L2Np0q05bN2zTsTRdH5I%2B%2F8LrkZ8THyyNznxzN%2Bx%2BKK4wCH%2FF6uUciSFgu29JLD%2BLs8I%2B8p%2BS5XaInv73AYEuonH%2BKA4fXed0%2BG7wrTJWbBhjdZ7M3wFpove3gYJnVJN2kxAb2dFFECxvm25%2B3Fbjl4kT%2FnXzJ7NVtyMSt7Mccsvxry%2BDD5iOExffLdcB8j%2FGDve%2B6qIuS8A0XWIYrK0FYErVvxeIwXNCCvAlBeAoB9uEXlF7L0kM%2BfO%2BTmqsY0MjQRbIjnTahHBSZ96uMDWIpGbkBXf6FgjllSsaLEZ9HAOWP%2Bx4dyYnxxzhx%2BrxNeNndl%2FieaB2xC%2FZAFHP6iD8xR%2BIIFEseMrpJOPfyY9h8kUyuOHyhjdFkE1KPAKYPLO8CYwcV7QWArgsAqBAE%2FlRHk7Z6FyLIIu452UyaZV%2BlIb0c3P%2Bx5e0L5GD96kWVeENfF3LaMXxaE4bsVmolGL5za3rAqv%2F6oarqqtRUabEHvRGCQ0kjcdhzyySb%2B%2FDo%2Bs5%2FDiVMRTiL2CWP2uefDWNUz7mQpoWLCcWpFEZnaFH3f0K%2Bv09nA%2B5M84OnwfDgASvkIpRhNUkq%2FAkqRo2B4iIJSuGizJtglaX9Vccrlp%2BQU%2BfSOTgUHb7JKJasND21wAPxRQgsO0MfJ0MeoLo%2BkrwgCp3vk8RmpQzq3qutI3RhohDjuhN26Z2SJgTmKgCBZcgJztJQ5tqHQyqlDsuAsQwtQRwepI42rtx4EjXDH5CkQw3DPLRgD%2Bij0QEcQuDoh%2FsgDpLLI1Ug1cjXSHbEABqnRGKjGrbSjoBEKufBdcD7K91Alegxgj7ayx7Au78O2FGFgF%2BMA2OOE2EM%2BuaqKCu0oaIQ9SHiPZow8A30UA0Eivui2nC%2FeCjsKEebQKTbxciGfNXIqhUj7lHy26sZZCjVYgXRSy6e6dWbr3jcBNV%2B99kA1nKUdCFr0fKDEeDsGoryKBUap26ctWfDULeUbSZampXjpkkt7rJTvcL4%2BYg%2Fe7q0JcyBZYLYTB80oMhZkdTR9SB7nCumjpPcmFyCqegygjxaERMv84485JKqCDFv3ZjxERGv8bZGqIkM7CpohjxkNIBpajBbVzTSgjhZQh2nVxR09SxEHPd37KMAdNVoD1TiEdhQ0wh1fGcPLFQP2KISBcuQT2KMF7OHUxh6qDmhPt4YL2KNGa6Dqf2pHQSPsMeWDHUn5hBx8uQIWKYKDkywmsHuQZ%2BpQokGfglnSSvXXzaLfdFOL90fY5hZ7iBHqX%2Bw%2Bibe%2BYqoxrezUYt%2F9KvJk8eLF7RL57s8IcxE7yT4IxFDhlKHwmrDfaU%2F8%2BB9R%2F8VJStP1XrNpSmH8NoPN9iRR2DtLFHenRaX0vPi7s5TXCunYkVqxN7QgadauIBq95%2Bxc7WPIeBuSvwTb7kB8bvayXNXL6wbjiU9O22HwoCenn%2B3Izu%2FWxINz0FFVsftPlyzsEnkeN5739OE%2FkVzuGCunki7M6XC%2BMCmQJA55GeBgZX3iGiPp5Er88TKwgMLo5FfW0ulV1QXohoEWfVGWgEBnVIIPVV0BcIr%2BaE1tKiOJbLUMLF0K1UC6sO3sSiK3rURBI6EaSDmpmmQOCORkCKSKlGFy1aEiCHTrS4BA6jQFsswvrYQBpJtsB3eYql4skId%2B8qgka5h8dpWd0GLNwMnyB7BHOrmqXqh2FDRDHzQkYkPyfg38UYgEVZcV%2BKMF%2FFFb1jBT2QfVrTIB%2FqjRGKg6odpR0Cx%2FbIA%2FipBgqTqswB8t4I8q8obJYSBR6JTiBfijg%2FyRDkX7UQB5w1pCH4kW570qVdVMMLpVqqnidFs4VnFaFgRujeB0%2B8bZNGtZHqCqelM719FWyNqQ3tTqVQhLqyuoPEZzrYjktkmnezkA9vK2UVk5neuoaeV0XxIS7LZ0WiQ2OYpwt6vjdwmmu66Y7qsGCFOkgYeXXXp2QzPdVw0Q9nWHhkA1Xa89UI0RageCFt30h9JqfQaPb7sYA0I5hZBhbYJp01ANGW4R06WYIWje9uZXNWyoHwmNxA3htzfqgnvV3%2FIBmbSATGoTTw9UVZAD3bldYfupRmOgKoLUjoLmMvy6OJwFZCViy8AihXhQ1U0Ci7SARepTUQ9UY52DYhwAjZw8jaiGOrWjAFQM7eAP01BdfwKBtIFA6pNRG8q%2FwzF0%2FwQDKKROg6D8SxztOIC0jW2ikuGRgjjVLTjd0qNEQpQeN5u2sfR1P63RHvWNLF0NjtUe9UbZjkb5%2BFvdWRuNKsEsC%2F7rRvORyKxRSJdycFvAPMrp3%2FrHgtm0nNxjYdaG5ukVXQ17zqXzezn89uP1%2FF%2Fn5vXz5SA9%2FiUv2zdqlCjp7FxuWrtsc%2BDUlHRSAElcgzKggYtYm4v49tsoq9DRSSdX4heUgaVL3uHnfBeldHYlceZWouAUsvx07F2UUhxIItJAHS2NLvYreB%2BMdHIlwtsysHSJOqqaq1MKLMofcIl4tpUggNdQ6mcNWW44oI2W0kYVLzCWT66y36l7JwKIo0ZboOp4akcB7Ee1ikMSVxUSNNQQwS%2Fz%2BVsTwc8Hah0jx1SqEfx%2B%2FiVi%2BXs5OoDPiwGlbL85NwGLG%2Bpi0eJ%2F%3C%2Fdiagram%3E%3C%2Fmxfile%3E


**State constraints/assumptions**

**Relationship**
A Game Session contains one Player.
A Game Session spawns multiple Asteroids and Energy objects during gameplay.
Asteroids interact with the Player via collision events but do not store persistent references.
Energy objects interact with the Player via collision events but do not store persistent references.
Asteroids should be avoided; if the Player collides with an Asteroid, the game triggers a negative outcome (lose a score).
Energy objects should be collected; if the Player collides with Energy, the game triggers a positive outcome (increase score).

**Constraints / Assumptions**
Only one player per session is supported. No multiplayer mode.
No persistent storage, no cloud storage. All data resets on restart.
Energy objects and asteroids are temporary runtime entities.
No user accounts or authentication system.
No Advanced difficulty scaling algorithms.
No Procedural level generation.
Simplified visuals and design.
