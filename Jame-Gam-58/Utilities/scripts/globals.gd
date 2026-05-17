extends Node

var current_dir = "."
var HEALTH = 10
var tilt = 0
var is_debug_on = false
var on_cooldown := false
var stage = 1

var won = false
var lost = false
var in_main_scene = false
var tower_hit = false
var set_time = 5

var time_left: float = 0.0
var timer_active: bool = false
var stage_complete: bool = false  # flag to signal when a stage ends

signal switched_stage
signal inner_peace
signal game_over

func _physics_process(delta: float) -> void:
	if !in_main_scene:
		return
	else:
		switch_stage()
		in_main_scene = false
		
func _process(delta: float) -> void:
	if not timer_active:
		return
	time_left -= delta
	if time_left <= 0.0:
		timer_active = false
		stage_complete = true
	if tower_hit == true:
		add_time()
		tower_hit = false
		
func _ready() -> void:
	print(won)
	game_over.connect(_game_is_over)
	
func start_stage_timer():
	time_left = set_time
	timer_active = true
	stage_complete = false
	# Wait until _process flips stage_complete to true
	await get_tree().create_timer(0.05).timeout  # small poll interval
	while not stage_complete:
		await get_tree().process_frame
		
func switch_stage():
	stage = 1
	switched_stage.emit()
	print(stage)
	await start_stage_timer()
	
	stage = 2
	switched_stage.emit()
	print(stage)
	await start_stage_timer()
	
	stage = 3
	switched_stage.emit()
	print(stage)
	await start_stage_timer()
	
	stage = 4
	switched_stage.emit()
	print(stage)
	await start_stage_timer()
	
	stage = 5
	switched_stage.emit()
	print(stage)
	await start_stage_timer()
	
	inner_peace.emit()
	won = true
	await get_tree().create_timer(2).timeout
	Transition.transition()
	await Transition.transition_finished
	get_tree().change_scene_to_file("res://Jame-Gam-58/UI/scenes/endscreen.tscn")
	
func _game_is_over():
	lost = true
	await get_tree().create_timer(0.5).timeout
	Transition.transition()
	await Transition.transition_finished
	get_tree().change_scene_to_file("res://Jame-Gam-58/UI/scenes/endscreen.tscn")

func add_time():
	time_left += 5
