extends ColorRect

func _ready():
	get_node("AnimationPlayer").play("Colors")
