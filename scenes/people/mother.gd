extends Node2D

const BASE_PERSON = preload("res://scenes/people/base_person.tscn")

# Load the people manually. 
# Kim has a higher change to spawn than Rav. 
var people = [
	preload("res://data/people/rav.tres"),
	preload("res://data/people/kim.tres"),
	preload("res://data/people/kim.tres")
] 

func _ready() -> void:
	# Signals. 
	Stats.set_difficulty.connect(_on_set_difficulty)
	
	#get_people() 

var spawn_time: float = 0.5
@onready var spawn_timer: float = spawn_time


func _physics_process(delta: float) -> void:
	# Spawn a set of children.
	spawn_timer -= delta 
	if spawn_timer <= 0: 
		spawn_timer = spawn_time
		spawn_children()


## Set the difficulty based on the amount of void score. 
func _on_set_difficulty(difficulty: int):
	match difficulty: 
		1: 
			spawn_time = 0.5
		2:
			spawn_time = 0.4
		3: 
			spawn_time = 0.3
		8: 	
			spawn_time = 0.2
		14: 
			spawn_time = 0.15
			
## Spawn a set of children. 
func spawn_children(): 
	# Prevent spawning person in the same lane. 
	var prev = []
	
	for x in randi() % 4: 
		# Spawn person in random lane. 
		var r: int = -1 
		while prev.has(r):
			r = randi() % 5
		var person = BASE_PERSON.instantiate()
		add_child(person)
		
		person.init(people.pick_random())
		person.global_position.x = Lanes.lanes[r]
		
		prev.append(r)


## Get all of the 'people' resources from the 'people' directory and store
## them in the array. 
func get_people():
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
	
		
	
