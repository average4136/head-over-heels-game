extends Node

# ==============================================================================
# PRELOADED BOY LINES (1 - 14)
# ==============================================================================
const BOY_1  = preload("res://Assets/downbad_voicelines/gameplay_boy_1_00086962.mp3")
const BOY_2  = preload("res://Assets/downbad_voicelines/gameplay_boy_2_00087211.mp3")
const BOY_3  = preload("res://Assets/downbad_voicelines/gameplay_boy_3_00087413.mp3")
const BOY_4  = preload("res://Assets/downbad_voicelines/gameplay_boy_4_00087944.mp3")
const BOY_5  = preload("res://Assets/downbad_voicelines/gameplay_boy_5_00088030.mp3")
const BOY_6  = preload("res://Assets/downbad_voicelines/gameplay_boy_6_00088124.mp3")
const BOY_7  = preload("res://Assets/downbad_voicelines/gameplay_boy_7_00088218.mp3")
const BOY_8  = preload("res://Assets/downbad_voicelines/gameplay_boy_8_00088698.mp3")
const BOY_9  = preload("res://Assets/downbad_voicelines/gameplay_boy_9_00088873.mp3")
const BOY_10 = preload("res://Assets/downbad_voicelines/gameplay_boy_10_00089036.mp3")
const BOY_11 = preload("res://Assets/downbad_voicelines/gameplay_boy_11_00089618.mp3")
const BOY_12 = preload("res://Assets/downbad_voicelines/gameplay_boy_12_00090597.mp3")
const BOY_13 = preload("res://Assets/downbad_voicelines/gameplay_boy_13_00090938.mp3")
const BOY_14 = preload("res://Assets/downbad_voicelines/gameplay_boy_14_00091179.mp3")

# ==============================================================================
# PRELOADED NARRATOR LINES (1 - 40)
# ==============================================================================
const NARR_1  = preload("res://Assets/downbad_voicelines/gameplay_narrator_1_00091836.mp3")
const NARR_2  = preload("res://Assets/downbad_voicelines/gameplay_narrator_2_00092094.mp3")
const NARR_3  = preload("res://Assets/downbad_voicelines/gameplay_narrator_3_00092161.mp3")
const NARR_4  = preload("res://Assets/downbad_voicelines/gameplay_narrator_4_00092253.mp3")
const NARR_5  = preload("res://Assets/downbad_voicelines/gameplay_narrator_5_00092587.mp3")
const NARR_6  = preload("res://Assets/downbad_voicelines/gameplay_narrator_6_00092701.mp3")
const NARR_7  = preload("res://Assets/downbad_voicelines/gameplay_narrator_7_00092738.mp3")
const NARR_8  = preload("res://Assets/downbad_voicelines/gameplay_narrator_8_00092843.mp3")
const NARR_9  = preload("res://Assets/downbad_voicelines/gameplay_narrator_9_00092976.mp3")
const NARR_10 = preload("res://Assets/downbad_voicelines/gameplay_narrator_10_00093069.mp3")
const NARR_11 = preload("res://Assets/downbad_voicelines/gameplay_narrator_11_00093102.mp3")
const NARR_12 = preload("res://Assets/downbad_voicelines/gameplay_narrator_12_00093151.mp3")
const NARR_13 = preload("res://Assets/downbad_voicelines/gameplay_narrator_13_00093253.mp3")
const NARR_14 = preload("res://Assets/downbad_voicelines/gameplay_narrator_14_00093269.mp3")
const NARR_15 = preload("res://Assets/downbad_voicelines/gameplay_narrator_15_00093381.mp3")
const NARR_16 = preload("res://Assets/downbad_voicelines/gameplay_narrator_16_00093928.mp3")
const NARR_17 = preload("res://Assets/downbad_voicelines/gameplay_narrator_17_00095657.mp3")
const NARR_18 = preload("res://Assets/downbad_voicelines/gameplay_narrator_18_00095738.mp3")
const NARR_19 = preload("res://Assets/downbad_voicelines/gameplay_narrator_19_00095812.mp3")
const NARR_20 = preload("res://Assets/downbad_voicelines/gameplay_narrator_20_00095867.mp3")
const NARR_21 = preload("res://Assets/downbad_voicelines/gameplay_narrator_21_00095951.mp3")
const NARR_22 = preload("res://Assets/downbad_voicelines/gameplay_narrator_22_00096018.mp3")
const NARR_23 = preload("res://Assets/downbad_voicelines/gameplay_narrator_23_00096314.mp3")
const NARR_24 = preload("res://Assets/downbad_voicelines/gameplay_narrator_24_00096373.mp3")
const NARR_25 = preload("res://Assets/downbad_voicelines/gameplay_narrator_25_00097249.mp3")
const NARR_26 = preload("res://Assets/downbad_voicelines/gameplay_narrator_26_00097278.mp3")
const NARR_27 = preload("res://Assets/downbad_voicelines/gameplay_narrator_27_00098104.mp3")
const NARR_28 = preload("res://Assets/downbad_voicelines/gameplay_narrator_28_00098129.mp3")
const NARR_29 = preload("res://Assets/downbad_voicelines/gameplay_narrator_29_00098280.mp3")
const NARR_30 = preload("res://Assets/downbad_voicelines/gameplay_narrator_30_00098435.mp3")
const NARR_31 = preload("res://Assets/downbad_voicelines/gameplay_narrator_31_00098748.mp3")
const NARR_32 = preload("res://Assets/downbad_voicelines/gameplay_narrator_32_00099085.mp3")
const NARR_33 = preload("res://Assets/downbad_voicelines/gameplay_narrator_33_00099617.mp3")
const NARR_34 = preload("res://Assets/downbad_voicelines/gameplay_narrator_34_00100523.mp3")
const NARR_35 = preload("res://Assets/downbad_voicelines/gameplay_narrator_35_00100610.mp3")
const NARR_36 = preload("res://Assets/downbad_voicelines/gameplay_narrator_36_00100634.mp3")
const NARR_37 = preload("res://Assets/downbad_voicelines/gameplay_narrator_37_00101051.mp3")
const NARR_38 = preload("res://Assets/downbad_voicelines/gameplay_narrator_38_00101089.mp3")
const NARR_39 = preload("res://Assets/downbad_voicelines/gameplay_narrator_39_00101179.mp3")
const NARR_40 = preload("res://Assets/downbad_voicelines/gameplay_narrator_40_00101225.mp3")

# ==============================================================================
# EXTRA CLIPS (Optional / Easter Eggs)
# ==============================================================================
const SND_ALMOST_DONE = preload("res://Assets/downbad_voicelines/almost_done00102767.mp3")

# ==============================================================================
# PLAYLIST SEQUENCES
# ==============================================================================
# The intro climbing lines played back-to-back until the narrator wraps up:
var intro_lines: Array[Dictionary] = [
	{"speaker": "narrator", "audio": NARR_1, "text": "Alright boy, look up there."},
	{"speaker": "narrator", "audio": NARR_2, "text": "She's waiting at the very top."},
	{"speaker": "boy",      "audio": BOY_1,  "text": "How am I supposed to climb like this?"},
	{"speaker": "narrator", "audio": NARR_3, "text": "Use your body. Swing your weight."},
	{"speaker": "narrator", "audio": NARR_4, "text": "Good luck, boy."}
]

# Lines played when the win portal is reached:
var ending_lines: Array[Dictionary] = [
	{"speaker": "narrator", "audio": NARR_5, "text": "Well would you look at that. You made it."},
	{"speaker": "boy",      "audio": BOY_2,  "text": "I... I actually reached the top!"},
	{"speaker": "girl",     "audio": SND_ALMOST_DONE, "text": "Hey... what happened to your neck?"}
]

var portal_triggered: bool = false

func _ready() -> void:
	_hook_win_portal()
	# Slight pause after loading before dialogue starts
	await get_tree().create_timer(0.8).timeout
	_play_sequence(intro_lines)

func _play_sequence(lines: Array[Dictionary]) -> void:
	for line in lines:
		# Passing 0.0 allows DialogueManager to use the audio's exact length
		DialogueManager.queue_line(line["speaker"], line["text"], line["audio"], 0.0)

func _hook_win_portal() -> void:
	# Automatically connects to your win portal Area2D in game.tscn
	var portal = get_tree().root.find_child("*portal*", true, false)
	if portal and portal.has_signal("body_entered"):
		portal.body_entered.connect(_on_portal_reached)

func _on_portal_reached(body: Node) -> void:
	if portal_triggered:
		return

	if "Guy" in body.name or body.is_in_group("player"):
		portal_triggered = true
		_play_sequence(ending_lines)
