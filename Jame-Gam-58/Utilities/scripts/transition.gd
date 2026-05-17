extends CanvasLayer

@onready var color_rect = $ColorRect
@onready var animation_player = $AnimationPlayer
var won = false

signal transition_finished

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	color_rect.visible = false
	animation_player.animation_finished.connect(on_animation_finished)
	if Globals.won:
		won = true
	
func on_animation_finished(anim_name):
	if anim_name ==  "fade-to-black":
		transition_finished.emit()
		animation_player.play("black-to-fade")
	elif anim_name ==  "black-to-fade":
		color_rect.visible = false
		
	if anim_name == "fade-to-white":
		transition_finished.emit()
		animation_player.play("white-to-fade")
	elif anim_name ==  "white-to-fade":
		color_rect.visible = false

func transition():
	print(Globals.won)
	color_rect.visible = true
	if Globals.won:
		animation_player.play("fade-to-white")
	elif !Globals.won:
		animation_player.play("fade-to-black")
