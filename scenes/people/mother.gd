extends Node2D

const BASE_PERSON = preload("res://scenes/people/base_person.tscn")

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

var spawn_time_2: float = 0.5
@onready var spawn_timer_2: float = spawn_time_2
var start_second_timer: bool = false 


func _physics_process(delta: float) -> void:
	spawn_timer -= delta 
	if spawn_timer <= 0: 
		spawn_timer = spawn_time
		spawn_children()
	
	# Hacky way of spawning more children.
	#if start_second_timer: 
		#spawn_timer_2 -= delta
		#if spawn_timer_2 <= 0: 
			#spawn_timer_2 = spawn_time
			#spawn_children()


func get_random_person() -> Person: 
	return people.pick_random()		



func _on_set_difficulty(difficulty: int):
	if difficulty > 3: difficulty = 3 
	match difficulty: 
		1: 
			spawn_time = 0.4
		2:
			spawn_time = 0.3
		3: 
			start_second_timer = true
			print('starting level 3 ')
			spawn_time = 0.2
		4: 
			spawn_time = 0.15
			


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
		
		person.init(get_random_person())
		person.global_position.x = Lanes.lanes[r]
		
		prev.append(r)


## Get all of the 'people' resources from the relevant directory. 
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
	
		
	
