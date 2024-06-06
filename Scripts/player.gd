extends CharacterBody2D

signal player_die
signal player_respawn

@export var respawn_point: Node2D
@export var SPEED = 100.0

var can_move = true

func _physics_process(delta):
	var direction_x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var direction_y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	velocity.x = direction_x * SPEED
	velocity.y = direction_y * SPEED
	

func _process(delta):
	if can_move:
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
	else:
		$AnimatedSprite2D.stop()


func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_I:
			$life_system.take_damage(1)
		if event.keycode == KEY_O:
			$life_system.gain_life(1)

func send_thinking(thinking: String):
	if (thinking == "need_key"):
		$"on-board_player_ui".need_key_bubble()
	if (thinking == "barbed_message"):
		$"on-board_player_ui".barbed_message_bubble()
	if (thinking == "health_message"):
		$"on-board_player_ui".health_message_bubble()
	if (thinking == "new_code_value"):
		$"on-board_player_ui".new_code_value_bubble()

func die():
	can_move = false
	
	player_die.emit()

func respawn():
	player_respawn.emit()
	
	respawn_point = get_parent().get_node("PlayerSpawn")
	
	position = respawn_point.position
	
	# Attente de la réactivation de la flashlight
	await get_tree().create_timer(1.7).timeout
	
	can_move = true
