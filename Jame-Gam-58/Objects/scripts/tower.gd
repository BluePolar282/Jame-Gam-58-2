extends CharacterBody2D

var ragdoll_velocity = Vector2(0,-250)
const RAGDOLL_GRAVITY = 680.0

var currently_animating = false

func _ready() -> void:
	add_to_group("Tower")
	
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Bullet"):
		Globals.HEALTH = Globals.HEALTH - 1
		area.get_parent().queue_free()
		currently_animating = true
		$AnimatedSprite2D.play("damage")
		await get_tree().create_timer(0.15).timeout
		currently_animating = false

func _process(delta: float):
	rotation = Globals.tilt
	print(Globals.tilt)
	
	if Globals.tilt > 0.45 or Globals.tilt < -0.45 and Globals.lost == false and currently_animating == false:
		$AnimatedSprite2D.play("scared")
	
	elif currently_animating == false:
		$AnimatedSprite2D.play("default")
		
	
	if Globals.lost == true:
		$AnimatedSprite2D.play("fall")
		ragdoll_velocity.y += RAGDOLL_GRAVITY * delta
		global_position.y += ragdoll_velocity.y * delta
		return
