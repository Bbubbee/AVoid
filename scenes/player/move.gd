extends PlayerState


func physics_process(delta: float) -> void:
	actor.handle_movement(delta) 
	actor.move_and_slide()
