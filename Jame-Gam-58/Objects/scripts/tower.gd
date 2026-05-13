extends CharacterBody2D

var HEALTH = 100
func _physics_process(delta: float) -> void:
	die()

func _ready() -> void:
	add_to_group("Tower")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Bullet"):
		HEALTH = HEALTH - 1
		print(HEALTH)
		body.queue_free()
		
func die():
	if HEALTH <= 0:
		queue_free()
		print("you died")
