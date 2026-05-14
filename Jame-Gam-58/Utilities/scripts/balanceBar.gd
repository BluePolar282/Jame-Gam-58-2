extends Sprite2D
@onready var early_head: Sprite2D = $earlyHead

var velocity = 0.0
const GRAVITY = 2.0      
const MOUSE_PULL = 0.5   

func _process(delta):
	var mouse_pos = get_global_mouse_position()
	
	velocity += early_head.global_position.x * GRAVITY * delta
	
	var pull = (mouse_pos.x - early_head.global_position.x) * MOUSE_PULL * delta
	velocity += pull
	
	early_head.global_position.x += velocity * delta
