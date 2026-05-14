extends CharacterBody2D

func _physics_process(delta: float) -> void:
	die()

func _ready() -> void:
	add_to_group("Tower")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Bullet"):
		Globals.HEALTH = Globals.HEALTH - 1
		body.queue_free()
		$AnimatedSprite2D.modulate = Color(100, 100, 100)
		await get_tree().create_timer(0.1).timeout
		$AnimatedSprite2D.modulate = Color.WHITE
		
func die():
	if Globals.HEALTH <= 0:
		queue_free()
		print("you died")
