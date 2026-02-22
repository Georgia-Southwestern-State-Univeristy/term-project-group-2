extends Node2D

export(PackedScene) var GoodDrop
export(PackedScene) var BadDrop
export(float) var bad_chance = 0.15
var score = 0
var life = 7
var game_over = false


func _ready():
	randomize()
	$Menu/Score.text = "Score: 0"
	$Menu/Life.text = "Attempts: 7"
	$Menu/Message.hide()

func _on_CrystalTimer_timeout():
	if game_over:
		return

	var scene = GoodDrop
	if randf() < bad_chance:
		scene = BadDrop

	var drop = scene.instance()
	add_child(drop)
	drop.add_to_group("drops")

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
	# make spawns faster as score grows (but keep a minimum)
	$CrystalTimer.wait_time = max(0.25, 1.0 - int(score / 10) * 0.1)

func _on_Catcher_body_entered(body):
	if game_over:
		return

	# If it's a "good" drop (positive points), missing it costs an attempt.
	# If it's a bad drop (negative points), missing it does NOT cost a life.
	if body.has_method("get") and body.get("points") != null:
		if body.points > 0:
			life -= 1
			$Menu/Life.text = "Life: " + str(life)
	else:
		life -= 1
		$Menu/Life.text = "Life: " + str(life)

	body.queue_free()

	if life < 1:
		game_over = true
		$Menu/Message.show()
		$CrystalTimer.stop()
		var drops = get_tree().get_nodes_in_group("drops")
		for child in drops:
			child.queue_free()
			

func _process(delta):
	if game_over and Input.is_action_just_pressed("restart"):
		restart_game()

func restart_game():
	get_tree().reload_current_scene()
