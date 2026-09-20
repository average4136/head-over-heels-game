extends "res://Scripts/cutscene_player.gd"

func _ready() -> void:
	bgm_start_offset = 30.0
	super._ready()

func _setup_slides() -> void:
	slides = [
		{"text": "That day, I saw her.", "img": preload("res://Assets/Cutscenes/Opening_Cutscene_V0.5.png")},
		{"text": "But my feet wouldn't move.", "img": preload("res://Assets/Cutscenes/Op_Scene_03_stand.png")},
		{"text": "Negative thoughts kept filling my head...", "img": preload("res://Assets/Cutscenes/Boy_No_Face_0.5.png")},
		{"text": "...and weighed me down.", "img": preload("res://Assets/Cutscenes/Boy_Brain_scared.png")},
		{"text": "She was out of reach.", "img": preload("res://Assets/Cutscenes/Opening_Cutscene_001.png")},
		{"text": "", "img": preload("res://Assets/Cutscenes/Boy_Brain_overwhelmed.png")},
		{"text": "", "img": null, "time": 2.0},
		{"text": "", "img": preload("res://Assets/Cutscenes/Op_Scene_shoes_dream_no_grass.png")}
	]
