extends Area2D
class_name Player

@onready var state_machine: Node = $StateMachine

@onready var f_lane_1: AudioStreamPlayer = $F_Lane1
@onready var g_sharp_lane_2: AudioStreamPlayer = $GSharp_Lane2
@onready var a_sharp_lane_3: AudioStreamPlayer = $ASharp_Lane3
@onready var c_lane_4: AudioStreamPlayer = $C_Lane4
@onready var d_sharp_lane_5: AudioStreamPlayer = $DSharp_Lane5

var current_lane: int = 0:
	set(lane):
		current_lane = clamp(lane, 0, 4)
		position.x = Lanes.lanes[current_lane]
		
		match current_lane: 
			0: 
				f_lane_1.play()
			1:
				g_sharp_lane_2.play()
			2: 
				a_sharp_lane_3.play()
			3: 
				c_lane_4.play()
			4: 
				d_sharp_lane_5.play()
			
@onready var bump = $Bump

func _ready() -> void:
	state_machine.init(self) 
	
	self.position.y = 220
	current_lane = 2
	self.position.x = Lanes.lanes[current_lane]
	
	
@onready var invulnerability_timer: Timer = $InvulnerabilityTimer

func _on_hurtbox_area_entered(_area: Area2D) -> void:
	if not invulnerability_timer.is_stopped(): return
	
	Stats.hp -= 1 
	bump.play()
	invulnerability_timer.start() 


