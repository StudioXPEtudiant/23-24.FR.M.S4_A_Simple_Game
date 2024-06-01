extends PointLight2D

func _ready():
	pass

func die_light_animation() -> void:
	await clink_light()
	await diminish_light()

func clink_light() -> void:
	var blink_times = 6
	var blink_delay = 0.1

	for i in range(blink_times):
		visible = !visible
		await get_tree().create_timer(blink_delay).timeout
	
	visible = true # Assurer que la lumière est visible après le clignotement

func diminish_light() -> void:
	var total_duration = 2.0
	var diminish_duration = 1.5
	var steps = 100  # Nombre de pas pour la diminution
	var step_delay = diminish_duration / steps  # Délai entre chaque pas
	var initial_energy = energy

	for i in range(steps):
		energy = initial_energy * (1 - float(i) / steps)
		await get_tree().create_timer(step_delay).timeout
		print(i)
		if i > 40:
			energy = 0
