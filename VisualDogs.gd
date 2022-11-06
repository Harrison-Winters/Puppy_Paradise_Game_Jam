extends Node2D

var mov_array = []
var direc_array = []
var speed = 100.0
var screen_size = Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var children = self.get_children()
	
	for i in self.get_child_count():
		
	
		# Change Direction
		if children[i].position.x >= 650 \
			or children[i].position.x <= -100 \
			or children[i].position.y >= 400 \
			or children[i].position.y <= -100:
				if direc_array[i] == -1:
					direc_array[i] = 1
				elif direc_array[i] == 1:
					direc_array[i] = -1
		
		# vertical
		if mov_array[i] == 1:
			children[i].position.y += direc_array[i] * speed * delta
		# horizontal
		elif mov_array[i] == 0:
			children[i].position.x += direc_array[i] * speed * delta
				
	
			
	
