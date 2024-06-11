extends Area2D

signal show_code_panel()
signal hide_code_panel()

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
				print("E pressed")
				if(player_in_panel):
					player_in_panel = false
					show_code_panel.emit()
				else:
					player_in_panel = true
					hide_code_panel.emit()
