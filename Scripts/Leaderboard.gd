extends PanelContainer

const SAVE_PATH := "user://leaderboard.json"
const MAX_ENTRIES := 5
var final_run_time: float = 0.0

func _ready():
	if has_node("NamesContainer"):
		update_leaderboard()


func update_leaderboard():
	var scores = load_scores()

	var entries = $NamesContainer.get_children()

	if entries.size() < 6:
		print("ERROR: Not enough leaderboard entries.")
		return

	for i in range(MAX_ENTRIES):
		var panel = entries[i + 1]
		var label = panel.get_child(0)

		if i < scores.size():
			var score = scores[i]

			label.text = "%d. %s    %.2f seconds" % [
				i + 1,
				score["name"],
				float(score["time"])
			]
		else:
			label.text = "%d. ---" % (i + 1)


func load_scores() -> Array:
	if not FileAccess.file_exists(SAVE_PATH):
		return []

	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)

	if file == null:
		return []

	var data = JSON.parse_string(file.get_as_text())

	if data is Array:
		return data

	return []


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
