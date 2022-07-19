extends AudioStreamPlayer2D

var start
var now

var played = false

func _ready():
	start = OS.get_unix_time()

func _process(_delta):
	if not played:
		now = OS.get_unix_time()
		var diff = now-start
		if diff >= 1:
			play()
			played = true
