extends Sprite

var shared

var first = 482.5

func _ready():
	shared = get_node("../Shared")

func _process(_delta):
	var spike2 = get_node("../Spike 2")
	var v_width = shared.get_view_width()
	var s_width = shared.get_px_width(spike2)
	var pos = v_width/(800/282)-s_width/2
	
	if v_width > 1200:
		position.x = first
		spike2.position.x = first
	else:
		position.x = pos
		spike2.position.x = pos
