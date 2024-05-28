extends Node2D

@export var IsaacEasterEggScene: PackedScene

func _on_lever_1_lever_activation(tag, activated):
	var easter_egg = IsaacEasterEggScene.instantiate()
	
	add_child(easter_egg)
