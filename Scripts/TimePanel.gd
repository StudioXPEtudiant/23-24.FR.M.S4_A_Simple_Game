extends Panel

var time_label
var time_label_int = 0

var player_die = false

func _ready():

	time_label = $time_label

	time_label.text = str(time_label_int)

func _process(delta):
	if !player_die:
		await get_tree().create_timer(0.1).timeout

		time_label_int += 1

		time_label.text = str(time_label_int)

func _on_player_player_die():
	player_die = true
