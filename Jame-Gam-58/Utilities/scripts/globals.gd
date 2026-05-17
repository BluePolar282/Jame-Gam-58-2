extends Node

var current_dir = "."
var HEALTH = 10
var tilt = 0
var is_debug_on = false
var on_cooldown := false
var stage = 1
var _stage_gen := 0

var has_won := false

var won = false
var lost = false
var in_main_scene = false
var tower_hit = false
var set_time = 45

var time_left: float = 0.0
var timer_active: bool = false
var stage_complete: bool = false  # flag to signal when a stage ends

signal switched_stage
signal inner_peace
signal game_over

func _physics_process(delta: float) -> void:
	if has_won == true:
		print ("has won")
	
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
	time_left = 30
	timer_active = true
	stage_complete = false
	# Wait until _process flips stage_complete to true
	await get_tree().create_timer(0.05).timeout  # small poll interval
	while not stage_complete:
		await get_tree().process_frame
		
func switch_stage():
	_stage_gen += 1
	var gen := _stage_gen  # capture current generation
	
	stage = 1
	switched_stage.emit()
	print(stage)
	await start_stage_timer()
	if _stage_gen != gen: return
	
	stage = 2
	switched_stage.emit()
	print(stage)
	await start_stage_timer()
	if _stage_gen != gen: return
	
	stage = 3
	switched_stage.emit()
	print(stage)
	await start_stage_timer()
	if _stage_gen != gen: return
	
	stage = 4
	switched_stage.emit()
	print(stage)
	await start_stage_timer()
	if _stage_gen != gen: return
	
	stage = 5
	switched_stage.emit()
	print(stage)
	await start_stage_timer()
	if _stage_gen != gen: return
	
	if !lost:
		inner_peace.emit()
		won = true
		await get_tree().create_timer(2).timeout
		Transition.transition()
		await Transition.transition_finished
		get_tree().change_scene_to_file("res://Jame-Gam-58/UI/scenes/endscreen.tscn")
		var has_won = true
	
func _game_is_over():
	lost = true
	await get_tree().create_timer(0.5).timeout
	Transition.transition()
	await Transition.transition_finished
	get_tree().change_scene_to_file("res://Jame-Gam-58/UI/scenes/endscreen.tscn")

func add_time():
	time_left += 5

func reset():
	current_dir = "."
	HEALTH = 10
	tilt = 0
	is_debug_on = false
	on_cooldown = false
	stage = 1
	won = false
	lost = false
	in_main_scene = false
	tower_hit = false
	set_time = 5
	timer_active = false
	stage_complete = true  # unblocks any awaiting start_stage_timer()
	_stage_gen += 1        # invalidates the running switch_stage() coroutine
	
