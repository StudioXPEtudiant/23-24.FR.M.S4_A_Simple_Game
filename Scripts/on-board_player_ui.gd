extends Control


func _ready():
	$bubble_animated.play("empty")
	
func need_key_bubble():
	$bubble_animated.play("need_key")

func barbed_message_bubble():
	$bubble_animated.play("barbed_message")

func health_message_bubble():
	$bubble_animated.play("health_message")
