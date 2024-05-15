extends Control

@onready var score_label: Label = $VoidScore/ScoreLabel
@onready var health_label: Label = $HealthLabel

func _ready() -> void:
	Events.void_score_increased.connect(_on_void_score_increased)
	Events.hp_changed.connect(_on_hp_changed)
	Events.game_over.connect(_on_game_over)
	
	
	health_label.text = str(Stats.hp)

func _on_void_score_increased(score):
	score_label.text = str(score)

func _on_hp_changed(new_hp): 
	health_label.text = str(new_hp)

func _on_game_over():
	SceneTransition.change_scene("res://scenes/screens/game_start_screen.tscn")
	
