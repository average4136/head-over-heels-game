extends Node

@export var invisible_wall: CollisionShape2D # Block right until camera pan finishes
@export var player_camera: Camera2D
@export var map_overview_camera: Camera2D # Or use a Tween on player_camera
@export var stopwatch_ui: Control

var can_trigger_fail_lines: bool = false
var failure_lines = [
	"oof.",
	"you should've just asked her out in the first place boy",
	"ya ever played mario kart and fallen off the track? well im sorry because this isnt mario kart",
	"fall 7 times, get up 8",
	"im amazed at your tenacity. how down bad can you be to keep going",
	"if you wanna give up, i can teleport you to the ocean, lots of other fish there",
	"hey at least you don't take fall damage"
]

func _ready() -> void:
	can_trigger_fail_lines = false
	if invisible_wall:
		invisible_wall.set_deferred("disabled", false)
	_run_tutorial_sequence()

func _run_tutorial_sequence() -> void:
	DialogueManager.queue_line("boy", "where the hell did you take me", null, 2.5)
	DialogueManager.queue_line("narrator", "a super secret path that will take you to that girl instantly", null, 3.5)
	DialogueManager.queue_line("narrator", "once you reach the portal", null, 2.5)
	DialogueManager.queue_line("narrator", "theres only one catch", null, 2.0)
	
	# Wait for "theres only one catch" to finish
	await DialogueManager.all_dialogue_finished
	
	# 1. PAN TO MAP & PORTAL
	await _pan_camera_top_to_bottom()
	
	# 2. DELIVER PUNCHLINE
	DialogueManager.queue_line("narrator", "you have to get up there first", null, 2.5)
	await DialogueManager.all_dialogue_finished
	
	# 3. LOWER INVISIBLE WALL & START STOPWATCH
	if invisible_wall:
		invisible_wall.set_deferred("disabled", true)
	if stopwatch_ui and stopwatch_ui.has_method("start_stopwatch"):
		stopwatch_ui.start_stopwatch()
		
	# 4. REMAINING BANTER RUNS DURING CLIMB
	_run_ascent_banter()

func _pan_camera_top_to_bottom() -> void:
	# Lock player inputs here if needed
	# Tween camera from top portal back down to boy
	var tween = create_tween()
	# Example: smoothly interpolate camera position or switch active camera
	# tween.tween_property(camera, "position", target_pos, 4.0)
	await get_tree().create_timer(3.0).timeout # Replace with tween.finished

func _run_ascent_banter() -> void:
	DialogueManager.queue_line("boy", "WHAT? in this condition??", null, 2.5)
	DialogueManager.queue_line("narrator", "but of course, nothing worth doing is easyy", null, 3.0)
	DialogueManager.queue_line("boy", "this is going to take forever", null, 2.5)
	DialogueManager.queue_line("narrator", "but of course, good things take time", null, 3.0)
	DialogueManager.queue_line("boy", "you piss me off, did you do this to me? who are you?", null, 3.5)
	DialogueManager.queue_line("narrator", "im but a charming omniscient humble being gracing you with my presence", null, 4.0)
	DialogueManager.queue_line("narrator", "and you ask too many questions boy, you think too much", null, 3.5)
	DialogueManager.queue_line("narrator", "which is precisely why you have developed this syndrome", null, 3.5)
	DialogueManager.queue_line("boy", "and you know that how?", null, 2.0)
	DialogueManager.queue_line("narrator", "im a charming omniscient humble being", null, 3.0)
	DialogueManager.queue_line("boy", "so you did do this", null, 2.0)
	DialogueManager.queue_line("narrator", "oh take some responsibility, boy", null, 2.5)
	DialogueManager.queue_line("narrator", "she loves responsible men", null, 2.5)
	DialogueManager.queue_line("boy", "shut up. don't talk like you know her", null, 2.5)
	DialogueManager.queue_line("narrator", "hahaha, do I need to remind you who I am again?", null, 3.0)
	DialogueManager.queue_line("boy", "please no.", null, 1.5)
	DialogueManager.queue_line("narrator", "i guess you wouldn't believe me if I said if you had just stopped being in your head", null, 4.0)
	DialogueManager.queue_line("narrator", "and went and asked her out, it would've worked out", null, 3.5)
	DialogueManager.queue_line("boy", "WHAT? REALLY?", null, 2.0)
	DialogueManager.queue_line("narrator", "Oh what, now you want to believe me?", null, 2.5)
	DialogueManager.queue_line("narrator", "I was just kidding anyways.", null, 2.5)
	DialogueManager.queue_line("boy", "...", null, 2.0)
	DialogueManager.queue_line("narrator", "oou silent treatment", null, 2.0)
	DialogueManager.queue_line("narrator", "not a good look", null, 2.0)
	DialogueManager.queue_line("narrator", "look boy, I know you are head over heels for her", null, 3.0)
	DialogueManager.queue_line("narrator", "i mean how down bad could you be to actually agree to going on this treacherous journey for a girl", null, 4.5)
	DialogueManager.queue_line("boy", "shut it.", null, 1.5)
	DialogueManager.queue_line("narrator", "look at our little tsundere over here", null, 2.5)
	DialogueManager.queue_line("narrator", "fine, I will, unless I can't help it", null, 3.0)
	DialogueManager.queue_line("narrator", "good luck boy.", null, 2.5)
	
	await DialogueManager.all_dialogue_finished
	# NOW AND ONLY NOW CAN FAILURES TRIGGER ROASTS
	can_trigger_fail_lines = true

# Called whenever player suffers a big drop
func on_player_hard_fall() -> void:
	if can_trigger_fail_lines and not DialogueManager.is_playing:
		DialogueManager.queue_line("narrator", failure_lines.pick_random(), null, 3.0)
