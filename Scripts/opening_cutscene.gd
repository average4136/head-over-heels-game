extends "res://Scripts/cutscene_player.gd"

func _setup_slides() -> void:
	slides = [
		{"text": "That day, I saw her.", "img": preload("res://Assets/Cutscenes/Opening_Cutscene_002.png"), "audio": null, "time": 3.0},
		{"text": "But my feet wouldn't move.", "img": null, "audio": null, "time": 3.0},
		{"text": "Negative thoughts kept filling my head...", "img": null, "audio": null, "time": 3.5},
		{"text": "...and weighed me down.", "img": null, "audio": null, "time": 3.0},
		{"text": "She was out of reach.", "img": preload("res://Assets/Cutscenes/Opening_Cutscene_001.png"), "audio": null, "time": 3.0}
	]

# next scene path will be the post-eyeopen scene on the street
