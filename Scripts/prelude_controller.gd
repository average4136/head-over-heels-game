extends Node

@export_file("*.tscn") var main_climb_scene: String = "res://Scenes/game.tscn"

@onready var eye_fade: ColorRect = $"../CanvasLayer/EyeFade"

func _ready() -> void:
	# Start with black screen, then fade into the world
	if eye_fade:
		eye_fade.modulate.a = 1.0
		eye_fade.visible = true
		var tween = create_tween()
		tween.tween_property(eye_fade, "modulate:a", 0.0, 1.8)
		await tween.finished
		eye_fade.visible = false
	
	_play_prelude()

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

func _unhandled_input(event: InputEvent) -> void:
	# Pressing Space, Enter, or Escape skips the walk and warps immediately
	if event.is_action_pressed("ui_accept") or event.is_action_pressed("ui_cancel"):
		teleport_to_climb()

func teleport_to_climb() -> void:
	DialogueManager.stop_dialogue()
	get_tree().change_scene_to_file(main_climb_scene)
