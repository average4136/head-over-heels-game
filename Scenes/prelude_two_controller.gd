extends Node

@export_file("*.tscn") var main_level_scene: String = "res://Scenes/Level scenes/main_level.tscn"

# Dialogue audio preloads (Update paths if filenames or hashes differ)
const BOY_1 = preload("res://Assets/downbad_voicelines/gameplay_boy_1_00086962.mp3")
const NARR_1 = preload("res://Assets/downbad_voicelines/gameplay_narrator_1_00091836.mp3")
const NARR_2 = preload("res://Assets/downbad_voicelines/gameplay_narrator_2_00092094.mp3")
const NARR_3 = preload("res://Assets/downbad_voicelines/gameplay_narrator_3_00092161.mp3")
const NARR_4 = preload("res://Assets/downbad_voicelines/gameplay_narrator_4_00092253.mp3")

func _ready() -> void:
	# Give the scene half a second to settle in before dialogue starts
	await get_tree().create_timer(0.5).timeout
	_play_prelude_two()

func _play_prelude_two() -> void:
	DialogueManager.stop_dialogue()

	DialogueManager.queue_line("boy", "Where the hell did you take me?", BOY_1)
	DialogueManager.queue_line("narrator", "A super secret path that will take you to that girl instantly.", NARR_1)
	DialogueManager.queue_line("narrator", "ONCE you reach that portal.", NARR_2)
	DialogueManager.queue_line("narrator", "But there's only one catch.", NARR_3)
	DialogueManager.queue_line("narrator", "You have to get up there first.", NARR_4)

	await DialogueManager.all_dialogue_finished
	teleport_to_main_level()

func teleport_to_main_level() -> void:
	DialogueManager.stop_dialogue()
	print(">>> Prelude 2 finished! Teleporting to: ", main_level_scene)
	var err = get_tree().change_scene_to_file(main_level_scene)
	if err != OK:
		push_error("Failed to load main level scene! Error code: %d" % err)
