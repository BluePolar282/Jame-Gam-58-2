extends PointLight2D


func _process(delta: float) -> void:
	if !Globals.won:
		return
	energy += delta * 5.0
