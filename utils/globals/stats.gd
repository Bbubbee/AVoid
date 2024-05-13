extends Node


var void_score: int:
	set(new_score):
		void_score = new_score
		Events.void_score_increased.emit(void_score)



var max_hp: int = 3
@onready var hp: int = max_hp:
	set(new_hp): 
		hp = clamp(new_hp, 0, max_hp) 
		
		if hp <= 0: 
			Events.game_over.emit()
		else: 
			Events.hp_changed.emit(hp)
	

func reset_stats(): 
	hp = max_hp 
	void_score = 0 