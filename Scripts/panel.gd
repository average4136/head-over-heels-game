extends Panel

var time: float = 0.0
var minutes: int = 0
var seconds: int = 0
var mseconds: int = 0

var timer_stopped: bool = false

const SAVE_PATH := "user://leaderboard.json"
const MAX_ENTRIES := 5

func _process(delta) -> void:
	# Stop the timer if the game has ended
	if timer_stopped:
		return

	time += delta

	mseconds = fmod(time, 1) * 100
	seconds = fmod(time, 60)
	minutes = fmod(time, 3600) / 60

	$mseconds.text = "%02d:" % mseconds
	$seconds.text = "%02d:" % seconds
	$minutes.text = "%02d" % minutes


func _on_button_pressed() -> void:
	# Stop the timer
	timer_stopped = true

	print("Timer stopped at: ", time)

	# Put the cursor into the name box
	$PlayerName.grab_focus()

	# Tell the player what to do
	print("Enter your name and press Enter.")


func _on_line_edit_text_submitted(new_text: String) -> void:
	var player_name = new_text.strip_edges()

	# Don't allow an empty name
	if player_name == "":
		print("Please enter your name!")
		$PlayerName.grab_focus()
		return

	# Save the score
	add_score(player_name, time)

	print("Score saved: ", player_name, " - ", time)

	# Go to leaderboard
	get_tree().change_scene_to_file(
		"res://Scenes/leaderboard_container.tscn"
	)


func add_score(player_name: String, score_time: float) -> void:
	var scores: Array = []

	# Load existing scores
	if FileAccess.file_exists(SAVE_PATH):
		var file := FileAccess.open(SAVE_PATH, FileAccess.READ)

		if file:
			var data = JSON.parse_string(file.get_as_text())

			if data is Array:
				scores = data

	# Add the new score
	scores.append({
		"name": player_name,
		"time": score_time
	})

	# Sort fastest → slowest
	scores.sort_custom(func(a, b):
		return float(a["time"]) < float(b["time"])
	)

	# Keep only the top 5
	if scores.size() > MAX_ENTRIES:
		scores.resize(MAX_ENTRIES)

	# Save to file
	var file := FileAccess.open(SAVE_PATH, FileAccess.WRITE)

	if file:
		file.store_string(JSON.stringify(scores))
		print("Saved scores: ", scores)
	else:
		print("ERROR: Could not save leaderboard!")
	
