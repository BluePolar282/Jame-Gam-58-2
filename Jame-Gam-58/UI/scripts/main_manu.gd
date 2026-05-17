extends Control


func _on_start_pressed() -> void:
	Globals.reset()
	Transition.transition()
	await Transition.transition_finished
	get_tree().change_scene_to_file("res://Jame-Gam-58/Utilities/scenes/main_scene.tscn")

func _on_tutorial_pressed() -> void:
	$CanvasLayer/tutorial.visible = true
	$CanvasLayer/tutorial/exit.disabled = false
	var tween = create_tween()
	tween.tween_property($CanvasLayer/tutorial, "modulate:a", 1, 0.2)

func _on_quit_pressed() -> void:
	get_tree().queue_free()

func _on_exit_pressed() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($CanvasLayer/tutorial, "modulate:a", 0.0, 0.2)
	await tween.finished
	$CanvasLayer/tutorial.visible = false
	$CanvasLayer/tutorial/exit.disabled = true
