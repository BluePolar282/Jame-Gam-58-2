extends Label

var tween = create_tween()

func _ready() -> void:
	if Globals.stage == 1:
		$".".text = "sTaGe 1"
		tween.tween_property($Label, "modulate:a", 1.0, 1.0)
		await get_tree().create_timer(3).timeout
		tween.tween_property($Sprite2D, "modulate:a", 0.0, 1.0)
		$".".visible = false
	Globals.switched_stage.connect(show_label)
		
func show_label():
		
	if Globals.stage == 2:
		$".".text = "sTaGe 2"
		tween.tween_property($Label, "modulate:a", 1.0, 1.0)
		await get_tree().create_timer(2).timeout
		tween.tween_property($Sprite2D, "modulate:a", 0.0, 1.0) 
		
	if Globals.stage == 3:
		$".".text = "sTaGe 3"
		tween.tween_property($Label, "modulate:a", 1.0, 1.0)
		await get_tree().create_timer(2).timeout
		tween.tween_property($Sprite2D, "modulate:a", 0.0, 1.0) 
		
	if Globals.stage == 4:
		$".".text = "sTaGe 4"
		tween.tween_property($Label, "modulate:a", 1.0, 1.0)
		await get_tree().create_timer(2).timeout
		tween.tween_property($Sprite2D, "modulate:a", 0.0, 1.0)
		
	if Globals.stage == 5:
		$".".text = "sTaGe 5"
		tween.tween_property($Label, "modulate:a", 1.0, 1.0)
		await get_tree().create_timer(2).timeout
		tween.tween_property($Sprite2D, "modulate:a", 0.0, 1.0)
		
		
