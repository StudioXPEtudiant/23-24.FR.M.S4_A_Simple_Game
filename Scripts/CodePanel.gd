extends Panel


func _ready():
	modulate = Color(1, 1, 1, 0.1)

func _on_mouse_entered():
	modulate = Color(1, 1, 1, 1)
func _on_mouse_exited():
	modulate = Color(1, 1, 1, 0.1)

func show_new_part(part: int, value: int):
	var part_label = get_node("code_part_" + str(part))
	
	part_label.text = str(value)

func blink_animation():
	for i in range(3):
		modulate = Color(1, 1, 1, 0.5)
		await get_tree().create_timer(0.2).timeout
		modulate = Color(1, 1, 1, 0.1)
		await get_tree().create_timer(0.2).timeout
