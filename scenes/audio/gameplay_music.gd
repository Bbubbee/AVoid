extends AudioStreamPlayer

var songs = {
	0: preload("res://assets/audio/music/lofi-gameplay/sad-soul-chasing-a-feeling-185750.mp3")
}


func _ready():
	var r = randi() % songs.size()
	stream = songs[r]
	playing = true 
