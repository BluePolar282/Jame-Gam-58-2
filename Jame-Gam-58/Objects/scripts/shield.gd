extends CharacterBody2D
@onready var shieldBlock: AudioStreamPlayer2D = $shieldBlock


var cooldown = false
var direction = ""
var target_rotation = 0.0
const ROTATE_SPEED = 45.0 

func _physics_process(delta: float) -> void:
	detect_input()
	rotation_degrees = lerp(rotation_degrees, target_rotation, ROTATE_SPEED * delta)

func rotate_shield():
	if direction == "left" and not cooldown:
		target_rotation = -90.0
		start_cooldown()
	if direction == "top left" and not cooldown:
		target_rotation = -45.0
		start_cooldown()
	if direction == "top" and not cooldown:
		target_rotation = 0.0
		start_cooldown()
	if direction == "top right" and not cooldown:
		target_rotation = 45.0
		start_cooldown()
	if direction == "right" and not cooldown:
		target_rotation = 90.0
		start_cooldown()

func start_cooldown():
	cooldown = true
	await get_tree().create_timer(0.1).timeout
	cooldown = false

func detect_input():
	if Input.is_action_pressed("left"):
		direction = "left"
		rotate_shield()
	if Input.is_action_pressed("top left"):
		direction = "top left"
		rotate_shield()
	if Input.is_action_pressed("up"):
		direction = "top"
		rotate_shield()
	if Input.is_action_pressed("top right"):
		direction = "top right"
		rotate_shield()
	if Input.is_action_pressed("right"):
		direction = "right"
		rotate_shield()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Bullet"):
		shieldBlock.pitch_scale = randf_range(0.7, 1.2)
		shieldBlock.play()
		body.thwomped = true

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Bullet"):
		shieldBlock.pitch_scale = randf_range(0.7, 1.2)
		shieldBlock.play()
		area.get_parent().thwomped = true
		
