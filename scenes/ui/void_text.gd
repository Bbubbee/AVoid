extends Label

@onready var timer: Timer = $Timer

var dissolve
var dissolve_in: bool = false
"theme_override_colors/font_color"

var black: Color = Color.BLACK

# List of texts.
var texts = [
	'who am i?', 'come home', 'where am i?', 'liar', 'it hurts', 'find me', 'i see u'
]

func _ready() -> void:
	dissolve = material
	
	Stats.show_text.connect(_on_show_text) 
	dissolve.set('shader_parameter/value', 0)

func _on_show_text():
	if not dissolve_in: 
		text = texts.pick_random()
		timer.start(show_text_time)
		dissolve_in = true


var dissolve_status: float = 0.0
var dissolve_rate: float = 1.5
var show_text_time: float = 4.2

func _process(delta: float) -> void:
	if dissolve_in: 
		dissolve_status = clamp(dissolve_status+delta/dissolve_rate, 0, 1.0)
		dissolve.set('shader_parameter/value', dissolve_status)
	else: 
		dissolve_status = clamp(dissolve_status-delta/dissolve_rate, 0, 1.0)
		dissolve.set('shader_parameter/value', dissolve_status)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed('secret') and not dissolve_in:
		text = texts.pick_random()
		timer.start(show_text_time)
		dissolve_in = true


func _on_timer_timeout() -> void:
	dissolve_in = false
