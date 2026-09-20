extends Node

@export_file("*.tscn") var main_climb_scene: String = "res://Scenes/game.tscn"

@onready var eye_fade: ColorRect = $"../CanvasLayer/EyeFade"

func _ready() -> void:
	_setup_prelude_camera()
	_setup_drooping_head()

	# Start with black screen, then fade into the world
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
		# Swing head down and to the side relative to the body
		# (e.g. 90 degrees / ~1.57 radians tipped over)
		head.rotation = 1.57
		head.global_position = body.global_position + Vector2(45.0, 20.0)
		
		# Zero out initial physics velocity so it doesn't violently whip
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

		# Disable vertical drag and position Guy cleanly above the dialogue
		guy_cam.drag_vertical_enabled = false
		guy_cam.drag_vertical_offset = 0.0
		guy_cam.offset = Vector2(0, 90)

		# Allow horizontal movement and unclamp limits
		guy_cam.drag_horizontal_enabled = true
		guy_cam.limit_left = -10000000
		guy_cam.limit_right = 10000000
		guy_cam.limit_top = -10000000
		guy_cam.limit_bottom = 10000000

		# Zoomed out view
		guy_cam.zoom = Vector2(0.8, 0.8)
		guy_cam.reset_smoothing()

func _play_prelude() -> void:
	await get_tree().create_timer(0.5).timeout

	DialogueManager.queue_line("boy", "what the-", null, 1.5)
	DialogueManager.queue_line("boy", "MY HEAD", null, 2.0)
	DialogueManager.queue_line("narrator", "dont be so down, i know how to fix you", null, 3.5)
	DialogueManager.queue_line("boy", "wh-who are you?", null, 2.0)
	DialogueManager.queue_line("narrator", "pay no mind to that for now, be a good boy and listen", null, 3.5)
	DialogueManager.queue_line("narrator", "you want to talk to that girl right?", null, 2.5)
	DialogueManager.queue_line("boy", "WHA", null, 1.5)
	DialogueManager.queue_line("narrator", "You need not be ashamed, here's what you must do", null, 3.5)

	# When dialogue completes, warp to the climb map
	await DialogueManager.all_dialogue_finished
	teleport_to_climb()

func teleport_to_climb() -> void:
	DialogueManager.stop_dialogue()
	get_tree().change_scene_to_file(main_climb_scene)
