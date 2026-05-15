extends Node

var current_dir = "."
var HEALTH = 10
var is_game_over = false
var tilt = 0
var is_debug_on = false

var stage = 1
signal switched_stage
signal game_over


func _ready() -> void:
	switch_stage()
	
	game_over.connect(_game_is_over)

func _game_is_over():
	is_game_over = true
	print("GAME IS NOW OVER LOSER")

func switch_stage():
	stage = 1
	switched_stage.emit()
	print(stage)
	await get_tree().create_timer(5).timeout
	stage = 2
	switched_stage.emit()
	print(stage)
	await get_tree().create_timer(5).timeout
	stage = 3
	switched_stage.emit()
	print(stage)
	await get_tree().create_timer(5).timeout
	stage = 4
	switched_stage.emit()
	print(stage)
	await get_tree().create_timer(5).timeout
	stage = 5
	switched_stage.emit()
	print(stage)
