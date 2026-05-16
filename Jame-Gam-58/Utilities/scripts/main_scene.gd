extends Node2D

func _process(delta: float) -> void:
	Globals.inner_peace.connect(victory)
	
func victory():
	get_tree().change_scene_to_file("res://Jame-Gam-58/UI/scenes/endscreen.tscn")
