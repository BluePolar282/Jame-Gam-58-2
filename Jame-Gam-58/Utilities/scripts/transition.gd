extends CanvasLayer

@onready var color_rect = $ColorRect
@onready var animation_player = $AnimationPlayer

signal transition_finished

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	color_rect.visible = false
	animation_player.animation_finished.connect(on_animation_finished)
	
func on_animation_finished(anim_name):
	if anim_name ==  "fade-to-black":
		transition_finished.emit()
		animation_player.play("black-to-fade")
	elif anim_name ==  "black-to-fade":
		color_rect.visible = false
		get_tree().paused = false

func transition():
	get_tree().paused = true
	color_rect.visible = true
	animation_player.play("fade-to-black")
