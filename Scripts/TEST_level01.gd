extends Node2D

################################### Keys vars ###################################

# Level 1
var l1_key_1 = false

# Level 2


#################################################################################

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(l1_key_1)

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_L:
			$CanvasModulate.switchLight()
