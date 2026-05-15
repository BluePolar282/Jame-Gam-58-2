extends Sprite2D
@onready var early_head: Sprite2D = $earlyHead

var velocity = 0.0
var last_mouse_pos = Vector2.ZERO
const GRAVITY = 3.0
const MOUSE_FORCE = 2.5

func start_fade(timer):
	await get_tree().create_timer(timer).timeout
	modulate.a -= 0.05


func _ready():
	last_mouse_pos = get_global_mouse_position() 

func _process(delta):
	if Globals.is_game_over == true:
		return
	
	if (early_head.global_position.x - global_position.x) <= -300 or (early_head.global_position.x - global_position.x) >= 300:
		Globals.game_over.emit()
		start_fade(0.3)
	else:
		var mouse_pos = get_global_mouse_position()
		var mouse_delta = mouse_pos.x - last_mouse_pos.x
		last_mouse_pos = mouse_pos
		
		velocity += (early_head.global_position.x - global_position.x) * GRAVITY * delta
		velocity += mouse_delta * MOUSE_FORCE
		early_head.global_position.x += velocity * delta
		
