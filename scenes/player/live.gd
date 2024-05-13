extends PlayerState


func on_input(event: InputEvent):
	if event.is_action_pressed("left"):
		actor.current_lane -= 1 
	elif event.is_action_pressed("right"):
		actor.current_lane += 1
	
