extends Control

@onready var void_label: Label = $VBoxContainer/VoidLabel


func _ready() -> void:
	void_label.text = ("Time alone: "+str(Stats.void_score))


func _on_button_pressed() -> void:
	Stats.reset_stats()
	SceneTransition.change_scene("res://scenes/levels/main.tscn")
