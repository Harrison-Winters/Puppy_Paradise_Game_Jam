extends Node2D

func _ready():
	$Bounce.play("BounceAnim")
#	$AnimationPlayer.play("New Anim (2)")
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

func _on_Play_pressed():
	$Click.play()
	get_tree().change_scene("res://Main.tscn")


func _on_Credits_pressed():
	$Click.play()
	get_tree().change_scene("res://CreditsMain.tscn")


func _on_Quit_pressed():
	$Click.play()
	get_tree().quit()


func _on_Tutorial_pressed():
	$Click.play()
	get_tree().change_scene("res://Tutorial.tscn")
