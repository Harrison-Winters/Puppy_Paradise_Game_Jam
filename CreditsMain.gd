extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$MainMenuAudio.play()
	var t = Timer.new()
	t.set_wait_time(10)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	_unleash_Dog()

func _unleash_Dog():
	$DogAmbience.play()
	var t = Timer.new()
	t.set_wait_time(10)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	$DogAmbience.play()
	var b = Timer.new()
	b.set_wait_time(1)
	b.set_one_shot(true)
	self.add_child(b)
	b.start()
	yield(b, "timeout")
	$DogAmbience.play()
	
	_unleash_Dog()

func _on_BackButton_pressed():
	$Click.play()
	get_tree().change_scene("res://MainScreen.tscn")
