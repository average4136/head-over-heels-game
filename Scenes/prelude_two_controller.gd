extends Node

@export_file("*.tscn") var main_level_scene: String = "res://Scenes/Level scenes/main_level.tscn"

# Camera & Pan setup
@onready var pan_camera: Camera2D = $"../PanCamera"
@onready var portal_marker: Marker2D = $"../PortalPos"
@onready var spawn_marker: Marker2D = $"../SpawnPos"

# Audio lines
const BOY_1 = preload("res://Assets/downbad_voicelines/gameplay_boy_1_00086962.mp3")
const NARR_1 = preload("res://Assets/downbad_voicelines/gameplay_narrator_1_00091836.mp3")
const NARR_2 = preload("res://Assets/downbad_voicelines/gameplay_narrator_2_00092094.mp3")
const NARR_3 = preload("res://Assets/downbad_voicelines/gameplay_narrator_3_00092161.mp3")
const NARR_4 = preload("res://Assets/downbad_voicelines/gameplay_narrator_4_00092253.mp3")

var current_line_idx: int = 0

func _ready() -> void:
	# Ensure pan camera starts disabled
	if pan_camera:
		pan_camera.enabled = false

	# Connect line signal if your DialogueManager exposes one
	if DialogueManager.has_signal("line_started"):
		DialogueManager.line_started.connect(_on_dialogue_line_started)

	await get_tree().create_timer(0.5).timeout
	_play_prelude_two()

func _play_prelude_two() -> void:
	DialogueManager.stop_dialogue()
	current_line_idx = 0

	# Line 0: Guy speaks while camera is on Guy
	current_line_idx += 1
	DialogueManager.queue_line("boy", "Where the hell did you take me?", BOY_1)
	
	# Wait for Boy's line to finish before queueing the Narrator's cut line
	await DialogueManager.line_finished

	# CUT INSTANTLY TO PORTAL ON THIS LINE
	_cut_to_portal_shot()

	# Narrator lines at the top of the map
	DialogueManager.queue_line("narrator", "A super secret path that will take you to that girl instantly.", NARR_1)
	DialogueManager.queue_line("narrator", "ONCE you reach that portal.", NARR_2)
	DialogueManager.queue_line("narrator", "But there's only one catch.", NARR_3)
	DialogueManager.queue_line("narrator", "You have to get up there first.", NARR_4)

	# Wait until narration finishes
	await DialogueManager.all_dialogue_finished

	# Pan down to the player spawn to show full scale, then enter level
	_pan_down_to_spawn_and_start()

func _cut_to_portal_shot() -> void:
	# 1. Turn off Guy's camera
	var guy_cam = get_tree().root.find_child("*Camera*", true, false) as Camera2D
	if guy_cam and guy_cam != pan_camera:
		guy_cam.enabled = false

	# 2. Hard cut to the portal marker position
	if pan_camera and portal_marker:
		pan_camera.enabled = true
		pan_camera.make_current()
		pan_camera.global_position = portal_marker.global_position
		pan_camera.zoom = Vector2(0.9, 0.9)

func _pan_down_to_spawn_and_start() -> void:
	if not pan_camera or not spawn_marker:
		get_tree().change_scene_to_file(main_level_scene)
		return

	# Smooth sweep from portal down to Guy
	var tween = create_tween().set_parallel(true)

	# Pan down over 3.5 seconds
	tween.tween_property(pan_camera, "global_position", spawn_marker.global_position, 3.5)\
		.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)

	# Pull back to show vertical height, then zoom back into player framing
	tween.tween_property(pan_camera, "zoom", Vector2(0.45, 0.45), 1.8)\
		.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.chain().tween_property(pan_camera, "zoom", Vector2(0.8, 0.8), 1.7)\
		.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)

	await tween.finished

	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file(main_level_scene)

func _on_dialogue_line_started(_speaker: String, _text: String) -> void:
	pass
