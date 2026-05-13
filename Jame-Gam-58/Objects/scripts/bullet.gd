extends CharacterBody2D

var SPEED = 10000
	
func _physics_process(delta: float) -> void:
	move_and_slide()
	if is_in_group("Top Spawner"):
		velocity.y = SPEED * delta
		
	elif is_in_group("Left Spawner"):
		velocity.x = SPEED * delta
		
	elif is_in_group("Bottom Spawner"):
		velocity.y = -SPEED * delta
		
	elif is_in_group("Right Spawner"):
		velocity.x = -SPEED * delta	
