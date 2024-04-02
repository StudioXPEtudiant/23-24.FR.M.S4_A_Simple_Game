extends AnimatedSprite2D

func _ready():
	play("default")

func _on_animation_looped():
	queue_free()
