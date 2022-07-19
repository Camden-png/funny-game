extends Camera2D

var fall

func _ready():
	randomize()

func _process(_delta):
	var amount = 2.0
	if not fall:
		fall = get_node("../Demon").fall
		var a = rand_range(-1.0, 1.0)*amount
		var b = rand_range(-1.0, 1.0)*amount
		var vect = Vector2(a, b)
		set_offset(vect)
	else:
		set_offset(Vector2(0.0, 0.0))
