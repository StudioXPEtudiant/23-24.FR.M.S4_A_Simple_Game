extends Node2D

signal ls_die

@export var max_life = 6
@export var min_life = 1
@export var current_life: int

var lifePanel 

func _ready():
	current_life = max_life
	lifePanel = get_tree().root.get_node("Main/HUD/LifePanel")
	
func take_damage(amount: int):
	if current_life <= min_life:
		ls_die.emit()
		
	else:
		current_life -= amount
		
		lifePanel.set_life_ui(current_life, true)
		
		print(current_life)

func gain_life(amount: int):
	current_life += amount
	
	lifePanel.set_life_ui(current_life, false)

func refull_life():
	current_life = max_life
