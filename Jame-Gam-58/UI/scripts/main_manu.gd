extends Control

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Jame-Gam-58/Utilities/scenes/main_scene.tscn")

func _on_tutorial_pressed() -> void:
	pass

func _on_quit_pressed() -> void:
	queue_free()
