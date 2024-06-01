extends Area2D

@export var camera: Camera2D

func _ready():
	camera = $Camera2D
	
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "Player":
		var camera_manager = get_parent()
		camera_manager.activate_camera(camera)
