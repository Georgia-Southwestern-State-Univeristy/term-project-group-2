extends Node2D

@export var GoodDrop: PackedScene
@export var BadDrop: PackedScene
@export var bad_chance: float = 0.15
var score = 0
var life = 5
var game_over = false
var stars = []
var drop_speed = 200.0
var orbs_since_message = 0
var asteroids_since_message = 0
var is_typing = false
var shake_intensity = 0.0
var shake_duration = 0.0
var admin_mode = false

var orb_messages = [
	"Great job!",
	"Awesome catch!",
	"Energy secured!",
	"Nice one!",
	"You are a natural!",
	"Keep it up!",
	"Excellent flying!",
	"That is what I am talking about!"
]

var asteroid_messages = [
	"Be careful out there!",
	"This is dangerous!",
	"Watch your step!",
	"That one hurt!",
	"Stay focused!",
	"Avoid those rocks!",
	"Shields taking damage!",
	"That was close!"
]

var idle_messages = [
	"It is so good to be a space hunter!",
	"I am glad to help!",
	"Space is full of surprises.",
	"Stay sharp out there.",
	"The stars are beautiful tonight.",
	"I have your back, pilot.",
	"Sensors are clear... for now.",
	"What a time to be alive!"
]

func orb_pulse():
	$Camera2D.zoom = Vector2(1.05, 1.05)
	await get_tree().create_timer(0.08).timeout
	$Camera2D.zoom = Vector2(1.0, 1.0)

func start_shake(intensity, duration):
	shake_intensity = intensity
	shake_duration = duration

func show_message(text):
	if is_typing:
		return
	$UILayer/DialogueBox.visible = true
	$UILayer/DialogueBox/NameLabel.text = "> Messenger"
	$UILayer/DialogueBox/MessageLabel.text = ""
	is_typing = true
	var full_text = text
	var i = 0
	while i < full_text.length():
		$UILayer/DialogueBox/MessageLabel.text += full_text[i]
		i += 1
		await get_tree().create_timer(0.05).timeout
	await get_tree().create_timer(2.5).timeout
	$UILayer/DialogueBox.visible = false
	is_typing = false

func _ready():
	$Menu/Score.text = "Score: 0"
	$Menu/Life.text = "Attempts: 5"
	$Menu/Message.hide()
	for i in 80:
		var star = ColorRect.new()
		var sz = randf_range(1, 2.5)
		star.size = Vector2(sz, sz)
		star.position = Vector2(randf_range(0, 1152), randf_range(0, 648))
		star.color = Color(1, 1, 1, randf_range(0.3, 1.0))
		$Background/Stars.add_child(star)
		stars.append({"node": star, "speed": randf_range(10, 40)})

func _on_CrystalTimer_timeout():
	if game_over:
		return
	var scene = GoodDrop
	if randf() < bad_chance:
		scene = BadDrop
	var drop = scene.instantiate()
	add_child(drop)
	drop.add_to_group("drops")
	var screen_w = get_viewport_rect().size.x
	drop.position.x = randf_range(80, screen_w - 80)
	drop.position.y = -50
	drop.speed = drop_speed

func _on_platform_area_entered(area: Area2D) -> void:
	#print("platform hit: ", area.name)
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
	else:
		score += 1
	area.queue_free()
	$Menu/Score.text = "Score: " + str(score)
	drop_speed = min(400.0, 200.0 + score * 1.5)
	orbs_since_message += 1
	if orbs_since_message >= 3:
		orbs_since_message = 0
		show_message(orb_messages[randi() % orb_messages.size()])

func _on_catcher_area_entered(area: Area2D) -> void:
	#print("catcher hit: ", area.name)
	if game_over:
		return
	if area.get("points") != null:
		if area.points > 0:
			if not admin_mode:
				life -= 1
				$Menu/Life.text = "Attempts: " + str(life)
				print("Orb missed! -1 attempt, attempts remaining: %d" % life)
			else:
				print("Asteroid missed, no penalty, attempts remaining: %d" % life)
	area.queue_free()
	asteroids_since_message += 1
	if asteroids_since_message >= 3:
		asteroids_since_message = 0
		show_message(asteroid_messages[randi() % asteroid_messages.size()])
	if life < 1:
		game_over = true
		$CrystalTimer.stop()
		var drops = get_tree().get_nodes_in_group("drops")
		for child in drops:
			child.queue_free()
		_show_scoreboard()

func _on_MessengerTimer_timeout():
	if game_over:
		return
	show_message(idle_messages[randi() % idle_messages.size()])

func _process(delta):
	if game_over and Input.is_action_just_pressed("restart"):
		restart_game()
	if Input.is_key_pressed(KEY_CTRL) and Input.is_key_pressed(KEY_SHIFT) and Input.is_action_just_pressed("ui_accept"):
		admin_mode = !admin_mode
		if admin_mode:
			show_message("ADMIN MODE ON")
		else:
			show_message("ADMIN MODE OFF")
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

func _show_scoreboard():
	$Menu/Scoreboard/VBox/FinalScore.text = "Final Score: %d" % score
	$Menu/Scoreboard/VBox/RestartHint.text = "Press ENTER to play again"
	$Menu/Scoreboard.visible = true

func _on_ExitButton_pressed():
	get_tree().quit()
	
