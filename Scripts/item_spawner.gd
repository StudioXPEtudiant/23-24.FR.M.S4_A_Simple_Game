extends Node2D


func summon_item():
	var item = get_parent().item
	
	var item_to_spawn = item.instantiate()
	
	item_to_spawn.position = position 
	item_to_spawn.set_physics_process(false) 
	
	add_child(item_to_spawn) 
	
	var tween = create_tween()
	
	var intermediate_position = position + Vector2(5, -10)
	var final_position = position + Vector2(7, 0)
	
	tween.tween_property(item_to_spawn, "position", intermediate_position, 0.2)
	tween.tween_property(item_to_spawn, "position", final_position, 0.2)
	
	tween.tween_property(item, "scale", Vector2(200,200), 0.2)  # Increase the scale by 1.5 times
	
	tween.finished.connect(_on_tween_finished.bind(item_to_spawn))

func _on_tween_finished(item_to_spawn):
	item_to_spawn.set_physics_process(true) 
	item_to_spawn.set_collision_layer(1) 
	item_to_spawn.set_collision_mask(1) 
