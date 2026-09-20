extends Panel
const SAVE_PATH := "user://leaderboard.json"
const MAX_ENTRIES := 5


func add_score(player_name: String, time: float):
	var scores = []

	# Load existing scores
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		var data = JSON.parse_string(file.get_as_text())

		if data is Array:
			scores = data

	# Add new score
	scores.append({
		"name": player_name,
		"time": time
	})

	# Sort fastest first
	scores.sort_custom(func(a, b):
		return float(a["time"]) < float(b["time"])
	)

	# Keep only five scores
	if scores.size() > MAX_ENTRIES:
		scores.resize(MAX_ENTRIES)

	# Save
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)

	if file:
		file.store_string(JSON.stringify(scores))


func _on_end_game_button_pressed() -> void:
	add_score("Test", 4.0)

	print("Score saved!")

	get_tree().change_scene_to_file(
		"res://Scenes/leaderboard_container.tscn"
	)
