extends Node2D

var mov_array = []
var speed = 100.0
var direc_array = []


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var children = self.get_children()
	
	for i in self.get_child_count():
		# vertical
		if mov_array[i] == 1:
			children[i].position.y += speed * delta
		# horizontal
		elif mov_array[i] == 0:
			children[i].position.x += speed * delta
	
		# Change Direction
		if children[i].position.x >= screen_size.x  \
			or children[i].position.x <= 0 \
			or children[i].position.y >= screen_size.y \
			or children[i].position.y <= 0:
				
	
			
	
