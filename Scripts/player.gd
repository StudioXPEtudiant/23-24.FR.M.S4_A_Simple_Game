extends CharacterBody2D

@export var SPEED = 100.0

func _physics_process(delta):
	var direction_x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var direction_y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	velocity.x = direction_x * SPEED
	velocity.y = direction_y * SPEED

	move_and_slide()
