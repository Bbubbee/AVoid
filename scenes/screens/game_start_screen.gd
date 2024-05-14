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
