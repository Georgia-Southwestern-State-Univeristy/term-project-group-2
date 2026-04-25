extends Area2D
@export var points: int = -1
var speed = 150.0

func _process(delta):
	position.y += speed * delta

func play_hit_sound():
	speed = 0
	$CollisionShape2D.set_deferred("disabled", true)
	visible = false
	$HitSound.play()
	await $HitSound.finished
	queue_free()
