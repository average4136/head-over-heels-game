extends PanelContainer

const SAVE_PATH := "user://leaderboard.json"
const MAX_ENTRIES := 5

var scores: Array = [{"name": "test", "time": 4.0}]


func _ready():
	load_scores()


func add_score(player_name: String, time: float):
	var entry = {
		"name": player_name,
		"time": time
	}

	scores.append(entry)

	scores.sort_custom(func(a, b):
		return a["time"] < b["time"]
	)

	if scores.size() > MAX_ENTRIES:
		scores.resize(MAX_ENTRIES)

	save_scores()



func save_scores():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)

	if file:
		file.store_string(JSON.stringify(scores))

func update_leaderboard() -> void:
	if not has_node("PanelContainer/VBoxContainer"):
		return

	var container = get_node("PanelContainer/VBoxContainer")
	var entries = container.get_children()

	for i in range(min(5, entries.size() - 1)):
		var panel = entries[i + 1]
		var label = panel.get_child(0)

		if i < Leaderboard.scores.size():
			var score = Leaderboard.scores[i]
			label.text = "%d. %s    %.2f seconds" % [i + 1, score["name"], score["time"]]


func load_scores():
	if not FileAccess.file_exists(SAVE_PATH):
		scores = []
		return

	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	var data = JSON.parse_string(file.get_as_text())

	if data is Array:
		scores = data
	else:
		scores = []
