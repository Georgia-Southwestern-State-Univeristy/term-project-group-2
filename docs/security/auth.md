## Auth + Access Control

**How users authenticate**

No authentication system (single-player local game)

**What is protected**

Game actions are controlled by game state (playing vs game_over)

**Role model**

Single role: Player

**Access control rule**

Player cannot interact with game objects when game_over = true

**Example:**
```
func _on_CrystalTimer_timeout():
	if game_over:
		return
```
