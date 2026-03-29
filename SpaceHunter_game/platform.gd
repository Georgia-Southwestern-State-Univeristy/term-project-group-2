extends Area2D

@export var speed = 1300

func _process(delta):
	var screen_w = get_viewport_rect().size.x
	var half_w = $CollisionShape2D.shape.size.x / 2
	print("screen_w: ", screen_w, " half_w: ", half_w, " pos: ", position.x)

	var input = 0
	if Input.is_action_pressed("ui_right"):
		input += 1
	if Input.is_action_pressed("ui_left"):
		input -= 1

	position.x += input * speed * delta

	position.x = clamp(position.x, half_w, screen_w - half_w)
		# ������ NEW: flip sprite
	if input > 0:
		$platform.flip_h = false   # facing right
	elif input < 0:
		$platform.flip_h = true    # facing left
