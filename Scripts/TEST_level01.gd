extends Node2D

################################### Keys vars ###################################

var player_have_key_1 = false

#################################################################################

var flashlight_on = false

func _process(delta):
	pass

func _ready():
	$CanvasModulate.visible = true
	
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func add_key_inventory(key_number):
	if(key_number == 1):
		player_have_key_1 = true

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_L:
			$CanvasModulate.switchLight()
			if(flashlight_on):
				$discord_manager.update_flashlight_state(false)
				flashlight_on = false
			elif(!flashlight_on):
				$discord_manager.update_flashlight_state(true)
				flashlight_on = true

func change_inventory_of_scene(key_number):
	add_key_inventory(key_number)

func key_number_to_var(key_number):
	if(key_number == 1):
		return player_have_key_1
	elif(key_number == 2):
		pass

func check_keys_in_inventory(key_number) -> bool:
	if(key_number_to_var(key_number)):
		return true
	else:
		return false

func remove_key(key_number) -> void:
	if key_number == 1:
		player_have_key_1 = false
