extends CharacterBody2D

var cooldown = false
var direction = ""


func _physics_process(delta: float) -> void:
	rotate_shield()
	detect_input()
	die()
	
func rotate_shield():
	
	if direction == "left" and not cooldown:
		rotation_degrees = -90
		start_cooldown()
	
	if direction == "top left" and not cooldown:
		rotation_degrees = -45
		start_cooldown()
	
	if direction == "top" and not cooldown:
		rotation_degrees = 0
		start_cooldown()

	if direction == "top right" and not cooldown:
		rotation_degrees = 45
		start_cooldown()

	if direction == "right" and not cooldown:
		rotation_degrees = 90
		start_cooldown()

func start_cooldown():
	cooldown = true
	await get_tree().create_timer(0.1).timeout
	cooldown = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Bullet"):
		body.queue_free()
		#$screech.play()

func detect_input():
	if Input.is_action_pressed("left"):
		direction = "left"
		
	if Input.is_action_pressed("top left"):
		direction = "top left"
	
	if Input.is_action_pressed("up"):
		direction = "top"

	if Input.is_action_pressed("top right"):
		direction = "top right"

	if Input.is_action_pressed("right"):
		direction = "right"

func die():
	if Globals.HEALTH == 0:
		queue_free()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Bullet"):
		area.get_parent().queue_free()
		#$screech.play()
