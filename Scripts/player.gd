extends CharacterBody2D

@export var SPEED = 100.0

func _physics_process(delta):
	var direction_x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var direction_y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	velocity.x = direction_x * SPEED
	velocity.y = direction_y * SPEED
	

func _process(delta):
	if velocity.length() > 0:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_h = velocity.x < 0 # "velocity.x < 0" retrourne la valeur "vrai" ou "faux" ce qui reviens a set une bool
	elif velocity.y != 0:
		$AnimatedSprite2D.flip_v = velocity.y > 0
		$AnimatedSprite2D.animation = "up"

	move_and_slide()
