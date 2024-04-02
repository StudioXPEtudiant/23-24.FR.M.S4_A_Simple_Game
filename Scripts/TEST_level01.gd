extends Node2D

################################### Keys vars ###################################

var player_have_key_1 = false

#################################################################################

func change_key_inventory(key_number):
	if(key_number == 1):
		player_have_key_1 = true

func _ready():
	$CanvasModulate.switchLight()

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_L:
			$CanvasModulate.switchLight()

func change_inventory_of_scene(key_number):
	change_key_inventory(key_number)

func check_keys_in_inventory(slot_number):
	if(slot_number == 1):
		if(player_have_key_1):
			return true
	elif(slot_number == 2):
		pass
	else:
		return false
