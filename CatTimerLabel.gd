extends Label

var meow_audio = preload("res://audio/meow.mp3")

func _process(delta):
	set_text("Cat Timer: \n" + "%d:%02d" % [floor($CatTimer.time_left / 60), int($CatTimer.time_left) % 60])
	if int($CatTimer.time_left) % 60 == 15:
		$Meow.play()



func _ready():
	pass 


