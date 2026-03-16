extends Node2D

export(PackedScene) var GoodDrop
export(PackedScene) var BadDrop
export(float) var bad_chance = 0.15
var score = 0
var life = 5
var game_over = false
var stars = []
var drop_speed = 150.0

func _ready():
	Logger.info("Game started!")
	randomize()
	$Menu/Score.text = "Score: 0" #Fixed UI
	$Menu/Life.text = "Attempts: 5" #Fixed UI
	$Menu/Message.hide()
	for i in 80:
		var star = ColorRect.new()
		var sz = rand_range(1, 2.5)
		star.rect_size = Vector2(sz, sz)
		star.rect_position = Vector2(rand_range(0, 1024), rand_range(0, 600))
		star.color = Color(1, 1, 1, rand_range(0.3, 1.0))
		#BG Stars
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
	else:
		score += 1
	body.queue_free()
	$Menu/Score.text = "Score: " +str(score)
	Logger.info("Energy object collected (+1 point)")
	# make spawns faster as score grows (but keep a minimum)
	#SPEED
	drop_speed = min(400.0, 150.0 + score * 1.5)
	Logger.info("Increased Speed")
func _on_Catcher_body_entered(body):
	if game_over:
		return

	# If it's a "good" drop (positive points), missing it costs an attempt.
	# If it's a bad drop (negative points), missing it does NOT cost a life.
	if body.has_method("get") and body.get("points") != null:
		if body.points > 0:
			life -= 1
			$Menu/Life.text = "Attempts: " + str(life)
			Logger.info("Missed energy object (-1 attempt)")
	else:
		life -= 1
		$Menu/Life.text = "Attempts: " + str(life)
	body.queue_free()

	if life < 1:
		game_over = true
		#$Menu/Message.show()
		$CrystalTimer.stop()
		var drops = get_tree().get_nodes_in_group("drops")
		for child in drops:
			child.queue_free()
		_show_scoreboard()

func _process(delta):
	if game_over and Input.is_action_just_pressed("restart"):
		restart_game()

		#A non-static BG
	for s in stars:
		s["node"].rect_position.y += s["speed"] * delta
		if s["node"].rect_position.y > 600:
			s["node"].rect_position.y = -4
			s["node"].rect_position.x = rand_range(0, 1024)

func restart_game():
	get_tree().reload_current_scene()

func _show_scoreboard():

    # Scoreboard added
	$Menu/Scoreboard/VBox/FinalScore.text = "Final Score: %d" % score
	$Menu/Scoreboard/VBox/RestartHint.text = "Press ENTER to play again"
	$Menu/Scoreboard.visible = true
	Logger.info("Game Over. Final Score: "+ str(score))
