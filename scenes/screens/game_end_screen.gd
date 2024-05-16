extends Control



@onready var highscore_label: Label = $VBoxContainer/HighscoreLabel


func _ready() -> void:
	highscore_label.text = "Highscore: " + str(SaveLoad.highest_score)


func _on_button_pressed() -> void:
	SceneTransition.change_scene("res://scenes/levels/main.tscn")

@onready var void_profile = $VoidProfile

var f: int = 0
func _on_animation_timer_timeout():
	f += 1
	if f > 2: f = 1
	void_profile.frame = f


func _input(event: InputEvent) -> void:
	if event.is_action_pressed('enter'):
		_on_button_pressed()
