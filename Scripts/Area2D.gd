extends Area2D

@onready var Player = get_parent().get_node("Player")
@export var pick_up_animation_scene: PackedScene

@export var key_number = 1

func _process(delta):
	pass

func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.get_name() == "Player":
		do_pick_up_animation()
		queue_free()

func do_pick_up_animation():
	var pick_up_animation = pick_up_animation_scene.instantiate()
	pick_up_animation.position = position
	get_parent().add_child(pick_up_animation)
	print("animation child added at ", position)
	
func give_key_to_player():
	if(key_number == 1):
		get_parent().get_script().l1_key_1 = true
