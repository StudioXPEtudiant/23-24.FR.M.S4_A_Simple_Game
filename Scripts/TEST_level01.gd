extends Node2D

################################### Keys vars ###################################

var player_have_key_1 = false

#################################################################################

func change_key_inventory(key_number):
	if(key_number == 1):
		player_have_key_1 = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_L:
			$CanvasModulate.switchLight()
