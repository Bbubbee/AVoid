extends PlayerState


func physics_process(_delta):
	actor.move_and_slide()
	

func on_input(_event: InputEvent): 
	var moving = Input.get_axis('left', 'right')
	if moving: transition.emit(self, "move") 
