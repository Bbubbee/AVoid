extends CharacterBody2D

var person: Person = preload("res://data/people/rav.tres")
@onready var sprite: Sprite2D = $Sprite

var difficulty_modifier: float 


func _ready() -> void:
	difficulty_modifier = clamp(Stats.difficulty, 1, 5)
	velocity.y = person.speed
	

func init(new_person: Person): 
	person = new_person
	
	# Calculate speed. 
	sprite.texture = person.texture
	velocity.y = person.speed + ((person.speed * ((difficulty_modifier*10)/100)*1.5) )
	
	#set_physics_process(true)
	

func _physics_process(_delta: float) -> void:
	move_and_slide()
	
	# Calculate speed. 
	#position.y += (((person.speed) + (difficulty_modifier*50))) * _delta

	# Free person.
	if position.y > Lanes.bottom: 
		call_deferred('destroy')

func destroy(): 
	Stats.void_score += 1
	queue_free()
