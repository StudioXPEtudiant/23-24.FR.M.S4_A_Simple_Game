extends CharacterBody2D

const SPEED = 300.0

func _physics_process(delta):
	var direction_x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var direction_y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	velocity.x = direction_x * SPEED
	velocity.y = direction_y * SPEED

	move_and_slide()
