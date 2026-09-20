extends Node

# Portal Area2D node reference
@export var win_portal: Area2D

var portal_reached: bool = false

func _ready() -> void:
	if win_portal:
		win_portal.body_entered.connect(_on_portal_reached)

	# Start climbing banter shortly after entering the level
	await get_tree().create_timer(1.2).timeout
	_play_climb_dialogue()

func _play_climb_dialogue() -> void:
	if portal_reached:
		return

	DialogueManager.stop_dialogue()

	# Section 1: Complaint & Omniscient introduction
	_play_line("boy", "What? In this condition?", "gameplay_boy_2")
	_play_line("narrator", "But of course. Nothing worth doing is easy.", "gameplay_narrator_5")
	_play_line("boy", "This is gonna take forever.", "gameplay_boy_3")
	_play_line("narrator", "But of course.", "gameplay_narrator_6")
	_play_line("narrator", "Good things take time.", "gameplay_narrator_7")
	_play_line("boy", "You know what? You piss me off. Did you do this to me?", "gameplay_boy_4")
	_play_line("boy", "Who are you?", "gameplay_boy_5")
	_play_line("narrator", "I'm but a charming, omniscient, humble being,", "gameplay_narrator_8")
	_play_line("narrator", "gracing you with my presence. And you ask too many questions, boy.", "gameplay_narrator_9")
	_play_line("narrator", "You think too much,", "gameplay_narrator_10")
	_play_line("narrator", "which is precisely why", "gameplay_narrator_11")
	_play_line("narrator", "you have developed this syndrome.", "gameplay_narrator_12")
	_play_line("boy", "And you know that how?", "gameplay_boy_6")
	_play_line("narrator", "Well,", "gameplay_narrator_13")
	_play_line("narrator", "because I'm a charming, omniscient, humble being.", "gameplay_narrator_14")
	_play_line("boy", "So you DID do this.", "gameplay_boy_7")
	_play_line("narrator", "Oh take some responsibility, boy. She loves responsible men.", "gameplay_narrator_15")
	_play_line("boy", "Don't talk like you know her.", "gameplay_boy_8")
	_play_line("narrator", "Haha, do I need to remind you who I am again?", "gameplay_narrator_16")
	_play_line("boy", "Please, no.", "gameplay_boy_9")

	# Section 2: The Girl tease
	_play_line("narrator", "I guess you wouldn't believe me then if I said that", "gameplay_narrator_17")
	_play_line("narrator", "if you had just been out of your own head earlier", "gameplay_narrator_18")
	_play_line("narrator", "and actually went and asked her out,", "gameplay_narrator_19")
	_play_line("narrator", "it WOULD have worked out.", "gameplay_narrator_20")
	_play_line("boy", "What, REALLY?", "gameplay_boy_10")
	_play_line("narrator", "Oh what? Now you want to believe me?", "gameplay_narrator_21")
	_play_line("narrator", "I was just kidding, anyways.", "gameplay_narrator_22")
	DialogueManager.queue_line("boy", "...", null, 2.0)
	_play_line("narrator", "Ouu, silent treatment.", "gameplay_narrator_23")
	_play_line("narrator", "Not a good look.", "gameplay_narrator_24")
	_play_line("narrator", "Look boy,", "gameplay_narrator_25")
	_play_line("narrator", "I know you are head over heels for her.", "gameplay_narrator_26")
	_play_line("narrator", "I mean", "gameplay_narrator_27")
	_play_line("narrator", "how down bad can you be to ACTUALLY agree to going on this treacherous journey", "gameplay_narrator_28")
	_play_line("narrator", "for a single girl.", "gameplay_narrator_29")
	_play_line("boy", "Shut it.", "gameplay_boy_11")
	_play_line("narrator", "Fine, I will.", "gameplay_narrator_30")
	_play_line("narrator", "Good luck, boy.", "gameplay_narrator_31")

func _on_portal_reached(body: Node2D) -> void:
	if portal_reached:
		return
	if body.is_in_group("player") or body.name in ["Guy", "char", "Head", "Body"] or (body.get_parent() and "Guy" in body.get_parent().name):
		portal_reached = true
		_play_portal_ending()

func _play_portal_ending() -> void:
	DialogueManager.stop_dialogue()

	_play_line("narrator", "Wow, you made it boy!", "gameplay_narrator_32")
	_play_line("boy", "Yeah, yeah, will you cure me now?", "gameplay_boy_12")
	_play_line("narrator", "Hmm, you've gotten really good with that head, though. I feel like you should keep it.", "gameplay_narrator_33")
	_play_line("boy", "*sigh*", "gameplay_boy_13")
	_play_line("narrator", "You are no fun. You know that, right?", "gameplay_narrator_34")
	_play_line("narrator", "Fine.", "gameplay_narrator_35")
	_play_line("narrator", "Walk through that portal.", "gameplay_narrator_36")
	_play_line("narrator", "But listen to me.", "gameplay_narrator_37")
	_play_line("narrator", "I cannot guarantee your syndrome to be fixed.", "gameplay_narrator_38")
	_play_line("narrator", "That is the truth. It's all up to you.", "gameplay_narrator_39")
	_play_line("boy", "Wait, what?", "gameplay_boy_14")

func _play_line(speaker: String, text: String, base_filename: String) -> void:
	var stream = _find_voiceline(base_filename)
	DialogueManager.queue_line(speaker, text, stream)

func _find_voiceline(base_filename: String) -> AudioStream:
	var base_path = "res://Assets/downbad_voicelines/"
	var exact_path = base_path + base_filename + ".mp3"
	if ResourceLoader.exists(exact_path):
		return load(exact_path)

	# Scan folder if files have exported hash numbers appended
	var dir = DirAccess.open(base_path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if not dir.current_is_dir() and file_name.begins_with(base_filename) and file_name.ends_with(".mp3"):
				return load(base_path + file_name)
			file_name = dir.get_next()

	print("Notice: Audio file matching ", base_filename, " not found in voicelines folder.")
	return null
