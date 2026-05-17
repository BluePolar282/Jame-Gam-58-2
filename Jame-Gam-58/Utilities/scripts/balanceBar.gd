extends Sprite2D
@onready var early_head: Sprite2D = $earlyHead
@onready var slip: AudioStreamPlayer2D = $slipSound
@onready var fall: AudioStreamPlayer2D = $cartoonFall
var velocity = 0.0
const GRAVITY = 1.7
const MOUSE_FORCE = 2.9

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

func nudge(amount: float):
	velocity += amount

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	hide()

func _input(event):
	if event is InputEventKey and event.keycode == KEY_ESCAPE:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	if event is InputEventMouseMotion:
		if Globals.lost == false:
			velocity += event.relative.x * MOUSE_FORCE

func _physics_process(delta: float) -> void:
	debug()

func _process(delta):
	if Globals.lost == true:
		return
	
	Globals.tilt = remap(early_head.global_position.x - global_position.x, -3000, 3000, -5, 5)
	
	if (early_head.global_position.x - global_position.x) <= -425 or (early_head.global_position.x - global_position.x) >= 425:
		Globals.game_over.emit()
		slip.play()
		await get_tree().create_timer(0.2).timeout
		fall.get_parent().remove_child(fall)
		get_tree().root.add_child(fall)
		fall.play()
	else:
		velocity += (early_head.global_position.x - global_position.x) * GRAVITY * delta
		early_head.global_position.x += velocity * delta
