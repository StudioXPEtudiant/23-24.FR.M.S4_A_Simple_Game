extends Node

signal lever_door_ActDea

@export var levers_dictionary = {}

func _ready():
	for child in get_children():
		if child.has_signal("lever_activation"):
			child.connect("lever_activation", update_lever_state)
			print("Signal connected for ", child)

	init_levers()

func init_levers():
	levers_dictionary["Lever_1"] = false
	levers_dictionary["Lever_2"] = false
	levers_dictionary["Lever_3"] = false

func update_lever_state(lever_name: String, new_state: bool) -> void:
	if lever_name in levers_dictionary:
		levers_dictionary[lever_name] = new_state
		check_all_lever_actions()
	
	else:
		print("Levier non trouvé : ", lever_name)

func check_all_lever_actions():
	open_door_1()

func open_door_1() -> void:
	var lever_n1_activated = levers_dictionary["Lever_1"]

	if lever_n1_activated:
		lever_door_ActDea.emit()

func _process(delta):
	pass
