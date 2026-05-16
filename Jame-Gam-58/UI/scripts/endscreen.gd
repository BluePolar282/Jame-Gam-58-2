extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Globals.won == true:
		$CanvasLayer/death.visible = false
		$"CanvasLayer/inner-peace".visible
		$CanvasLayer/CenterContainer/Label.text = "finally,
		
		
		inner peace..."
	elif Globals.lost == true:
		$"CanvasLayer/inner-peace".visible= false
		$CanvasLayer/death.visible
		$CanvasLayer/CenterContainer/Label.text = "game over"


func _on_menu_pressed() -> void:
	Transition.transition()
	await Transition.transition_finished
	get_tree().change_scene_to_file("res://Jame-Gam-58/UI/scenes/main_manu.tscn")


func _on_retry_pressed() -> void:
	Transition.transition()
	await Transition.transition_finished
	get_tree().change_scene_to_file("res://Jame-Gam-58/Utilities/scenes/main_scene.tscn")
