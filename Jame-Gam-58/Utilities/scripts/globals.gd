extends Node

var current_dir = "."
var HEALTH = 10
var tilt = 0
var is_debug_on = false
var on_cooldown := false
var stage = 1

var won = false
var lost = false

signal switched_stage
signal inner_peace
signal game_over

func _ready() -> void:
	switch_stage()
	game_over.connect(_game_is_over)
	
func switch_stage():
	stage = 1
	switched_stage.emit()
	print(stage)
	await get_tree().create_timer(20).timeout
	
	stage = 2
	switched_stage.emit()
	print(stage)
	await get_tree().create_timer(40).timeout
	
	stage = 3
	switched_stage.emit()
	print(stage)
	await get_tree().create_timer(60).timeout
	
	stage = 4
	switched_stage.emit()
	print(stage)
	await get_tree().create_timer(60).timeout
	
	stage = 5
	switched_stage.emit()
	print(stage)
	await get_tree().create_timer(120).timeout
	inner_peace.emit()
	won = true
	await get_tree().create_timer(2).timeout
	Transition.transition()
	await Transition.transition_finished
	get_tree().change_scene_to_file("res://Jame-Gam-58/UI/scenes/endscreen.tscn")
	
func _game_is_over():
	won = true
	await get_tree().create_timer(2).timeout
	Transition.transition()
	await Transition.transition_finished
	get_tree().change_scene_to_file("res://Jame-Gam-58/UI/scenes/endscreen.tscn")
