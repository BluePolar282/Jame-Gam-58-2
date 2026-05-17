extends TextureProgressBar

var time_limit = 15
var elapsed = 0.0

func _process(delta):
	
	
	elapsed += delta
	value = (elapsed / time_limit) * 100.0 
