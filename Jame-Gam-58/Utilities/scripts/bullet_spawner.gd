extends Area2D

var bullet = preload("res://Jame-Gam-58/Objects/scenes/bullet.tscn")
var repeats := 10

func _on_timer_timeout() -> void:
	if repeats > 0:
		set_bullet_spawner()
		repeats -= 1

func spawn_bullet():
	var spawned_bullet = bullet.instantiate()
	
	add_child(spawned_bullet)
	
	if is_in_group("Top Spawner"):
		spawned_bullet.add_to_group("Top Spawner")
		
	if is_in_group("Right Spawner"):
		spawned_bullet.add_to_group("Right Spawner")
		
	if is_in_group("Bottom Spawner"):
		spawned_bullet.add_to_group("Bottom Spawner")
		
	if is_in_group("Left Spawner"):
		spawned_bullet.add_to_group("Left Spawner")

func set_bullet_amount(number1, number2, number3, number4):
	
	
	if self.is_in_group("Top Spawner"):
		repeats = number1
		print(number1)
		
	elif self.is_in_group("Right Spawner"):
		repeats = number2
		print(number2)
	elif self.is_in_group("Bottom Spawner"):
		repeats = number3
		print(number3)
	elif self.is_in_group("Left Spawner"):
		repeats = number4
		print(number4)
		
func set_bullet_delay():
	var random = randi_range(1, 4)
	set_bullet_amount(random, random, random, random)

func set_bullet_speed():
	pass

func set_bullet_spawner():
	var random = randi_range(1, 4)
	
	if random == 1:
		if is_in_group("Top Spawner"):
			spawn_bullet()
	if random == 2:
		if is_in_group("Right Spawner"):
			spawn_bullet()
	if random == 3:
		if is_in_group("Bottom Spawner"):
			spawn_bullet()
	if random == 4:
		if is_in_group("Left Spawner"):
			spawn_bullet()
