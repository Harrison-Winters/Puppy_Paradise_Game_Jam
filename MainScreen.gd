extends Node2D

func _ready():
	pass

func _on_Play_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Main.tscn")


func _on_Credits_pressed():
	get_tree().change_scene("res://Credits.tscn")


func _on_Quit_pressed():
	get_tree().quit()