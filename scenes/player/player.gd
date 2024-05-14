extends Area2D
class_name Player

@onready var state_machine: Node = $StateMachine

var current_lane: int = 0:
	set(lane):
		current_lane = clamp(lane, 0, 4)
		position.x = Lanes.lanes[current_lane]

func _ready() -> void:
	state_machine.init(self) 
	
	self.position.y = 220
	current_lane = 2
	self.position.x = Lanes.lanes[current_lane]
	
	
@onready var invulnerability_timer: Timer = $InvulnerabilityTimer

func _on_hurtbox_area_entered(_area: Area2D) -> void:
	if not invulnerability_timer.is_stopped(): return
	
	Stats.hp -= 1 
	
	invulnerability_timer.start() 
