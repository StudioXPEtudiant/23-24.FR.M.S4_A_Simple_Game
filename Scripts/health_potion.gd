extends Area2D

@export var gain_life: int
@export var particule_animation: PackedScene

func _ready():
	$AnimatedSprite2D.play("default")

func _on_body_entered(body):
	if body.name == "Player":
		var player_life_systeme = body.get_node("life_system")
		
		player_life_systeme.gain_life(gain_life)
		
		var particules = particule_animation.instantiate()
		particules.position = position
		
		get_parent().add_child(particules)
		
		body.send_thinking("health_message")
		
		queue_free()
