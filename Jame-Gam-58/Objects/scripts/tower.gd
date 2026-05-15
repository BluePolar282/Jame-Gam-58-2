extends CharacterBody2D

func _physics_process(delta: float) -> void:
	die()

func _ready() -> void:
	add_to_group("Tower")
	
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Bullet"):
		Globals.HEALTH = Globals.HEALTH - 1
		area.get_parent().queue_free()
		$AnimatedSprite2D.modulate = Color(100, 100, 100)
		await get_tree().create_timer(0.1).timeout
		$AnimatedSprite2D.modulate = Color.WHITE

func die():
	if Globals.HEALTH <= 0:
		queue_free()
		print("you died")
