extends Sprite

func px_helper(sprite):
	var sprite_vect = sprite.texture.get_size()
	var scale_vect = sprite.get_scale()
	return Vector2(sprite_vect[0] * scale_vect[0],
				   sprite_vect[1] * scale_vect[1])

func get_px_width(sprite):
	return px_helper(sprite)[0]

func get_view_width():
	var v_vect = OS.get_window_size()
	return v_vect[0]
