extends Node2D

var rng = RandomNumberGenerator.new()
var store_cute = 300
var puppy_texture = preload("res://art/dog_realistic.png")
var puppy_texture2 = preload("res://art/puppy_realistic.png")
var puppy_texture3 = preload("res://art/large_puppy.png")

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
	var pup_t
	
	var rand_x = rng.randi_range(500, 1050)
	var rand_y = rng.randi_range(0, 600)
	var rand_p = rng.randi_range(0, 2)
	
	match rand_p:
		0:
			pup_t = puppy_texture
		1:
			pup_t = puppy_texture2
		2:
			pup_t = puppy_texture3
	
	visDog3.texture = pup_t
	
	visDog3.set_position(Vector2(rand_x, rand_y))
	visDog3.scale.x = 0.063
	visDog3.scale.y = 0.063
	$VisualDogs.add_child(visDog3, true)
