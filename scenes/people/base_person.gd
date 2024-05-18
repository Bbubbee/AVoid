extends CharacterBody2D

@onready var sprite: Sprite2D = $Sprite

var person: Person = preload("res://data/people/rav.tres")
var difficulty_modifier: float 


func _ready() -> void:
	# Set the speed of the person based on the current difficulty. 
	# Cap it at 5 .
	difficulty_modifier = clamp(Stats.difficulty, 1, 5)
	velocity.y = person.speed
	
## Initialise the person (either Kim or Rav).
func init(new_person: Person): 
	person = new_person
	
	# Calculate speed. 
	sprite.texture = person.texture
	velocity.y = person.speed + ((person.speed * ((difficulty_modifier*10)/100)*1.5) )
	

func _physics_process(_delta: float) -> void:
	move_and_slide()
	
	# Calculate speed. 
	#position.y += (((person.speed) + (difficulty_modifier*50))) * _delta

	# Free person when they have reached the bottom of the screen. 
	if position.y > Lanes.bottom: 
		call_deferred('destroy')

## The person has reached the bottom of the screen. 
## Destroy them and gain a point. 
func destroy(): 
	Stats.void_score += 1
	queue_free()
