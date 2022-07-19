extends ColorRect

func _ready():
	show()
	get_node("AnimationPlayer").play("Fade_In")
