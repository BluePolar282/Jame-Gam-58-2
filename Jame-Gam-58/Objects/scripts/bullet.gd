extends CharacterBody2D

var SPEED = 0
var stage = Globals.stage
var thwomped = false

var ragdoll_velocity = Vector2(0,-250)
const RAGDOLL_GRAVITY = 680.0

func _physics_process(delta: float) -> void:
	set_bullet_direction()
	move_and_slide()
	if thwomped:
		$Area2D.set_deferred("monitorable", false)
		ragdoll_velocity.y += RAGDOLL_GRAVITY * delta
		global_position.y += ragdoll_velocity.y * delta
		var tween = create_tween()
		tween.tween_property($AnimatedSprite2D, "modulate:a", 0.0, 0.5)
		await get_tree().create_timer(1).timeout
		queue_free()
		return
	else:
		return
		
func _ready():
	set_difficulty()
	if Globals.stage > 2 and randf() < 0.05:
		SPEED = 70
	elif stage > 4 and  randf() > 0.05:
		return

func set_bullet_direction():
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

func set_difficulty():
	if stage == 1:
		SPEED = randf_range(100, 150)
	if stage == 2:
		SPEED = randf_range(150, 300)
	if stage > 2:
		SPEED = randf_range(300, 425)
