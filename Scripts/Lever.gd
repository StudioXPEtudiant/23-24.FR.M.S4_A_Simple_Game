extends Area2D

signal lever_activation

var player_can_interact = false

func _ready():
	$AnimatedSprite2D.animation = "Deactivated"

func _unhandled_input(event):
	if(player_can_interact):
		if $AnimatedSprite2D.animation == "Deactivated":
			if event is InputEventKey:
				if event.pressed and event.keycode == KEY_E :
					$AnimatedSprite2D.animation = "Activated"
					lever_activation.emit()
				
		elif $AnimatedSprite2D.animation == "Activated":
			if event is InputEventKey:
				if event.pressed and event.keycode == KEY_E :
					$AnimatedSprite2D.animation = "Deactivated"


func _on_body_entered(body):
	$E_key.visible = true
	player_can_interact = true

func _on_body_exited(body):
	$E_key.visible = false
	player_can_interact = false
