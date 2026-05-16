extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Globals.won == true:
		$CanvasLayer/death.visible = false
		$"CanvasLayer/inner-peace".visible
		$CanvasLayer/CenterContainer/Label.text = "Finally,
		
		
		Inner Peace..."
	elif Globals.lost == true:
		$"CanvasLayer/inner-peace".visible= false
		$CanvasLayer/death.visible
		$CanvasLayer/CenterContainer/Label.text = "PEACE DISRUPTED"
