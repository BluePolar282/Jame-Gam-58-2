extends CharacterBody2D

var SPEED = 300

func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO

	if is_in_group("Left Spawner"):
		direction.x = 1

	if is_in_group("Top Left Spawner"):
		direction.x = 1
		direction.y = 1

	if is_in_group("Top Spawner"):
		direction.y = 1

	if is_in_group("Top Right Spawner"):
		direction.x = -1
		direction.y = 1

	if is_in_group("Right Spawner"):
		direction.x = -1

	velocity = direction.normalized() * SPEED

	move_and_slide()
