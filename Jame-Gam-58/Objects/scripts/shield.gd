extends CharacterBody2D

var cooldown = false

func _physics_process(delta: float) -> void:
	rotate_shield()
	
func rotate_shield():
	if Input.is_action_pressed("down") and not cooldown:
		rotation_degrees = 0
		start_cooldown()
	elif Input.is_action_pressed("up") and not cooldown:
		rotation_degrees = 180
		start_cooldown()
	elif Input.is_action_pressed("left") and not cooldown:
		rotation_degrees = -90
		start_cooldown()
	elif Input.is_action_pressed("right") and not cooldown:
		rotation_degrees = 90
		start_cooldown()

func start_cooldown():
	cooldown = true
	await get_tree().create_timer(0.15).timeout
	cooldown = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Bullet"):
		body.queue_free()
