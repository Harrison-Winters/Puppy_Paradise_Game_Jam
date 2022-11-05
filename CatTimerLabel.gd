extends Label


func _process(delta):
	set_text("Cat Timer: \n" + "%d:%02d" % [floor($CatTimer.time_left / 60), int($CatTimer.time_left) % 60])



func _ready():
	pass 


