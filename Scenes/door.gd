extends Area2D

@export var is_open = false

func toogle_door_sys():
	if(is_open):
		close_door()
	elif(!is_open):
		open_door()

func open_door():	
	$StaticBody2D.set_collision_layer_value(2, false)
	$AnimatedSprite2D.set_animation("open")
	$StaticBody2D/CloseDoor/LightOccluder2D.visible = false

func close_door():
	$StaticBody2D.set_collision_layer_value(2, true)
	$AnimatedSprite2D.set_animation("close")
	$StaticBody2D/CloseDoor/LightOccluder2D.visible = true

func _on_lever_2_lever_activation(tag, activated):
	if(activated):
		open_door()
	elif(!activated):
		close_door()
