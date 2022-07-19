extends Sprite

var start

var elapsed = false

func _ready():
	start = OS.get_unix_time()
 
func _process(_delta):
	if not elapsed:
		var now = OS.get_unix_time()
		var diff = now-start
	
		var hours = diff/3600
		
		if hours >= 1 and OS.is_window_focused():
			elapsed = true
			get_node("AnimationPlayer").play("Fade_Out")
			get_node("../Door Bits").get_node("Top").get_node("AnimationPlayer").play("Slide")
			get_node("../Cover 3").get_node("AnimationPlayer").play("Fade_Out")
			get_node("../Win").get_node("AnimationPlayer 1").play("Fade_In")
			get_node("../Win").get_node("AnimationPlayer 2").play("Idle")
