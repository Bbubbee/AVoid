extends TextureRect

const PAPER_TEXTURE_1 = preload("res://assets/paper/paper-texture.jpg")
const PAPER_TEXTURE_2 = preload("res://assets/paper/paper-texture-2.jpg")
const PAPER_TEXTURE_3 = preload("res://assets/paper/paper-texture-3.jpg")

var paper_counter = 1

func _on_change_timer_timeout():
	paper_counter += 1
	
	if paper_counter > 3: paper_counter = 1
	
	
	
	match paper_counter: 
		1:
			texture = PAPER_TEXTURE_1
		2: 
			texture = PAPER_TEXTURE_2
		3: 
			texture = PAPER_TEXTURE_3
	
	
