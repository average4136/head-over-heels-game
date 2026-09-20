extends "res://Scripts/cutscene_player.gd"

@export_file("*.tscn") var next_scene: String = "res://Scenes/name_entry.tscn"

func _ready() -> void:
	bgm_start_offset = 50.0
	MenuTheme.playTheme = true # get menu theme ready
	super._ready()

func _setup_slides() -> void:
	slides = [
		{
			"text": "*Teleporting...*",
			"img": null,
			"audio": null,
			"time": 1.5
		},
		{
			"text": "",
			"img": preload("res://Assets/Cutscenes/ACTUAL_Ending_Cutscene_0.5.png"),
			"audio": null,
			"time": 3.0
		},
		{
			"text": "",
			"img": preload("res://Assets/Cutscenes/Op_Scene_shoes_dream_no_grass.png"),
			"audio": null,
			"time": 2.0
		},
		{
			"text": "Boy: \"Hey, excuse me! Wait up!\"",
			"img": preload("res://Assets/Cutscenes/Op_Scene_03_strut_dream.png"),
			"audio": null,
			"time": 3.0
		},
		{
			"text": "",
			"img": preload("res://Assets/Cutscenes/Girl_Ending_Cutscene_Face_Reveal_V0.5.png"),
			"audio": null,
			"time": 0.5
		},
		{
			"text": "\"Hm?\"",
			"img": preload("res://Assets/Cutscenes/Girl_Ending_Cutscene_Face_Reveal_V0.5.png"),
			"audio": null,
			"time": 2.5
		},
		{
			"text": "(Shoot. I must look so stupid.)",
			"img": preload("res://Assets/Cutscenes/End_Goober.png"),
			"audio": null,
			"time": 3.0
		},
		{
			"text": "(I should say never mind, she must be so disgusted...)",
			"img": preload("res://Assets/Cutscenes/End_Goober.png"),
			"audio": null,
			"time": 4.0
		},
		{
			"text": "(Wait, what?)",
			"img": null,
			"audio": null,
			"time": 2.5
		},
		{
			"text": "",
			"img": preload("res://Assets/Cutscenes/Girl_Smile.png"),
			"audio": null,
			"time": 3.0
		},
		{
			"text": "",
			"img": preload("res://Assets/Cutscenes/Boy_0.5.png"),
			"audio": null,
			"time": 3.0
		},
		{
			"text": "",
			"img": preload("res://Assets/Cutscenes/Boy_Smile.png"),
			"audio": null,
			"time": 1.0
		},
		{
			"text": "(I guess that stupid omni-whatever being was right...)",
			"img": preload("res://Assets/Cutscenes/Boy_Smile.png"),
			"audio": null,
			"time": 4.0
		},
		{
			"text": "(It was all just in my head.)",
			"img": preload("res://Assets/Cutscenes/Boy_Smile.png"),
			"audio": null,
			"time": 3.0
		},
		{
			"text": "",
			"img": preload("res://Assets/Cutscenes/Boy_Smile.png"),
			"audio": null,
			"time": 0.5
		},
		{
			"text": "\"Hi, my name is...\"",
			"img": preload("res://Assets/Cutscenes/Boy_Smile_Talk.png"),
			"audio": null,
			"time": 4.0
		},
		{
			"text": "THE END",
			"img": null,
			"audio": null,
			"time": 5.0
		},
	]

func _on_cutscene_finished() -> void:
	if ost:
		ost.stop()
	if ResourceLoader.exists(next_scene):
		get_tree().change_scene_to_file(next_scene)
		
func _process(_delta: float) -> void:
	print()
	if (ost.volume_db <= -5):
		ost.volume_db += _delta * 2 # change this var for fade speed
