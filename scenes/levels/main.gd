extends Node2D

@onready var pause_menu: Control = $PauseMenu

func _ready() -> void:
	pause_menu.hide()
	
	Events.game_over.connect(_on_game_over)
	

func _on_game_over():
	pass

## Pause the game. 
var is_paused: bool = false
func pause():
	is_paused = true
	get_tree().paused = true
	pause_menu.show()


## Resume the game. 
func resume():
	is_paused = false
	get_tree().paused = false	
	pause_menu.hide()

	
## Handle input for pause/resume. 
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if is_paused:
			resume()
		else: 
			pause()
