extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	if Globals.won == true:
		$CanvasLayer/HBoxContainer.visible = false
		$CanvasLayer/death.visible = false
		$"CanvasLayer/inner-peace".visible
		$CanvasLayer/Label.text = "peace at last"
		await get_tree().create_timer(6).timeout
		$CanvasLayer/Label2.modulate.a = 0
		$CanvasLayer/return.modulate.a = 0
		$CanvasLayer/Label2.visible = true
		$CanvasLayer/return.visible = true
		var tween = create_tween()
		tween.tween_property($CanvasLayer/Label2, "modulate:a", 1.0, 0.5)
		tween.tween_property($CanvasLayer/return, "modulate:a", 1.0, 0.5)
		
	elif Globals.lost == true:
		$CanvasLayer/HBoxContainer.visible = true
		$"CanvasLayer/inner-peace".visible= false
		$CanvasLayer/death.visible
		$CanvasLayer/Label.text = "game over"

func _on_menu_pressed() -> void:
	Transition.transition()
	await Transition.transition_finished
	get_tree().change_scene_to_file("res://Jame-Gam-58/UI/scenes/main_manu.tscn")

func _on_retry_pressed() -> void:
	Globals.reset()
	Transition.transition()
	await Transition.transition_finished
	get_tree().change_scene_to_file("res://Jame-Gam-58/Utilities/scenes/main_scene.tscn")


func _on_return_pressed() -> void:
	Transition.transition()
	await Transition.transition_finished
	get_tree().change_scene_to_file("res://Jame-Gam-58/UI/scenes/main_manu.tscn")
