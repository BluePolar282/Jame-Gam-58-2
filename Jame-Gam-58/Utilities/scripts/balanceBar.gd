extends Sprite2D
@onready var early_head: Sprite2D = $earlyHead

var velocity = 0.0
const GRAVITY = 2.0      
const MOUSE_PULL = 0.5   

func _process(delta):
	if early_head.global_position.x <= -300 or early_head.global_position.x >= 300 : 
		print("pass point of no return")
		
		velocity += early_head.global_position.x * GRAVITY * delta
		
		var pull = (0 - early_head.global_position.x) * MOUSE_PULL * delta
		velocity += pull
		
		early_head.global_position.x += velocity * delta
		
	else:
		
		var mouse_pos = get_global_mouse_position()
		
		velocity += early_head.global_position.x * GRAVITY * delta
		
		var pull = (mouse_pos.x - early_head.global_position.x) * MOUSE_PULL * delta
		velocity += pull
		
		early_head.global_position.x += velocity * delta
		print("mouse works")
