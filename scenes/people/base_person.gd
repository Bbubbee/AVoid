extends Area2D

var person: Person = preload("res://data/people/rav.tres")


func init(new_person: Person): 
	person = new_person


func _physics_process(_delta: float) -> void:
	if not person: return
	
	position.y += person.speed/100

	# Free person.
	if position.y > Lanes.bottom: 
		call_deferred('destroy')

func destroy(): 
	Stats.void_score += 1
	queue_free()
