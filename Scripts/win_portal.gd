extends Area2D

@export_file("*.tscn") var ending_cutscene_path: String = "res://Scenes/Cutscenes/ending_cutscene.tscn"

var triggered: bool = false

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if triggered:
		return
		
	if body.is_in_group("player") or body.name in ["Guy", "character", "Head", "Body"]:
		triggered = true
		DialogueManager.stop_dialogue()
		get_tree().change_scene_to_file(ending_cutscene_path)
