extends Control

var score = 0
var life = 5
var game_over = false
var stars = []
var shake_intensity = 0.0
var shake_duration = 0.0
var admin_mode = false

var messenger: Node
var scoreboard: Node
var spawner: Node

	
func orb_pulse():
	$Camera2D.zoom = Vector2(1.05, 1.05)
	await get_tree().create_timer(0.08).timeout
	$Camera2D.zoom = Vector2(1.0, 1.0)

func start_shake(intensity, duration):
	shake_intensity = intensity
	shake_duration = duration

func _ready():	
	# Setup Messenger
	messenger = preload("res://scripts/Messenger.gd").new()
	add_child(messenger)
	messenger.setup($UILayer/DialogueBox)

	# Setup Scoreboard
	scoreboard = preload("res://scripts/Scoreboard.gd").new()
	add_child(scoreboard)
	scoreboard.setup($Menu/Scoreboard)

	# Setup Spawner
	spawner = preload("res://scripts/Spawner.gd").new()
	add_child(spawner)
	spawner.setup(self)
	spawner.GoodDrop = preload("res://Crystal.tscn")
	spawner.BadDrop = preload("res://Asteroid.tscn")

	# UI init
	$Menu/Score.text = "Score: 0"
	$Menu/Life.text = "Attempts: 5"
	$Menu/Message.hide()

	# Stars
	for i in 80:
		var star = ColorRect.new()
		var sz = randf_range(1, 2.5)
		star.size = Vector2(sz, sz)
		star.position = Vector2(randf_range(0, 1152), randf_range(0, 648))
		star.color = Color(1, 1, 1, randf_range(0.3, 1.0))
		$Background/Stars.add_child(star)
		stars.append({"node": star, "speed": randf_range(10, 40)})

func _on_CrystalTimer_timeout():
	spawner.spawn()

func _on_platform_area_entered(area: Area2D) -> void:
	if game_over:
		return
	if area.get("points") != null:
		score += area.points
		if area.points < 0:
			start_shake(8.0, 0.4)
			print("Asteroid hit %d point, total points: %d" % [area.points, score])
		else:
			orb_pulse()
			print("Energy orb +%d point, total points: %d" % [area.points, score])
			messenger.on_orb_caught()
	else:
		score += 1
	area.queue_free()
	$Menu/Score.text = "Score: " + str(score)
	spawner.update_speed(score)

func _on_catcher_area_entered(area: Area2D) -> void:
	if game_over:
		return
	if area.get("points") != null:
		if area.points > 0:
			if not admin_mode:
				life -= 1
				$Menu/Life.text = "Attempts: " + str(life)
				print("Orb missed! -1 attempt, attempts remaining: %d" % life)
			else:
				print("Admin mode - no penalty, attempts remaining: %d" % life)
	area.queue_free()
	messenger.on_asteroid_missed()
	if life < 1:
		game_over = true
		spawner.stop_all()
		$CrystalTimer.stop()
		scoreboard.show(score)

func _on_MessengerTimer_timeout():
	if game_over:
		return
	messenger.on_idle()

func _process(delta):
	if game_over and Input.is_action_just_pressed("restart"):
		restart_game()
	if Input.is_key_pressed(KEY_CTRL) and Input.is_key_pressed(KEY_SHIFT) and Input.is_action_just_pressed("ui_accept"):
		admin_mode = !admin_mode
		if admin_mode:
			messenger.show_message("ADMIN MODE ON")
		else:
			messenger.show_message("ADMIN MODE OFF")
	if admin_mode and Input.is_action_just_pressed("ui_up"):
		score += 50
		$Menu/Score.text = "Score: " + str(score)
	for s in stars:
		s["node"].position.y += s["speed"] * delta
		if s["node"].position.y > 648:
			s["node"].position.y = -4
			s["node"].position.x = randf_range(0, 1152)
	if shake_duration > 0:
		shake_duration -= delta
		$Camera2D.offset = Vector2(
			randf_range(-shake_intensity, shake_intensity),
			randf_range(-shake_intensity, shake_intensity)
		)
	else:
		shake_duration = 0.0
		$Camera2D.offset = Vector2.ZERO

func restart_game():
	get_tree().reload_current_scene()

func _on_PlayButton_pressed():
	get_tree().change_scene_to_file("res://Main.tscn")

func _on_ExitButton_pressed():
	get_tree().quit()
	
