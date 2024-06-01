extends Area2D

@export var damage = 1

func _on_body_entered(body):
	if body.name == "Player":
		body.SPEED = 30
		
		var life_system = body.get_node("life_system")
		
		life_system.take_damage(damage)
		
		body.send_thinking("barbed_message")


func _on_body_exited(body):
	if body.name == "Player":
		body.SPEED = 100
