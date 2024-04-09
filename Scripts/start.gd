extends Control

var simultaneous_scene = preload("res://Scenes/TEST_level01.tscn").instantiate()

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/TEST_level01.tscn")

func get_and_send_player_username():
	var username = $PlayerInfoPanel/TextEdit.get_text()
	print(username)
