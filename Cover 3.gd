extends ColorRect

var plush

var started = false

func _ready():
	show()
	get_node("AnimationPlayer").play("Fade_In")
	plush = get_node("../PlushBlanket")

func _process(_delta):
	if not started:
		var is_dark = get_frame_color()[3] == 1
		if is_dark:
			started = true
			plush.play()
