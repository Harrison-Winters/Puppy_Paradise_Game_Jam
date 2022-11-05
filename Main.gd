extends Node2D

var store_cute = 300


func _ready():
	pass

func _on_1Button_pressed():
	store_cute = store_cute + $Dog1.cuteness
	
func _process(delta):
	$GUI/CurrCute.text = "Cuteness \n" + str(store_cute)
	
