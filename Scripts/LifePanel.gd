extends Panel


func set_life_ui(amount: int, blood_anim: bool):
	if amount == 0:
		$AnimatedSprite2D.play("die_anim")
	if amount == 1:
		$AnimatedSprite2D.play("S1")
	if amount == 2:
		$AnimatedSprite2D.play("S2")
	if amount == 3:
		$AnimatedSprite2D.play("S3")
	if amount == 4:
		$AnimatedSprite2D.play("S4")
	if amount == 5:
		$AnimatedSprite2D.play("S5")
	if amount == 6:
		$AnimatedSprite2D.play("S6")
	
	if blood_anim:
		var blood_panel = get_parent().get_node("BloodPanel")
	
		blood_panel.take_damage_blood()
