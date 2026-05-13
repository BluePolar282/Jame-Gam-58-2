extends CharacterBody2D

var SPEED = randf_range(250, 450)

func _ready():
	if randf() < 0.01:
		SPEED = 100
	else:
		SPEED = randf_range(250, 450)
		
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
