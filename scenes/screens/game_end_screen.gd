extends Control



@onready var highscore_label: Label = $VBoxContainer/HighscoreLabel


func _ready() -> void:
	highscore_label.text = "Highscore: " + str(SaveLoad.highest_score)


func _on_button_pressed() -> void:
	SceneTransition.change_scene("res://scenes/levels/main.tscn")

