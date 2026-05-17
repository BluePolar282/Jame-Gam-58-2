extends TextureProgressBar

func _process(delta):
	var stages_done = Globals.stage - 1  # completed stages
	var stage_progress = 1.0 - (Globals.time_left / 45.0)  # progress within current stage
	var total_progress = (stages_done + stage_progress) / 5.0
	value = total_progress * 100.0
