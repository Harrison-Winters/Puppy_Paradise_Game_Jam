extends Node2D

func _ready():
	$LoseAudio.play()
	$ShakeAnim.play("Shake")
	$LoseAnim.play("Shake")
	$CatNears.play("CatNears")
	var t = Timer.new()
	t.set_wait_time(3)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	get_tree().change_scene("res://Main.tscn")

func _on_RestartButton_pressed():
	get_tree().change_scene("res://Main.tscn")
