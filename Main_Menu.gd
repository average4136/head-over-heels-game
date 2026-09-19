extends Control

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/game.tscn")

func _on_check_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/settings.tscn")


func _on_button_exit_pressed() -> void:
	get_tree().quit()


func _ready():
	update_leaderboard()


func update_leaderboard():
	var entries = $PanelContainer/VBoxContainer.get_children()

	for i in range(5):
		var panel = entries[i + 1]
		var label = panel.get_child(0)

		if i < Leaderboard.scores.size():
			var score = Leaderboard.scores[i]

			label.text = "%d. %s    %.2f seconds" % [
				i + 1,
				score["name"],
				score["time"]
			]
		else:
			label.text = "%d. ---" % (i + 1)
