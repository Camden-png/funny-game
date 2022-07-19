extends AudioStreamPlayer

var streamer

var fall

var played_SFX = false
var stopped = false

func _ready():
	play()

func _process(_delta):
	if not fall:
		fall = get_node("../Demon").fall
	else:
		# fade out the music
		if not stopped:
			var curr = get_volume_db()
			if curr > -50:
				set_volume_db(curr-0.5)
			else:
				stopped = true
				stop()
				
		# play the falling SFX
		if not played_SFX:
			get_node("../Falling").play()
			played_SFX = true
