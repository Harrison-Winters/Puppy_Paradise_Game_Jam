extends Label
signal cat_approaching

func _process(_delta):
	set_text("Cat Timer: \n" + "%d:%02d" % [floor($CatTimer.time_left / 60), int($CatTimer.time_left) % 60])
	
	if int($CatTimer.time_left) % 60 == 15:
		$CatTimer/MeowAudio.play()
		emit_signal("cat_approaching")

func _ready():
	pass 


