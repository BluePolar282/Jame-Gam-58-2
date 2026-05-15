extends Area2D

var bullet = preload("res://Jame-Gam-58/Objects/scenes/bullet.tscn")
var stage = Globals.stage

var bullet_amount = 1
var delay = false
var spawn_delay = 0.5

func _on_timer_timeout() -> void:
	set_bullet_spawner()

func spawn_bullet():
	var spawned_bullet = bullet.instantiate()
	
	if delay == false:
		add_child(spawned_bullet)
	#---------------------------------------------------
	if is_in_group("Left Spawner"):
		spawned_bullet.add_to_group("Left Spawner")
		
	if is_in_group("Top Left Spawner"):
		spawned_bullet.add_to_group("Top Left Spawner")
		
	if is_in_group("Top Spawner"):
		spawned_bullet.add_to_group("Top Spawner")
		
	if is_in_group("Top Right Spawner"):
		spawned_bullet.add_to_group("Top Right Spawner")
		
	if is_in_group("Right Spawner"):
		spawned_bullet.add_to_group("Right Spawner")
	#---------------------------------------------------
	delay = true
	await get_tree().create_timer(spawn_delay).timeout
	Globals.current_dir = "."
	delay = false

func set_bullet_spawner():
	if Globals.current_dir != ".":
		return
	
	var random = randi_range(1, 10)
	
	if random == 1:
		if is_in_group("Left Spawner"):
			Globals.current_dir = "left"
			spawn_bullet()
	if random == 2:
		if is_in_group("Top Left Spawner") and Globals.stage > 2:
			Globals.current_dir = "top left"
			spawn_bullet()
	if random == 3:
		if is_in_group("Top Spawner"):
			Globals.current_dir = "top"
			spawn_bullet()
	if random == 4:
		if is_in_group("Top Right Spawner") and Globals.stage > 2:
			Globals.current_dir = "top right"
			spawn_bullet()
	if random == 5:
		if is_in_group("Right Spawner"):
			Globals.current_dir = "right"
			spawn_bullet()

func set_difficulty():
	if stage == 1:
		$Timer.wait_time = randf_range(1, 2)
		spawn_delay = 0.5
	if stage == 2:
		$Timer.wait_time = randf_range(0.5, 1)
		spawn_delay = 0.4
	if stage == 3:
		$Timer.wait_time = randf_range(0.25, 0.5)
		spawn_delay = 0.2
	if stage == 4:
		$Timer.wait_time = randf_range(0.1, 0.3)
		spawn_delay = 0.1
	if stage == 4:
		$Timer.wait_time = randf_range(1, 2)
		spawn_delay = 0.05
