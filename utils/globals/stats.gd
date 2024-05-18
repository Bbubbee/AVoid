extends Node

signal show_text

"""
	The score. 
	Gain a point when a peron passes the bottom of the screen. 
	Increase the difficulty every 25 points. 
	Show a void message every 50 points. 
"""
var void_score: int:
	set(new_score):
		if hp <= 0: return
		void_score = new_score
		Events.void_score_increased.emit(void_score)
		
		# Show void's texts at different times based on the score. 
		if void_score > 300: 
			if void_score % 100 == 0: 
				show_text.emit()
		else: 
			if void_score % 75 == 0: 
				show_text.emit()
				
		# Every 25 points increase the difficulty. 
		if void_score % 25 == 0: 
				difficulty += 1 

"""
	Set the difficulty every 25 points. 
	Cap it at level 15. 
"""
signal set_difficulty(difficulty :int)
var difficulty: int = 0:
	set(new_difficulty):
		difficulty = clamp(new_difficulty, 0, 15) 	
		set_difficulty.emit(difficulty)

"""
	The players health. 
"""
signal got_hugged
var max_hp: int = 3
@onready var hp: int = max_hp:
	set(new_hp): 
		hp = clamp(new_hp, 0, max_hp) 
		
		if hp <= 0: 
			Events.game_over.emit()			
			SaveLoad.save_score(void_score)
			got_hugged.emit()
		else: 
			Events.hp_changed.emit(hp)
			got_hugged.emit()
	
func reset_stats(): 
	hp = max_hp 
	void_score = 0 
	difficulty = 0
