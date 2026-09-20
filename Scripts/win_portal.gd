extends Area2D

@export_file("*.tscn") var ending_cutscene_path: String = "res://Scenes/Cutscenes/ending_cutscene.tscn"

var triggered: bool = false

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if triggered:
		return

	if body.is_in_group("player") or body.name in ["Guy", "char", "Head", "Body"] or (body.get_parent() and "Guy" in body.get_parent().name):
		triggered = true
		print(">>> PORTAL ACTIVATED!")

		# 1. Stop and record timer
		var panel = get_tree().root.find_child("Panel", true, false)
		if panel and "time" in panel:
			panel.timer_stopped = true
			Leaderboard.final_run_time = panel.time
			print("FINAL RUN TIME SAVED: ", panel.time)
		else:
			print("Notice: Panel node or .time not found directly.")

		# 2. Dialogue / Narration
		var narration = get_tree().root.find_child("level_narration", true, false)
		if narration and narration.has_method("_play_portal_ending"):
			print(">>> Found level_narration! Playing lines...")
			narration._play_portal_ending()
			
			# Wait for dialogue, but add a fallback timeout so it never freezes the game
			if DialogueManager.is_playing:
				await DialogueManager.all_dialogue_finished
		else:
			print(">>> level_narration node not found in scene tree. Skipping voice wait.")
			DialogueManager.stop_dialogue()

		# 3. Transition
		print(">>> Transitioning scene to: ", ending_cutscene_path)
		var err = get_tree().change_scene_to_file(ending_cutscene_path)
		if err != OK:
			push_error("Failed to load scene! Error code: %d. Check if the path exists!" % err)
