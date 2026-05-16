extends Label


func _ready() -> void:
	if Globals.stage == 1:
		$".".text = "sTaGe 1"
		$".".visible = true
		await get_tree().create_timer(2).timeout
		$".".visible = false
	Globals.switched_stage.connect(show_label)
		
func show_label():
		
	if Globals.stage == 2:
		$".".text = "sTaGe 2"
		$".".visible = true
		await get_tree().create_timer(2).timeout
		$".".visible = false
		
	if Globals.stage == 3:
		$".".text = "sTaGe 3"
		$".".visible = true
		await get_tree().create_timer(2).timeout
		$".".visible = false
		
	if Globals.stage == 4:
		$".".text = "sTaGe 4"
		$".".visible = true
		await get_tree().create_timer(2).timeout
		$".".visible = false
	if Globals.stage == 5:
		$".".text = "sTaGe 5"
		$".".visible = true
		await get_tree().create_timer(2).timeout
		$".".visible = false
		
		
