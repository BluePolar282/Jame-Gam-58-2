extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Globals.has_won == true:
		stream.loop = true
		play()
