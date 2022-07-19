extends ColorRect

func _ready():
	show()
	get_node("AnimationPlayer").play("Fade_In")

func _process(_delta):
	var is_dark = self.get_frame_color()[3] == 1
	if is_dark:
		get_tree().change_scene("res://World.tscn")
