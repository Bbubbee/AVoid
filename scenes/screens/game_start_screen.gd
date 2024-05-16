extends Control

"""
	The game doesn't start until you stop. 
"""

@onready var void_label: Label = $VBoxContainer/VoidLabel
@onready var highscore_label: Label = $VBoxContainer/HighscoreLabel


func _ready() -> void:
	void_label.text = ("Time alone: "+str(Stats.void_score))
	highscore_label.text = "Highscore: " + str(SaveLoad.highest_score)


func _on_button_pressed() -> void:
	Stats.reset_stats()
	SceneTransition.change_scene("res://scenes/levels/main.tscn")


func _on_main_menu_button_pressed() -> void:
	Stats.reset_stats()
	SceneTransition.change_scene("res://scenes/screens/game_end_screen.tscn")
	
@onready var hug = $Hug
var f: int = 0
func _on_animation_timer_timeout():
	f += 1
	if f > 3: f = 1
	hug.frame = f

@onready var main_menu_button: Button = $VBoxContainer/MainMenuButton
@onready var restart_button: Button = $VBoxContainer/RestartButton

func _input(event: InputEvent) -> void:
	if event.is_action_pressed('enter'):
		_on_button_pressed()
	if event.is_action_pressed('ui_cancel'):
		_on_main_menu_button_pressed()
