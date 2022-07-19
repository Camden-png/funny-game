extends AudioStreamPlayer2D

var stopped = false
var quiet = false

func play(pos = 0.0):
	if not playing:
		.play(pos)
	else:
		var audio = self.duplicate(DUPLICATE_USE_INSTANCING)
		get_parent().add_child(audio)
		audio.stream = stream
		audio.play()
		yield(audio, "finished")
		if not quiet:
			audio.queue_free()

# copied code from elsewhere
func _process(_delta):
	if quiet and not stopped:
		var curr = get_volume_db()
		if curr > -50:
			 set_volume_db(curr-0.5)
