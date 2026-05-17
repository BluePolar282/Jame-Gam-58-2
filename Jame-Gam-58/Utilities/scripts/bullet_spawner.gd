extends Area2D

var bullet = preload("res://Jame-Gam-58/Objects/scenes/bullet.tscn")
var bouncy_bullet = preload("res://Jame-Gam-58/Objects/scenes/bouncing_bullet.tscn")
var spawner_group := ""
var spawner_dir := ""
var bouncy_in_scene = false
var stage = Globals.stage

func _ready() -> void:
	for g in ["Left Spawner", "Top Left Spawner", "Top Spawner", "Top Right Spawner", "Right Spawner"]:
		if is_in_group(g):
			spawner_group = g
			break
	spawner_dir = set_direction(spawner_group)
	set_difficulty()
	$Timer.start()

func set_direction(g: String) -> String:
	match g:
		"Left Spawner":      return "left"
		"Top Left Spawner":  return "top left"
		"Top Spawner":       return "top"
		"Top Right Spawner": return "top right"
		"Right Spawner":     return "right"
	return "."

func _on_timer_timeout() -> void:
	set_difficulty()
	spawn_bullets()

func spawn_bullets() -> void:
	var rand = randf()
	rand

	if Globals.on_cooldown:
		return
	if spawner_group in ["Top Left Spawner", "Top Right Spawner"] and Globals.stage < 2:
		return

	var fire_chance := set_bullet_chance()
	if randf() > fire_chance:
		return

	var spawned_bullet = bullet.instantiate()
	var spawned_bouncy_bullet = bouncy_bullet.instantiate()
	
	if Globals.stage <= 2:
		add_child(spawned_bullet)
		spawned_bullet.add_to_group(spawner_group)
	
	if Globals.stage == 3:
		if rand > 0.2:
			add_child(spawned_bullet)
			spawned_bullet.add_to_group(spawner_group)
		if rand < 0.1:
			add_child(spawned_bouncy_bullet)
			spawned_bouncy_bullet.add_to_group(spawner_group)
			bouncy_in_scene = true
			await get_tree().create_timer(1.5).timeout
			bouncy_in_scene = false
	elif Globals.stage > 3:
		if rand > 0.4:
			add_child(spawned_bullet)
			spawned_bullet.add_to_group(spawner_group)
		if rand < 0.2:
			add_child(spawned_bouncy_bullet)
			spawned_bouncy_bullet.add_to_group(spawner_group)
			bouncy_in_scene = true
			await get_tree().create_timer(1.5).timeout
			bouncy_in_scene = false

	
	Globals.current_dir = spawner_dir

	Globals.on_cooldown = true
	await get_tree().create_timer(0.5).timeout
	Globals.on_cooldown = false

func set_bullet_chance() -> float:
	match Globals.stage:
		1: return 0.4
		2: return 0.45
		3: return 0.5
		4: return 0.55
		5: return 0.6
	return 0.4

func set_difficulty() -> void:
	if stage == 1 and !bouncy_in_scene:
		$Timer.wait_time = randf_range(1, 2)
	if stage == 2 and !bouncy_in_scene:
		$Timer.wait_time = randf_range(0.7, 1)
	if stage == 3 and !bouncy_in_scene:
		$Timer.wait_time = randf_range(0.4, 0.9)
	if stage > 4 and !bouncy_in_scene:
		$Timer.wait_time = randf_range(0.2, 0.4)
	elif stage > 0 and bouncy_in_scene:
		$Timer.wait_time = randf_range(1, 2)
