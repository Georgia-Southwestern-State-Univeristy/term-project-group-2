extends Node2D
const MAIN_SCENE = "res://Main.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween := create_tween().set_loops()
	tween.tween_property($PressEnterLabel, "modulate:a", 0.0, 0.6)
	tween.tween_property($PressEnterLabel, "modulate:a", 1.0, 0.6)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		get_tree().change_scene_to_file(MAIN_SCENE)
