extends CharacterBody2D

var ragdoll_velocity = Vector2(0,-250)
const RAGDOLL_GRAVITY = 680.0



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
	if Globals.is_game_over == true:
		print("you died")
		await get_tree().create_timer(55.8).timeout
		queue_free()

func _process(delta: float):
	rotation = Globals.tilt
	if Globals.is_game_over == true:
		ragdoll_velocity.y += RAGDOLL_GRAVITY * delta
		global_position.y += ragdoll_velocity.y * delta
		return
