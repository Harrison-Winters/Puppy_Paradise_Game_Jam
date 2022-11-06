extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Grow.play("Grow")
	$ShakeAnim.play("Shake")
	$ScoreLabel.text = "You got " + str(Global.puppy_total) + " Puppies"
	var t = Timer.new()
	t.set_wait_time(3)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	get_tree().change_scene("res://Main.tscn")

func _on_RestartButton_pressed():
	get_tree().change_scene("res://Main.tscn")
