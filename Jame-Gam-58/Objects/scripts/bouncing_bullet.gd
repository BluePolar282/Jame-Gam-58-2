extends CharacterBody2D

var SPEED = 0
var stage = Globals.stage

var _is_bouncing := false
var tween: Tween = null
var direction = Vector2.ZERO
var finished = false

@export var bounce_strength := 200
@export var bounce_duration := 1
@export var return_duration := 1

func _physics_process(delta: float) -> void:
	set_bullet_direction()
	if not _is_bouncing:
		velocity = direction.normalized() * SPEED
	move_and_slide()
	
func _ready():
	set_difficulty()
		
func set_bullet_direction():
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

func set_difficulty():
	if stage == 1:
		SPEED = randf_range(100, 150)
	if stage == 2:
		SPEED = randf_range(150, 300)
	if stage > 2 :
		SPEED = randf_range(300, 400)

#--------------------------------------------------------

func _bounce(direction: Vector2) -> void:
	_is_bouncing = true
	var origin = global_position

	if tween and is_instance_valid(tween):
		tween.kill()

	tween = create_tween()
	tween.tween_property(self, "global_position", origin + direction * bounce_strength, bounce_duration)\
		.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "global_position", origin, return_duration)\
		.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	finished = true
	
func _on_area_2d_area_entered(other_area: Area2D) -> void:
	if other_area.is_in_group("Shield") and !finished:
		_bounce((global_position - other_area.global_position).normalized())
	elif other_area.is_in_group("Shield") and finished:
		queue_free()
	elif other_area.is_in_group("Tower"):
		queue_free()
