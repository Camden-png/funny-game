extends Sprite

var shared

var backer

var demon

var first

func _ready():
	shared = get_node("../Shared")
	backer = get_node("../Backer")
	demon = get_node("../Demon")

func _process(_delta):
	var dist = position.x-demon.position.x
	
	if not first:
		first = dist
	
	if dist != first:
		var diff = first-dist
		position.x += diff
		backer.position.x += diff
