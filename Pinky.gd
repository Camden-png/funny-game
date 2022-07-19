extends Sprite

var anim

var speech

var cover2

var music2

var minimized = false
var nommed = false
var returned = false

func _ready():
	anim = get_node("AnimationPlayer")
	anim.play("Idle")
	speech = get_node("../Speech")
	speech.get_node("AnimationPlayer").play("Idle")
	get_node("../AnimationPlayer").play("Slide")
	cover2 = get_node("../../Cover 2") 
	music2 = get_node("../../Music 2")
	music2.play()

func _process(_delta):
	var status = OS.is_window_focused()
	if not status and not minimized:
		anim.play("RESET")
		minimized = true
		speech.hide()
		
	if minimized:
		self.set_frame(2)
		if not nommed:
			get_node("../../Nom").play()
			nommed = true
		if status and not returned:
			cover2.get_node("AnimationPlayer").play("Fade_Out")
			returned = true
	
	# lower music
	if returned:
		var curr = music2.get_volume_db()
		if curr > -50:
			 music2.set_volume_db(curr-0.1)
		else:
			music2.stop()
	
	var is_dark = cover2.get_frame_color()[3] == 1
	if returned and is_dark:
		get_tree().change_scene("res://World3.tscn")
