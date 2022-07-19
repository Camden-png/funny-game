extends RichTextLabel

var index
var start
var now

var next_level = false

var array = ["KILL", "THE", "DEMON", ""]

func reset():
	start = OS.get_unix_time()
	index = 0
	now = 0

func _ready():
	array = ["", ""] + array
	reset()

# must enable bbcode in inspector
func to_center(string):
	var bb = "[center]" + string + "[/center]"
	bb = "[color=red]" + bb + "[/color]"
	set_bbcode(bb)

func _process(_delta):
	if index < len(array):
		now = OS.get_unix_time()
		var diff = now-start
	
		if diff > 0.015:
			start = now
			
			var string = array[index]
			to_center(string)
			
			index += 1
	
	elif next_level:
		# lazy way to go to the next level
		get_tree().change_scene("res://World2.tscn")
