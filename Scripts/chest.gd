extends Area2D

@export var texture_rect: TextureRect
@export var e_key_texture: Texture
@export var e_pressed_key_texture: Texture 
var open_label_base_text = "E to open"

@export var item: PackedScene
@export var after_open_animation_scene: PackedScene

var player_can_interact = false
var is_open = false

var player

func _unhandled_input(event):
	if(player_can_interact):
		if event is InputEventKey:
			if event.pressed and event.keycode == KEY_E:
				change_pressed_e_key_image()
				if(check_player_key_inventory(1)):
					open_chest()
				else:
					player_doesnt_have_key()

func change_pressed_e_key_image() -> void:
	texture_rect.set_texture(e_pressed_key_texture)
	await get_tree().create_timer(1.0).timeout
	texture_rect.set_texture(e_key_texture)

func player_doesnt_have_key() -> void:
	if player:
		player.send_thinking("need_key")
	
	pass
	await get_tree().create_timer(1.0).timeout
	pass

func open_chest() -> void:
	change_pressed_e_key_image()
	do_after_open_animation()
	remove_key_from_player_inventory(1)
	
	await get_tree().create_timer(0.5).timeout
	
	$AnimatedSprite2D.animation = "open"
	
	texture_rect.visible = false
	is_open = true
	
	$item_spawner.summon_item() 

func _on_body_entered(body):
	if body.get_name() == "Player":
		player_can_interact = true
		
		player = body
		if(!is_open):
			texture_rect.visible = true

func _on_body_exited(body):
	if body.get_name() == "Player":
		player_can_interact = false
		texture_rect.visible = false

func do_after_open_animation() -> void:
	var after_open_animation = after_open_animation_scene.instantiate()
	after_open_animation.position = position
	get_parent().add_child(after_open_animation)

func check_player_key_inventory(key_number):
	return get_parent().check_keys_in_inventory(key_number)

func remove_key_from_player_inventory(key_number) -> void:
	get_parent().remove_key(key_number)
