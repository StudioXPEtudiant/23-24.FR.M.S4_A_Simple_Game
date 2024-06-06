extends Area2D


# Ordre de la valeur / 4
@export var part_number: int
# Valeur du parchemin (ex: chiffre d'un code)
@export var part_value: int 

@export var particule_animation: PackedScene

func _on_body_entered(body):
	if body.name == "Player":
		send_value_to_player(body)

func send_value_to_player(player):
	player.send_thinking("new_code_value")
	
	var code_panel_manager = get_tree().root.get_node("Main/HUD/CodePanel")
	
	code_panel_manager.show_new_part(part_number, part_value)
	code_panel_manager.blink_animation()
	
	play_particules_animation()
	
	queue_free()

func play_particules_animation():
	var particules = particule_animation.instantiate()
	
	particules.position = position
	
	get_parent().add_child(particules)
