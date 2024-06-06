extends Panel

var value = 0 

func incr_value():
	if value == 9:
		value = 0
	
	value += 1
	
	$label_part_filler.text = str(value)
	
func deacr_value():
	if value == 0:
		value = 9
	
	value -= 1
	
	$label_part_filler.text = str(value)

func get_value():
	return value

func reset_value():
	value = 0
	
	$label_part_filler.text = str(value)

func do_color_animation(color):
	var label = $label_part_filler
	
	for i in range(3):
		label.modulate = color
		await get_tree().create_timer(0.2).timeout
		label.modulate = Color(1, 1, 1, 1)
		await get_tree().create_timer(0.2).timeout
