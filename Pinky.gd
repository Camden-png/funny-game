extends Sprite

var anim

var speech

var cover2

var minimized = false

var returned = false

func _ready():
	anim = get_node("AnimationPlayer")
	anim.play("Idle")
	speech = get_node("../Speech")
	speech.get_node("AnimationPlayer").play("Idle")
	get_node("../AnimationPlayer").play("Slide")
	cover2 = get_node("../../Cover 2") 

func _process(_delta):
	var status = OS.is_window_focused()
	if not status and not minimized:
		anim.play("RESET")
		minimized = true
		speech.hide()
		
	if minimized:
		self.set_frame(2)
		if status and not returned:
			cover2.get_node("AnimationPlayer").play("Fade_Out")
			returned = true
	
	var is_dark = cover2.get_frame_color()[3] == 1
	if returned and is_dark:
		get_tree().change_scene("res://World3.tscn")
