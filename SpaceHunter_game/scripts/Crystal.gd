extends Node2D
@export var points: int = 1
var speed = 200.0

func _process(delta):
	position.y += speed * delta
