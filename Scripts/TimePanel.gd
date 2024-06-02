extends Panel

var time_label
var time_label_int = 0

var player_die = false

var start_pos

func _ready():
	start_pos = position
	
	time_label = $time_label

	time_label.text = str(time_label_int)

func _process(delta):
	if !player_die:
		await get_tree().create_timer(0.1).timeout

		time_label_int += 1

		time_label.text = str(time_label_int)



# Fonction appelée lorsque le joueur meurt
func move_score_to_center():
	var tween = create_tween()

	var viewport_size = get_viewport().get_visible_rect().size
	var target_position = (viewport_size / 2) - (size / 2)
	var corrected_target_position = Vector2(target_position.x, target_position.y + 100 )

	tween.tween_property(self, "position", corrected_target_position, 1.0)


func _on_player_player_die():
	player_die = true
	move_score_to_center()

func move_back():
	var tween = create_tween()
	tween.tween_property(self, "position", start_pos, 1.0)

func restart_counter():
	await get_tree().create_timer(1.7).timeout
	
	time_label_int = 0
	
	time_label.text = str(time_label_int)
	
	player_die = false
