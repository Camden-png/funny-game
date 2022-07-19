extends Sprite

func _ready():
	get_node("AnimationPlayer 1").play("Fade_In")
	get_node("AnimationPlayer 2").play("Idle")
