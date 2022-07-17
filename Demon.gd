extends Sprite

var shared

var rope

var buffer = 20
var first

var fall = false
var adder = 0

func _ready():
	get_node("AnimationPlayer").play("Idle")
	shared = get_node("../Shared")
	rope = get_node("../Rope")

func _process(delta):
	var sprite = get_node(".")
	var v_width = shared.get_view_width()
	
	var s_width = shared.get_px_width(sprite)/2 # extra 2 to account for 2 frames
	var pos = v_width/(800/282)-s_width/2
	var combo = -pos+buffer+38
	
	if not first:
		first = combo
	
	if v_width > 1200:
		position.x = first
	else:
		position.x = combo
	
	# put the rope above the cage
	rope.position.x = position.x
	rope.position.y = position.y-300
	
	# check if the rope has been snapped
	combo -= 120
	if pos <= combo+s_width and not fall:
		fall = true
	
	# let demon fall
	if fall and position.y <= 2000:
		adder += 0.3
		position.y += 4+adder
	
	# hide demon after going offscreen
	# this is super lazy code, I am tired
	var hide_spot = 99999
	if position.y >= 2000 and position.y != hide_spot:
		position.y = hide_spot
		
	
	
