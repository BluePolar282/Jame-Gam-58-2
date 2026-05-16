extends Label

func _ready() -> void:
	modulate.a = 0.0
	Globals.switched_stage.connect(show_label)
	if Globals.stage == 1:
		show_label()

func show_label():
	text = "stage %d" % Globals.stage

	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 1.0, 0.5)
	tween.tween_interval(2.0)                         
	tween.tween_property(self, "modulate:a", 0.0, 0.5)  
		
		
