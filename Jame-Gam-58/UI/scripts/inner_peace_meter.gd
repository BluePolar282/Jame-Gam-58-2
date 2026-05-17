extends Node2D

@onready var hand = $Line2D

var time_remaining: float = 300.0  

func _process(delta: float) -> void:
	if time_remaining <= 0:
		return
		
	time_remaining -= delta
	hand.rotation = deg_to_rad((time_remaining / 300) * -180.0)
