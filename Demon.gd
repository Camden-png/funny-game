extends Sprite

var shared

var cover

var rope

var text

var in_place = false
var fall = false
var gone = false

var first = -424.5

func _ready():
	get_node("AnimationPlayer 1").play("Idle")
	get_node("AnimationPlayer 2").play("Lower")
	shared = get_node("../Shared")
	cover = get_node("../Cover")
	rope = get_node("../Rope")
	text = get_node("../RichTextLabel")

func _process(_delta):
	var v_width = shared.get_view_width()
	
	var s_width = shared.get_px_width(self)/2 # extra 2 to account for 2 frames
	var pos = v_width/(800/282)-s_width/2
	var combo = -pos+58
	
	if v_width > 1200:
		position.x = first
	else:
		position.x = combo
	
	# put the rope above the cage
	rope.position.x = position.x
	rope.position.y = position.y-300
	
	# prevent the cage from snapping if it is not in place
	if position.y == 50 and not in_place:
		in_place = true
	
	if not in_place:
		return
	
	# check if the rope has been snapped
	combo -= 120
	if pos <= combo+s_width and not fall:
		get_node("AnimationPlayer 2").play("Fall")
		fall = true
	
	if not fall:
		return
	
	# check if cage has fully fallen
	if position.y == 1200 and not gone:
		cover.get_node("AnimationPlayer").play("Fade_Out")
		gone = true
	
	# show the new text
	var is_dark = cover.get_frame_color()[3] == 1
	var new_time = 0.5
	if is_dark and text.timer != new_time:
		text.array = ["HIS", "KIDS", "ARE", "NOW", "ORPHANS", "", ""]
		text.next_level = true
		text.timer = new_time
		text.reset()
