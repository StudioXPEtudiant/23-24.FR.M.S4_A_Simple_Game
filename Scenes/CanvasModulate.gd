extends CanvasModulate

var lighOn = true 
@onready var player = load("res://Scenes/player.tscn")
@onready var playerInstance = player.instantiate()
@onready var Player = get_parent().get_node("Player")
@onready var PlayerFlashlight = Player.get_node("PlayerFlashlight")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func switchLight():
	if lighOn == false:
		visible = true
		lighOn = true
		PlayerFlashlight.set_energy(1)
		
	elif lighOn == true:
		visible = false
		lighOn = false
		PlayerFlashlight.set_energy(0)
