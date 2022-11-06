extends Label
signal cat_approaching

func _process(delta):
	set_text("Cat Timer: \n" + "%d:%02d" % [floor($CatTimer.time_left / 60), int($CatTimer.time_left) % 60])
	
	if int($CatTimer.time_left) % 60 == 15:
		$CatTimer/MeowAudio.play()
		$MainAudio.pitch_scale(4)

func _ready():
	pass 


