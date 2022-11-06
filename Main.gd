extends Node2D

var rng = RandomNumberGenerator.new()
var store_cute = 0
var min_cute = -10
var max_cute = 10
var vis_puppy_texture = preload("res://art/dog_realistic.png")
var vis_puppy_texture2 = preload("res://art/puppy_realistic.png")
var vis_puppy_texture3 = preload("res://art/large_puppy.png")
var puppy_texture1 = preload("res://art/puppy1.png")
var puppy_texture2 = preload("res://art/puppy2.png")
var puppy_texture3 = preload("res://art/puppy3.png")
#var global = get_tree().get_node("Global")

func _ready():
	$MainAudio.play()
	_dog_Bark_Loop()
	rng.randomize()
	Global.puppy_total = 0
	$Dog1.cuteness = rng.randi_range(-4, 4)
	$Dog2.cuteness = rng.randi_range(-4, 4)
	$ResetTimer.start()
	
	
func _dog_Bark_Loop():
	var t = Timer.new()
	t.set_wait_time(10)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	$Bark.play()
	var b = Timer.new()
	b.set_wait_time(1)
	b.set_one_shot(true)
	self.add_child(t)
	b.start()
	yield(b, "timeout")
	$Bark.play()
	var bc = Timer.new()
	bc.set_wait_time(1)
	bc.set_one_shot(true)
	self.add_child(t)
	bc.start()
	yield(bc, "timeout")
	
	_dog_Bark_Loop()
	

func _on_1Button_pressed():
	$DoorBell.play()
	_start_Bark_Loop()
	store_cute = store_cute + $Dog1.cuteness
	_addPuppy()
	_randomize_cuteness()
	_change_puppy_sprites()
	$ResetTimer.start()
	
	
func _on_2Button_pressed():
	$DoorBell.play()
	_start_Bark_Loop()
	store_cute = store_cute + $Dog2.cuteness
	_addPuppy()
	_randomize_cuteness()
	_change_puppy_sprites()
	$ResetTimer.start()
	
	
func _on_BothButtons_pressed():
	$DoorBell.play()
	_start_Bark_Loop()
	store_cute = store_cute + $Dog1.cuteness + $Dog2.cuteness
	_addPuppy()
	_addPuppy()
	_randomize_cuteness()
	_change_puppy_sprites()
	$ResetTimer.start()
	
func _process(delta):
	$GUI/CurrCute.text = "\n" + str(store_cute)
	if store_cute > max_cute:
		get_tree().change_scene("res://LoseScreenTooCute.tscn")
	elif store_cute < min_cute:
		get_tree().change_scene("res://LoseScreen.tscn")

	$GUI/Dog1Label.text = "\n" + str($Dog1.cuteness)
	$GUI/Dog2Label.text = "\n" + str($Dog2.cuteness)
	
	# If you're in a guaranteed loss situation,
	# Remove the Close Door Button
#	if (store_cute + $Dog1.cuteness > max_cute or store_cute + $Dog1.cuteness < min_cute) \
#		and (store_cute + $Dog2.cuteness > max_cute or store_cute + $Dog2.cuteness < min_cute) \
#		and (store_cute + $Dog1.cuteness + $Dog2.cuteness > max_cute or store_cute + $Dog1.cuteness + $Dog2.cuteness < min_cute):
#			$DoorButton.visible = false;

func _randomize_cuteness():
	var rand_cute1 = rng.randi_range(8, -8)
	var rand_cute2 = rng.randi_range(8, -8)
	$Dog1.cuteness = rand_cute1
	$Dog2.cuteness = rand_cute2


# Puts the puppies on screen
func _addPuppy():
	var visDog3 = Sprite.new()
	var pup_t
	
	var rand_x = rng.randi_range(20, 300)
	var rand_y = rng.randi_range(1, 300)
	var rand_p = rng.randi_range(0, 2)
	
	match rand_p:
		0:
			pup_t = vis_puppy_texture
		1:
			pup_t = vis_puppy_texture2
		2:
			pup_t = vis_puppy_texture3
	
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
	
	# Increase the grand total of puppies
	Global.puppy_total += 1

# Cat Game Over
func _on_CatTimer_timeout():
	get_tree().change_scene("res://CatLoseScreen.tscn")
	
# Set Random Puppy Sprites
func _change_puppy_sprites():
	var rand_s1 = rng.randi_range(0, 2)
	var rand_s2 = rng.randi_range(0, 2)
	
	match rand_s1:
		0:
			$GUI/PuppySprite1.texture = puppy_texture1
		1:
			$GUI/PuppySprite1.texture = puppy_texture2
		2:
			$GUI/PuppySprite1.texture = puppy_texture3
			
	match rand_s2:
		0:
			$GUI/PuppySprite2.texture = puppy_texture1
		1:
			$GUI/PuppySprite2.texture = puppy_texture2
		2:
			$GUI/PuppySprite2.texture = puppy_texture3
	
	# Change the scale of the texture
	$GUI/PuppySprite1.scale.x = 0.1
	$GUI/PuppySprite1.scale.y = 0.1
	$GUI/PuppySprite2.scale.x = 0.1
	$GUI/PuppySprite2.scale.y = 0.1
	
	
func _on_DoorButton_pressed():
	$Click.play()
	get_tree().change_scene("res://WinScreen.tscn")


func _on_CatTimerLabel_cat_approaching():
	$GUI/CatApproach/Popup.play("Popups")
	$MainAudio.set_pitch_scale(2)


func _on_ResetTimer_timeout():
	_change_puppy_sprites()
	_randomize_cuteness()

func _start_Bark_Loop():
	var t = Timer.new()
	t.set_wait_time(10)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")

