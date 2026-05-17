extends Node
class_name ButtonEffectsModule

@export var ease_type: Tween.EaseType
@export var trans_type: Tween.TransitionType
@export var anim_duration := 0.07
@export var scale_amount := Vector2(1.1, 1.1)
@export var rotation_amount := 3.0

@onready var button : Button = get_parent()

var tween: Tween

func _ready() -> void:
	button.mouse_entered.connect(_on_mouse_hovered.bind(true))
	button.mouse_exited.connect(_on_mouse_hovered.bind(false))
	
func _on_mouse_hovered(hovered: bool) -> void:
	reset_tween()
	tween.tween_property(button, "scale",
		scale_amount if hovered else Vector2.ONE, anim_duration)
	tween.tween_property(button, "rotation_degrees",
		rotation_amount * -0.5 if hovered else 0.0, anim_duration)




func reset_tween() -> void:
	if tween:
		tween.kill()
	tween = create_tween().set_ease(ease_type).set_trans(trans_type).set_parallel(true)
