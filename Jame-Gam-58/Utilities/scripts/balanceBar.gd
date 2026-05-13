extends Sprite2D

@onready var early_head: Sprite2D = $earlyHead

const MIN_X = -284
const MAX_X = 282


func _process(delta):
	var mouse_pos = get_global_mouse_position()
	
	var raw_dir = mouse_pos - early_head.global_position
	early_head.global_position.x += raw_dir.x * delta
	early_head.global_position.x = clamp(early_head.global_position.x, MIN_X, MAX_X)
	print(early_head.global_position.x)
