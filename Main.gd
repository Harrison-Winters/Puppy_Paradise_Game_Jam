extends Node2D

var rng = RandomNumberGenerator.new()
var store_cute = 0
var min_cute = -10
var max_cute = 10
var puppy_texture = preload("res://art/dog_realistic.png")
var puppy_texture2 = preload("res://art/puppy_realistic.png")
var puppy_texture3 = preload("res://art/large_puppy.png")

func _ready():
	rng.randomize()

func _on_1Button_pressed():
	store_cute = store_cute + $Dog1.cuteness
	_addPuppy()
	_randomize_cuteness()
	
	
func _on_2Button_pressed():
	store_cute = store_cute + $Dog2.cuteness
	_addPuppy()
	_randomize_cuteness()
	
	
func _on_BothButtons_pressed():
	store_cute = store_cute + $Dog1.cuteness + $Dog2.cuteness
	_addPuppy()
	_addPuppy()
	_randomize_cuteness()
	
func _process(delta):
	$GUI/CurrCute.text = "Cuteness \n" + str(store_cute)
	if store_cute > max_cute or store_cute < min_cute:
		get_tree().change_scene("res://LoseScreen.tscn")

	$GUI/Dog1Label.text = "Dog 1:\n" + str($Dog1.cuteness)
	$GUI/Dog2Label.text = "Dog 2:\n" + str($Dog2.cuteness)

func _randomize_cuteness():
	var rand_cute1 = rng.randi_range(6, -6)
	var rand_cute2 = rng.randi_range(6, -6)
	$Dog1.cuteness = rand_cute1
	$Dog2.cuteness = rand_cute2


	
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
	visDog3.modulate.a = 0.7
	visDog3.set_position(Vector2(rand_x, rand_y))
	visDog3.scale.x = 0.1
	visDog3.scale.y = 0.1
	
	$VisualDogs.add_child(visDog3, true)
	
	# set random value for the movement array
	# 1 = vertical
	# 0 = horizontal
	var rand_mov = rng.randi_range(0, 1)
	var nums = [-1, 1]
	var rand_direct = nums[randi() % 2]
	$VisualDogs.mov_array.push_back(rand_mov)
	$VisualDogs.direc_array.push_back(rand_direct)

# Cat Game Over
func _on_CatTimer_timeout():
	get_tree().change_scene("res://LoseScreen.tscn")
