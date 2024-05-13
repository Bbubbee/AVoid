extends Node2D

const BASE_PERSON = preload("res://scenes/people/base_person.tscn")

const KIM = preload("res://data/people/kim.tres")

var people = [] 

func _ready() -> void:
	var path: String = "res://data/people"
	var dir = DirAccess.open(path)
	
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		
		# Get all files in directory. 
		while file_name != "":
			if dir.current_is_dir(): return  # This is a directoru
			else: 
				var people_res_path = String(path+'/'+file_name)
				people.append(load(people_res_path))
			
			# Get the next file. 
			file_name = dir.get_next()
		# End while. 
		
	else: 
		print('Error opening directory')
		

func get_random_person() -> Person: 
	var r = randi() % people.size()
	
	return people[r] 		


@onready var birth_timer: Timer = $BirthTimer
var birth_timer_max: float = 2
var birth_timer_min: float = 0.5


# Birth random person. 
func _on_birth_timer_timeout() -> void:
	# Set random birth time. 
	birth_timer.start(randf_range(birth_timer_min, birth_timer_max))
	
	
	for x in randi() % 3: 
		# Spawn person in random lane. 
		var r = randi() % 5
		var person = BASE_PERSON.instantiate()
		add_child(person)
		
		person.init(get_random_person())
		person.global_position.x = Lanes.lanes[r]
		
	
