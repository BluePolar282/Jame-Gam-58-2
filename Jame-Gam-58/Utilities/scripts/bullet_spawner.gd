extends Area2D
#On timer_timeout, the set_bullet_spawner function activates, and the timer is reset with a random wait time
#The set_bullet_spawner function randomized which shooter will activate, and make sure one doesn't activate while still shooting
var bullet = preload("res://Jame-Gam-58/Objects/scenes/bullet.tscn")

var delay := false

func _on_timer_timeout() -> void:
	set_bullet_spawner()
	$Timer.wait_time = randf_range(0.25, 0.5)
	$Timer.start()

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
	await get_tree().create_timer(0.5).timeout
	Globals.current_dir = "."
	delay = false

func set_bullet_spawner():
	if Globals.current_dir != ".":
		return
	
	var random = randi_range(1, 5)
	
	if random == 1:
		if is_in_group("Left Spawner"):
			Globals.current_dir = "left"
			spawn_bullet()
	if random == 2:
		if is_in_group("Top Left Spawner"):
			Globals.current_dir = "top left"
			spawn_bullet()
	if random == 3:
		if is_in_group("Top Spawner"):
			Globals.current_dir = "top"
			spawn_bullet()
	if random == 4:
		if is_in_group("Top Right Spawner"):
			Globals.current_dir = "top right"
			spawn_bullet()
	if random == 5:
		if is_in_group("Right Spawner"):
			Globals.current_dir = "right"
			spawn_bullet()
