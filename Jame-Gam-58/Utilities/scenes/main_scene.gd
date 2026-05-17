extends Node2D

func _ready() -> void:
	Globals.in_main_scene = true
	if Globals.has_won == true:
		print("night")
		$sunSet.visible = false
		$nightTime.visible = true
	elif Globals.has_won == false:
		print("day")
		$sunSet.visible = true
		$nightTime.visible = false
