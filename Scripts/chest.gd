extends Area2D

@export var open_label: Label 
@export var after_open_animation_scene: PackedScene

var player_can_interact = false
var is_open = false

func _unhandled_input(event):
	if(player_can_interact):
		if event is InputEventKey:
			if event.pressed and event.keycode == KEY_E:
				if(check_player_key_inventory(1)):
					open_chest()
				else:
					player_doesnt_have_key()

func player_doesnt_have_key():
	await (get_tree().create_timer(1.0), "timeout")
	print("Une seconde s'est écoulée.")

func open_chest():
	open_label.visible = false
	$AnimatedSprite2D.animation = "open"
	do_after_open_animation()
	is_open = true

func _on_body_entered(body):
	if body.get_name() == "Player":
		player_can_interact = true
		if(!is_open):
			open_label.visible = true

func _on_body_exited(body):
	if body.get_name() == "Player":
		player_can_interact = false
		open_label.visible = false

func do_after_open_animation():
	var after_open_animation = after_open_animation_scene.instantiate()
	after_open_animation.position = position
	get_parent().add_child(after_open_animation)
	print("animation child added at ", position)

func check_player_key_inventory(key_number):
	return get_parent().check_keys_in_inventory(key_number)
