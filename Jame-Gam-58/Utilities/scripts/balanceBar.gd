extends Sprite2D
@onready var early_head: Sprite2D = $earlyHead

var velocity = 0.0
var last_mouse_pos = Vector2.ZERO
const GRAVITY = 3.0
const MOUSE_FORCE = 2.5

func start_fade(timer):
	while modulate.a > 0:
		await get_tree().create_timer(timer).timeout
		modulate.a -= 0.1
	modulate.a = 0.0


func debug():
	if Input.is_action_just_pressed("debug"):
		if Globals.is_debug_on == false:
			Globals.is_debug_on = true
			show()
		else:
			Globals.is_debug_on = false
			hide()




func _ready():
	last_mouse_pos = get_global_mouse_position() 
	hide()



func _physics_process(delta: float) -> void:
	debug()
	



func _process(delta):
	if Globals.is_game_over == true:
		return
	
	Globals.tilt = remap(early_head.global_position.x - global_position.x, -4000,4000, -10, 10) 
	
	if (early_head.global_position.x - global_position.x) <= -300 or (early_head.global_position.x - global_position.x) >= 300:
		Globals.game_over.emit()
		$slipSound.play()
		start_fade(0.1)
	else:
		var mouse_pos = get_global_mouse_position()
		var mouse_delta = mouse_pos.x - last_mouse_pos.x
		last_mouse_pos = mouse_pos
		
		velocity += (early_head.global_position.x - global_position.x) * GRAVITY * delta
		velocity += mouse_delta * MOUSE_FORCE
		early_head.global_position.x += velocity * delta
		
