extends Node2D


func _process(delta):
	var mouse_pos = get_global_mouse_position()
	position = mouse_pos

func remove_light():
	$PointLight2D.energy = 0
	
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func reset_cursor():
	$PointLight2D.energy = 0.5
	
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
