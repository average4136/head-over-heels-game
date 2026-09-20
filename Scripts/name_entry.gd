extends Control

@onready var time_label: Label = $CenterContainer/PanelContainer/VBoxContainer/TimeLabel
@onready var player_name_input: LineEdit = $CenterContainer/PanelContainer/VBoxContainer/PlayerName
@onready var submit_button: Button = $CenterContainer/PanelContainer/VBoxContainer/SubmitButton

func _ready() -> void:
	submit_button.pressed.connect(_on_submit_pressed)
	player_name_input.text_submitted.connect(_on_name_submitted)
	
	var t = Leaderboard.final_run_time
	var mins = int(t / 60.0)
	var secs = int(fmod(t, 60.0))
	var msecs = int(fmod(t, 1.0) * 100)
	time_label.text = "Final Time: %02d:%02d.%02d" % [mins, secs, msecs]
	
	player_name_input.grab_focus()

func _on_submit_pressed() -> void:
	_commit_entry(player_name_input.text)

func _on_name_submitted(new_text: String) -> void:
	_commit_entry(new_text)

func _commit_entry(input_name: String) -> void:
	var final_name = input_name.strip_edges()
	if final_name == "":
		final_name = "Guy"

	Leaderboard.add_score(final_name, Leaderboard.final_run_time)
	get_tree().change_scene_to_file("res://Scenes/leaderboard_container.tscn")
