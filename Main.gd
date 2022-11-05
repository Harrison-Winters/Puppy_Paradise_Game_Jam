extends Node2D

var rng = RandomNumberGenerator.new()
var store_cute = 300
var puppy_texture = preload("res://art/dog_realistic.png")


func _ready():
	rng.randomize()

func _on_1Button_pressed():
	store_cute = store_cute + $Dog1.cuteness
	_addPuppy()
	
	
func _on_2Button_pressed():
	store_cute = store_cute + $Dog2.cuteness
	_addPuppy()
	
	
func _on_BothButtons_pressed():
	store_cute = store_cute + $Dog1.cuteness + $Dog2.cuteness
	_addPuppy()
	_addPuppy()
	
func _process(delta):
	$GUI/CurrCute.text = "Cuteness \n" + str(store_cute)
	
func _addPuppy():
	var visDog3 = Sprite.new()
	visDog3.texture = puppy_texture
	
	var rand_x = rng.randi_range(500, 1050)
	var rand_y = rng.randi_range(0, 600)
	
	
	visDog3.set_position(Vector2(rand_x, rand_y))
	visDog3.scale.x = 0.063
	visDog3.scale.y = 0.063
	$VisualDogs.add_child(visDog3, true)
