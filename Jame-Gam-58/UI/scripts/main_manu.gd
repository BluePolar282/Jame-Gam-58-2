extends Control
@onready var gong = $gong

func _ready() -> void:
	if Globals.has_won == true:
		print("night")
		$sunset.visible = false
		$nighttime.visible = true
	elif Globals.has_won == false:
		print("day")
		$sunset.visible = true
		$nighttime.visible = false

func _on_start_pressed() -> void:
	gong.get_parent().remove_child(gong)
	get_tree().root.add_child(gong)
	gong.play()
	Globals.reset()
	Transition.transition()
	await Transition.transition_finished
	get_tree().change_scene_to_file("res://Jame-Gam-58/Utilities/scenes/main_scene.tscn")

func _on_tutorial_pressed() -> void:
	$CanvasLayer/VBoxContainer/start.disabled = true
	$CanvasLayer/VBoxContainer/tutorial.disabled = true
	$CanvasLayer/VBoxContainer/quit.disabled = true
	
	$CanvasLayer/tutorial.visible = true
	$CanvasLayer/tutorial/exit.disabled = false
	var tween = create_tween()
	tween.tween_property($CanvasLayer/tutorial, "modulate:a", 1, 0.2)

func _on_quit_pressed() -> void:
	$CanvasLayer/VBoxContainer/start.disabled = true
	$CanvasLayer/VBoxContainer/tutorial.disabled = true
	$CanvasLayer/VBoxContainer/quit.disabled = true
	
	$CanvasLayer/ColorRect.visible = true
	$CanvasLayer/ColorRect/exit2.disabled = false
	var tween = create_tween()
	tween.tween_property($CanvasLayer/ColorRect, "modulate:a", 1, 0.2)

func _on_exit_pressed() -> void:
	$CanvasLayer/VBoxContainer/start.disabled = false
	$CanvasLayer/VBoxContainer/tutorial.disabled = false
	$CanvasLayer/VBoxContainer/quit.disabled = false
	var tween = get_tree().create_tween()
	tween.tween_property($CanvasLayer/tutorial, "modulate:a", 0.0, 0.2)
	await tween.finished
	$CanvasLayer/tutorial.visible = false
	$CanvasLayer/tutorial/exit.disabled = true

func _on_exit_2_pressed() -> void:
	$CanvasLayer/VBoxContainer/start.disabled = false
	$CanvasLayer/VBoxContainer/tutorial.disabled = false
	$CanvasLayer/VBoxContainer/quit.disabled = false
	var tween = get_tree().create_tween()
	tween.tween_property($CanvasLayer/ColorRect, "modulate:a", 0.0, 0.2)
	await tween.finished
	$CanvasLayer/ColorRect.visible = false
	$CanvasLayer/ColorRect/exit2.disabled = true
