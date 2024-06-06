extends Area2D

signal code_panel_asked(value: bool)

var player_can_interact = false
var player_in_panel = false

func _on_body_entered(body):
	if body.name == "Player":
		player_can_interact = true


func _on_body_exited(body):
	if body.get_name() == "Player":
		player_can_interact = false

func _unhandled_input(event):
	if(player_can_interact):
		if event is InputEventKey:
			if event.pressed and event.keycode == KEY_E:
				if(player_in_panel):
					player_in_panel = false
					code_panel_asked.emit(true)
				else:
					player_in_panel = true
					code_panel_asked.emit(false)
