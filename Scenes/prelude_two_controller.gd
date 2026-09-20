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

func _ready() -> void:
	if pan_camera:
		pan_camera.enabled = false

	await get_tree().create_timer(0.5).timeout
	_play_prelude_two()

func _play_prelude_two() -> void:
	DialogueManager.stop_dialogue()

	# 1. Play Boy Line 1 on Guy's normal camera
	DialogueManager.queue_line("boy", "Where the hell did you take me?", BOY_1)
	
	# Wait for Boy's question to finish playing completely
	await DialogueManager.all_dialogue_finished

	# 2. Hard cut directly to the Portal camera
	_cut_to_portal_shot()

	# 3. Queue narrator lines while camera is framing the portal
	DialogueManager.queue_line("narrator", "A super secret path that will take you to that girl instantly.", NARR_1)
	DialogueManager.queue_line("narrator", "ONCE you reach that portal.", NARR_2)
	DialogueManager.queue_line("narrator", "But there's only one catch.", NARR_3)
	DialogueManager.queue_line("narrator", "You have to get up there first.", NARR_4)

	await DialogueManager.all_dialogue_finished

	# 4. Sweep down to player spawn and transition into playable level
	_pan_down_to_spawn_and_start()

func _cut_to_portal_shot() -> void:
	print(">>> CUTTING TO PORTAL CAMERA")
	var player_cam = get_tree().root.find_child("*Camera*", true, false) as Camera2D
	if player_cam and player_cam != pan_camera:
		player_cam.enabled = false

	if pan_camera and portal_marker:
		pan_camera.enabled = true
		pan_camera.make_current()
		pan_camera.global_position = portal_marker.global_position
		pan_camera.zoom = Vector2(0.9, 0.9)

func _pan_down_to_spawn_and_start() -> void:
	if not pan_camera or not spawn_marker:
		get_tree().change_scene_to_file(main_level_scene)
		return

	print(">>> SWEEPING DOWN TO SPAWN")
	var tween = create_tween().set_parallel(true)

	# 3.5s smooth pan down
	tween.tween_property(pan_camera, "global_position", spawn_marker.global_position, 3.5)\
		.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)

	# Wide zoom-out during the drop, then settle
	tween.tween_property(pan_camera, "zoom", Vector2(0.45, 0.45), 1.8)\
		.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.chain().tween_property(pan_camera, "zoom", Vector2(0.8, 0.8), 1.7)\
		.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)

	await tween.finished

	await get_tree().create_timer(0.3).timeout
	var err = get_tree().change_scene_to_file(main_level_scene)
	if err != OK:
		push_error("Failed to load main level scene! Error code: %d" % err)
