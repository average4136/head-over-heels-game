extends Control

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Cutscenes/opening_cutscene.tscn")

func _on_check_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/settings.tscn")

func _on_button_exit_pressed() -> void:
	get_tree().quit()
