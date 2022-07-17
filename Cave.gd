extends Sprite

var cave = self

var shared
var backer
var demon

var first

func _ready():
	shared = get_node("../Shared")
	backer = get_node("../Backer")
	demon = get_node("../Demon")

func _process(delta):
	var v_width = shared.get_view_width()
	var dist = cave.position.x-demon.position.x
	
	if not first:
		first = dist
	
	if dist != first:
		var diff = first-dist
		cave.position.x += diff
		backer.position.x += diff