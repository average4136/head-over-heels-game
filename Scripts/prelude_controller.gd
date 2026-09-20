extends Node

@export_file("*.tscn") var main_climb_scene: String = "res://Scenes/game.tscn"

@onready var eye_fade: ColorRect = $"../CanvasLayer/EyeFade"

# Preloaded Prelude Lines (MP3)
const BOY_P1 = preload("res://Assets/downbad_voicelines/prelude_boy_1.mp3")
const BOY_P2 = preload("res://Assets/downbad_voicelines/prelude_boy_2_00086593.mp3")
const BOY_P3 = preload("res://Assets/downbad_voicelines/prelude_boy_3_00086760.mp3")

const NARR_P1 = preload("res://Assets/downbad_voicelines/prelude_narrator_1_00091427.mp3")
const NARR_P2 = preload("res://Assets/downbad_voicelines/prelude_narrator_2_00091519.mp3")
const NARR_P3 = preload("res://Assets/downbad_voicelines/prelude_narrator_3_00091601.mp3")
const NARR_P4 = preload("res://Assets/downbad_voicelines/prelude_narrator_4_00091667.mp3")
const NARR_P5 = preload("res://Assets/downbad_voicelines/prelude_narrator_5_00091725.mp3")

func _ready() -> void:
	_setup_prelude_camera()
	_setup_drooping_head()

	if eye_fade:
		eye_fade.modulate.a = 1.0
		eye_fade.visible = true
		var tween = create_tween()
		tween.tween_property(eye_fade, "modulate:a", 0.0, 1.8)
		await tween.finished
		eye_fade.visible = false
	
	_play_prelude()

func _setup_drooping_head() -> void:
	var guy = $"../Guy"
	if not guy:
		return
	var head = guy.find_child("Head", true, false) as RigidBody2D
	var body = guy.find_child("Body", true, false) as RigidBody2D
	if head and body:
		head.rotation = 1.57
		head.global_position = body.global_position + Vector2(45.0, 20.0)
		head.linear_velocity = Vector2.ZERO
		head.angular_velocity = 0.0

func _setup_prelude_camera() -> void:
	var guy = $"../Guy"
	if not guy:
		return
	var guy_cam = guy.find_child("*Camera*", true, false) as Camera2D
	if guy_cam:
		guy_cam.enabled = true
		guy_cam.make_current()
		guy_cam.drag_vertical_enabled = false
		guy_cam.drag_vertical_offset = 0.0
		guy_cam.offset = Vector2(0, 90)
		guy_cam.drag_horizontal_enabled = true
		guy_cam.limit_left = -10000000
		guy_cam.limit_right = 10000000
		guy_cam.limit_top = -10000000
		guy_cam.limit_bottom = 10000000
		guy_cam.zoom = Vector2(0.8, 0.8)
		guy_cam.reset_smoothing()

func _play_prelude() -> void:
	await get_tree().create_timer(0.5).timeout

	DialogueManager.queue_line("boy", "What the? My head", BOY_P1)
	DialogueManager.queue_line("narrator", "Don't be so down. I know how to fix you.", NARR_P1)
	DialogueManager.queue_line("boy", "And who are you?", BOY_P2)
	DialogueManager.queue_line("narrator", "Pay no mind to that for now.", NARR_P2)
	DialogueManager.queue_line("narrator", "You want to talk to that girl, right?", NARR_P3)
	DialogueManager.queue_line("boy", "WHA", BOY_P3)
	DialogueManager.queue_line("narrator", "You need not be ashamed.", NARR_P4)
	DialogueManager.queue_line("narrator", "Here's what you must do.", NARR_P5)

	await DialogueManager.all_dialogue_finished
	teleport_to_climb()

func teleport_to_climb() -> void:
	DialogueManager.stop_dialogue()
	get_tree().change_scene_to_file(main_climb_scene)
