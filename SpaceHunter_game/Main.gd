extends Node2D

export(PackedScene) var GoodDrop
export(PackedScene) var BadDrop
export(float) var bad_chance = 0.15
var score = 0
var life = 5
var game_over = false
var stars = []
var drop_speed = 150.0
# Messenger
var orbs_since_message = 0
var asteroids_since_message = 0
var is_typing = false
var shake_intensity = 0.0
var shake_duration = 0.0


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
	yield(get_tree().create_timer(0.08), "timeout")
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
		yield(get_tree().create_timer(0.05), "timeout")
	yield(get_tree().create_timer(2.5), "timeout")
	$UILayer/DialogueBox.visible = false
	is_typing = false

func _ready():
	randomize()
	$Menu/Score.text = "Score: 0"
	$Menu/Life.text = "Attempts: 5"
	$Menu/Message.hide()
	for i in 80:
		var star = ColorRect.new()
		var sz = rand_range(1, 2.5)
		star.rect_size = Vector2(sz, sz)
		star.rect_position = Vector2(rand_range(0, 1024), rand_range(0, 600))
		star.color = Color(1, 1, 1, rand_range(0.3, 1.0))
		$Background/Stars.add_child(star)
		stars.append({"node": star, "speed": rand_range(10, 40)})


func _on_CrystalTimer_timeout():
	if game_over:
		return

	var scene = GoodDrop
	if randf() < bad_chance:
		scene = BadDrop

	var drop = scene.instance()
	add_child(drop)
	drop.add_to_group("drops")
	drop.linear_velocity = Vector2(0, drop_speed)
	#drop.add_to_group("drops")
	#drop.speed = drop_speed
	#SAFE SPAWN (works with circle and rectangle shapes)

	var cs = drop.get_node("CollisionShape2D")
	var shape = cs.shape

	var half_w = 16.0  

	if shape is RectangleShape2D:
		half_w = shape.extents.x * drop.scale.x
	elif shape is CircleShape2D:
		half_w = shape.radius * drop.scale.x

	var view_rect = get_viewport().get_visible_rect()

	var min_x = view_rect.position.x + half_w
	var max_x = view_rect.position.x + view_rect.size.x - half_w

	drop.position.x = rand_range(min_x, max_x)
	drop.position.y = view_rect.position.y - 50
	



func _on_platform_body_entered(body):
	if game_over:
		return
	if body.has_method("get") and body.get("points") != null:
		score += body.points
		if body.points < 0:
			start_shake(8.0, 0.4)
		else:
			orb_pulse()
	else:
		score += 1
	body.queue_free()
	$Menu/Score.text = "Score: " + str(score)
	drop_speed = min(400.0, 150.0 + score * 1.5)
	orbs_since_message += 1
	if orbs_since_message >= 3:
		orbs_since_message = 0
		show_message(orb_messages[randi() % orb_messages.size()])
	
	
func _on_Catcher_body_entered(body):
	if game_over:
		return
	if body.has_method("get") and body.get("points") != null:
		if body.points > 0:
			life -= 1
			$Menu/Life.text = "Attempts: " + str(life)

	body.queue_free()
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
		
	for s in stars:
		s["node"].rect_position.y += s["speed"] * delta
		if s["node"].rect_position.y > 600:
			s["node"].rect_position.y = -4
			s["node"].rect_position.x = rand_range(0, 1024)	
			
	if shake_duration > 0:
		shake_duration -= delta
		$Camera2D.offset = Vector2(
			rand_range(-shake_intensity, shake_intensity),
			rand_range(-shake_intensity, shake_intensity)
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
