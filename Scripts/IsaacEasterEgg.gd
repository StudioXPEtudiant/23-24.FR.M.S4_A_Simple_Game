extends Node2D

@onready var path_follow: PathFollow2D = $Path2D/PathFollow2D2

@export var speed = 2000

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	path_follow.progress += speed * delta
