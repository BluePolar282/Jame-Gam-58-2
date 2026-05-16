extends Camera2D

@export var wind_speed: float = 1.0
@export var wind_strength: float = 3.0  # pixels

func _process(delta: float) -> void:
	var t = Time.get_ticks_msec() / 1000.0 * wind_speed
	offset.x = sin(t * 1.1 + 0.0) * wind_strength + sin(t * 0.7) * wind_strength * 0.5
	offset.y = sin(t * 0.9 + 1.5) + sin(t * 0.5 + 0.8) * wind_strength * 0.5
