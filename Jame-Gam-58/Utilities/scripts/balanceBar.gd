extends Sprite2D
@onready var early_head: Sprite2D = $earlyHead

var velocity = 0.0
var last_mouse_pos = Vector2.ZERO
const GRAVITY = 3.0
const MOUSE_FORCE = 0.5

func _ready():
	last_mouse_pos = get_local_mouse_position()

func _process(delta):
	if early_head.global_position.x <= -300 or early_head.global_position.x >= 300 : 
		var mouse_pos = get_global_mouse_position()
		
		var mouse_delta = mouse_pos.x - last_mouse_pos.x
		last_mouse_pos = mouse_pos
		
		velocity += early_head.global_position.x * GRAVITY * delta
		
		velocity += mouse_delta * MOUSE_FORCE
		
		early_head.global_position.x += velocity * delta
	else:
		var mouse_pos = get_global_mouse_position()
		
		var mouse_delta = mouse_pos.x - last_mouse_pos.x
		last_mouse_pos = mouse_pos
		
		velocity += early_head.global_position.x * GRAVITY * delta
		
		velocity += mouse_delta * MOUSE_FORCE
		
		early_head.global_position.x += velocity * delta
