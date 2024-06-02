extends Panel

var start_pos

func _ready():
	start_pos = position

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


func move_life_to_center():
	var tween = create_tween()

	var viewport_size = get_viewport().get_visible_rect().size
	var target_position = (viewport_size / 2) - (size / 2)
	var corrected_target_position = Vector2(target_position.x, target_position.y)
	tween.tween_property(self, "position", corrected_target_position, 1.0)


func on_playerd_die():
	move_life_to_center()
	
	await get_tree().create_timer(1.5).timeout
	
	$AnimatedSprite2D.play("die_anim")
	
	await get_tree().create_timer(1.5).timeout
	
	$replay_button.visible = true
	$AnimatedSprite2D.visible = false

func move_back():
	var tween = create_tween()
	tween.tween_property(self, "position", start_pos, 1.0)

func respawn_heart_animation():
	$replay_button.visible = false
	$AnimatedSprite2D.visible = true
	$AnimatedSprite2D.play("refull_life")
	
	await get_tree().create_timer(1.2).timeout
	
	$AnimatedSprite2D.play("S6")
