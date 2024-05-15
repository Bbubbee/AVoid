extends Sprite2D


var f: int = 0
func _on_animation_timer_timeout():
	f += 1
	if f > 2: f = 1
	frame = f
