extends Node

@export var GoodDrop: PackedScene
@export var BadDrop: PackedScene
@export var bad_chance: float = 0.15

var drop_speed = 200.0
var game_over = false
var parent: Node = null

func setup(p: Node):
	parent = p

func spawn():
	if game_over:
		return
	var scene = GoodDrop
	if randf() < bad_chance:
		scene = BadDrop
	if scene == null:
		push_error("Drop scene not assigned in Spawner")
		return
	var drop = scene.instantiate()
	parent.add_child(drop)
	drop.add_to_group("drops")
	var screen_w = parent.get_viewport_rect().size.x
	drop.position.x = randf_range(80, screen_w - 80)
	drop.position.y = -50
	drop.speed = drop_speed

func update_speed(score: int):
	drop_speed = min(400.0, 200.0 + score * 1.5)

func stop_all():
	game_over = true
	var drops = parent.get_tree().get_nodes_in_group("drops")
	for child in drops:
		child.queue_free()
