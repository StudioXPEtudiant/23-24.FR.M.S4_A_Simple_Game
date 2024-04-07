extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	DiscordRPC.app_id = 1226463123884609618

	DiscordRPC.state = "Corrompt state 1";
	DiscordRPC.details = "Playing in Level 1";
	DiscordRPC.start_timestamp = 1;
	DiscordRPC.end_timestamp;
	DiscordRPC.large_image = "a-simple-game-logo";
	DiscordRPC.large_image_text = "A Simple Game";
	DiscordRPC.party_id = "ae488379-351d-4a4f-ad32-2b9b01c91657";
	DiscordRPC.join_secret = "MTI4NzM0OjFpMmhuZToxMjMxMjM= ";

	DiscordRPC.refresh()

func update_flashlight_state(activate):
	if(activate):
		DiscordRPC.small_image = "flashlight-on-image";
		DiscordRPC.small_image_text = "Flashlight On";
	else:
		DiscordRPC.small_image = "";
		DiscordRPC.small_image_text = "";
	
	DiscordRPC.refresh()
