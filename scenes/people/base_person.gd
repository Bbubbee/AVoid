extends Area2D

var person: Person = preload("res://data/people/rav.tres")
@onready var sprite: Sprite2D = $Sprite

var difficulty_modifier: float 


func _ready() -> void:
	difficulty_modifier = Stats.difficulty
	set_physics_process(false)

func init(new_person: Person): 
	person = new_person
	
	# Calculate speed. 
	sprite.texture = person.texture
	
	set_physics_process(true)
	

func _physics_process(_delta: float) -> void:
	
	# Calculate speed. 
	
	position.y += ((person.speed/100) + (difficulty_modifier))

	# Free person.
	if position.y > Lanes.bottom: 
		call_deferred('destroy')

func destroy(): 
	Stats.void_score += 1
	queue_free()
