extends Node


var void_score: int:
	set(new_score):
		void_score = new_score
		Events.void_score_increased.emit(void_score)
		
		# Every 25 points increase the difficulty. 
		if void_score % 25 == 0: 
			difficulty += 1 
	
signal set_difficulty(difficulty :int)
var difficulty: int = 0:
	set(new_difficulty):
		difficulty = clamp(new_difficulty, 0, 4) 	
		set_difficulty.emit(difficulty)

var max_hp: int = 3
@onready var hp: int = max_hp:
	set(new_hp): 
		hp = clamp(new_hp, 0, max_hp) 
		
		if hp <= 0: 
			SaveLoad.save_score(void_score)
			Events.game_over.emit()
		else: 
			Events.hp_changed.emit(hp)
	

func reset_stats(): 
	hp = max_hp 
	void_score = 0 
	difficulty = 0
