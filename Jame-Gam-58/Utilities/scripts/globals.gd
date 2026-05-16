extends Node

var current_dir = "."
var HEALTH = 10
var on_cooldown := false

var stage = 1
signal switched_stage
signal inner_peace

func _ready() -> void:
	switch_stage()

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
	
