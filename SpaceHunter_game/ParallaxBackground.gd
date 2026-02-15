extends ParallaxBackground
export var bg_speed = 3000.0

func _process(delta):
	scroll_offset.y += bg_speed * delta
	print(scroll_offset.y)
