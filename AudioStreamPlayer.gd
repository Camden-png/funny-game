extends AudioStreamPlayer

var streamer

var fall

var playedSFX = false

func _ready():
	streamer = get_node(".")
	streamer.play()

func _process(delta):
	if not fall:
		fall = get_node("../Demon").fall
	else:
		streamer.stop()
		if not playedSFX:
			playedSFX = true
			var sfx = get_node("../Falling")
			sfx.play()
