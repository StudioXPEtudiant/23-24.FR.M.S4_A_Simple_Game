extends Node2D

func _ready():
	# Au démarrage, aucune caméra n'est activée
	pass

func activate_camera(new_camera: Camera2D):
	if new_camera:
		print("Activating camera: ", new_camera.name)
		new_camera.make_current()
	else:
		print("New camera is null")
