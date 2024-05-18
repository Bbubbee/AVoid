extends Label

@onready var timer: Timer = $Timer

var dissolve
var dissolve_in: bool = false
"theme_override_colors/font_color"

var black: Color = Color.BLACK

func _ready() -> void:
	dissolve = material
	
	Stats.show_text.connect(_on_show_text) 
	dissolve.set('shader_parameter/value', 0)
	
	#set_process(false)

func _on_show_text():
	set_process(true)


var x: float = 0.0

func _process(delta: float) -> void:
	if dissolve_in: 
		x = clamp(x+delta/2, 0, 1.0)
		dissolve.set('shader_parameter/value', x)
	else: 
		x = clamp(x-delta/2, 0, 1.0)
		dissolve.set('shader_parameter/value', x)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed('secret'):
		timer.start(2.6)
		dissolve_in = not dissolve_in


func _on_timer_timeout() -> void:
	dissolve_in = false
