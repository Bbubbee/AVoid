extends Node2D

var lanes = []


func _ready() -> void:
	# Get width of a lane based on the width of the screen. 
	var margin = 10	
	var lane_width = (get_viewport_rect().size.x - margin*2) / 5
	
	# Track the start and center of a lane. 
	var lane_start = margin
	var lane_center 
	
	# Get the center of the 5 lanes. 
	for lane in 5: 
		# Get center of the current lane
		lane_center = lane_start + lane_width/2
		
		# Get the starting pos of the next lane. 
		lane_start += lane_width
		
		# Add it to the lanes. 
		lanes.append(lane_center)
		
	


# Other global variables. 

@onready var bottom = get_viewport_rect().size.y + 30



