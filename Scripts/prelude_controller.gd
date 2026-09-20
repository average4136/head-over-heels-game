extends Node

# Points directly to your team's main climb scene
@export_file("*.tscn") var main_climb_scene: String = "res://Scenes/game.tscn"

func _ready() -> void:
	_play_prelude()

func _play_prelude() -> void:
	# Initial delay so player lands and takes in their heavy head
	await get_tree().create_timer(0.8).timeout

	DialogueManager.queue_line("boy", "what the-", null, 1.5)
	DialogueManager.queue_line("boy", "MY HEAD", null, 2.0)
	DialogueManager.queue_line("narrator", "dont be so down, i know how to fix you", null, 3.5)
	DialogueManager.queue_line("boy", "wh-who are you?", null, 2.0)
	DialogueManager.queue_line("narrator", "pay no mind to that for now, be a good boy and listen", null, 3.5)
	DialogueManager.queue_line("narrator", "you want to talk to that girl right?", null, 2.5)
	DialogueManager.queue_line("boy", "WHA", null, 1.5)
	DialogueManager.queue_line("narrator", "You need not be ashamed, here's what you must do", null, 3.5)

	# Await until the narrator finishes the entire block
	await DialogueManager.all_dialogue_finished

	# Teleport to the main climb scene
	teleport_to_climb()

func _unhandled_input(event: InputEvent) -> void:
	# Space or Escape lets the player skip the walk and warp immediately
	if event.is_action_pressed("ui_accept") or event.is_action_pressed("ui_cancel"):
		teleport_to_climb()

func teleport_to_climb() -> void:
	DialogueManager.stop_dialogue()
	get_tree().change_scene_to_file(main_climb_scene)
