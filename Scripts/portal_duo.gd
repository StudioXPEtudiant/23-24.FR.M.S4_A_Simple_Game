extends Node2D

@export var portal_1: Node2D
@export var portal_2: Node2D

var can_tp = true

func _process(delta):
	print("P1 : " + str(portal_1.position))
	
	print("P2 : " + str(portal_2.position))
	
	await get_tree().create_timer(5).timeout

func tp_to_portal_1(body):
	print("player in p2")
	
	if body.name == "Player":
		if can_tp:
			can_tp = false
			body.position = portal_2.global_position
			
			await get_tree().create_timer(5).timeout
			
			can_tp = true

func tp_to_portal_2(body):
	print("player in p1")
	
	if body.name == "Player":
		if can_tp:
			body.position = portal_1.global_position
			can_tp = false
			
			await get_tree().create_timer(5).timeout
			
			can_tp = true
