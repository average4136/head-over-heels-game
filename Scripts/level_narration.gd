extends Node

# ==============================================================================
# PRELOAD BOY AUDIO (1 - 14)
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
# PRELOAD NARRATOR AUDIO (1 - 40)
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

# Portal ending audio lines
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

var portal_triggered: bool = false

func _ready() -> void:
	_hook_win_portal()
	await get_tree().create_timer(1.0).timeout
	_play_gameplay_intro()

func _play_gameplay_intro() -> void:
	# 1. Gameplay start up to "Good luck, boy."
	DialogueManager.queue_line("boy", "Where the hell did you take me?", BOY_1)
	DialogueManager.queue_line("narrator", "A super secret path that will take you to that girl instantly.", NARR_1)
	DialogueManager.queue_line("narrator", "ONCE you reach that portal.", NARR_2)
	DialogueManager.queue_line("narrator", "But there's only one catch.", NARR_3)
	DialogueManager.queue_line("narrator", "You have to get up there first.", NARR_4)
	DialogueManager.queue_line("boy", "What? In this condition?", BOY_2)
	DialogueManager.queue_line("narrator", "But of course. Nothing worth doing is easy.", NARR_5)
	DialogueManager.queue_line("boy", "This is gonna take forever.", BOY_3)
	DialogueManager.queue_line("narrator", "But of course.", NARR_6)
	DialogueManager.queue_line("narrator", "Good things take time.", NARR_7)
	DialogueManager.queue_line("boy", "You know what? You piss me off. Did you do this to me?", BOY_4)
	DialogueManager.queue_line("boy", "Who are you?", BOY_5)
	DialogueManager.queue_line("narrator", "I'm but a charming, omniscient, humble being,", NARR_8)
	DialogueManager.queue_line("narrator", "gracing you with my presence. And you ask too many questions, boy.", NARR_9)
	DialogueManager.queue_line("narrator", "You think too much,", NARR_10)
	DialogueManager.queue_line("narrator", "which is precisely why", NARR_11)
	DialogueManager.queue_line("narrator", "you have developed this syndrome.", NARR_12)
	DialogueManager.queue_line("boy", "And you know that how?", BOY_6)
	DialogueManager.queue_line("narrator", "Well,", NARR_13)
	DialogueManager.queue_line("narrator", "because I'm a charming, omniscient, humble being.", NARR_14)
	DialogueManager.queue_line("boy", "So you DID do this.", BOY_7)
	DialogueManager.queue_line("narrator", "Oh take some responsibility, boy. She loves responsible men.", NARR_15)
	DialogueManager.queue_line("boy", "Don't talk like you know her.", BOY_8)
	DialogueManager.queue_line("narrator", "Haha, do I need to remind you who I am again?", NARR_16)
	DialogueManager.queue_line("boy", "Please, no.", BOY_9)
	DialogueManager.queue_line("narrator", "I guess you wouldn't believe me then if I said that", NARR_17)
	DialogueManager.queue_line("narrator", "if you had just been out of your own head earlier", NARR_18)
	DialogueManager.queue_line("narrator", "and actually went and asked her out,", NARR_19)
	DialogueManager.queue_line("narrator", "it WOULD have worked out.", NARR_20)
	DialogueManager.queue_line("boy", "What, REALLY?", BOY_10)
	DialogueManager.queue_line("narrator", "Oh what? Now you want to believe me?", NARR_21)
	DialogueManager.queue_line("narrator", "I was just kidding, anyways.", NARR_22)
	
	# Silence beat: no audio file, display [...] for 2.0s
	DialogueManager.queue_line("boy", "[...]", null, 2.0)
	
	DialogueManager.queue_line("narrator", "Ouu, silent treatment.", NARR_23)
	DialogueManager.queue_line("narrator", "Not a good look.", NARR_24)
	DialogueManager.queue_line("narrator", "Look boy,", NARR_25)
	DialogueManager.queue_line("narrator", "I know you are head over heels for her.", NARR_26)
	DialogueManager.queue_line("narrator", "I mean", NARR_27)
	DialogueManager.queue_line("narrator", "how down bad can you be to ACTUALLY agree to going on this treacherous journey", NARR_28)
	DialogueManager.queue_line("narrator", "for a single girl.", NARR_29)
	DialogueManager.queue_line("boy", "Shut it.", BOY_11)
	DialogueManager.queue_line("narrator", "Fine, I will.", NARR_30)
	# (NARR_31 is the "Good luck, boy." wrap-up before silence)
	DialogueManager.queue_line("narrator", "Good luck, boy.", NARR_31)

func _play_portal_ending() -> void:
	DialogueManager.stop_dialogue()
	
	DialogueManager.queue_line("narrator", "Wow, you made it boy!", NARR_32)
	DialogueManager.queue_line("boy", "Yeah, yeah, will you cure me now?", BOY_12)
	DialogueManager.queue_line("narrator", "Hmm, you've gotten really good with that head, though. I feel like you should keep it.", NARR_33)
	DialogueManager.queue_line("boy", "*sigh*", BOY_13)
	DialogueManager.queue_line("narrator", "You are no fun. You know that, right?", NARR_34)
	DialogueManager.queue_line("narrator", "Fine.", NARR_35)
	DialogueManager.queue_line("narrator", "Walk through that portal.", NARR_36)
	DialogueManager.queue_line("narrator", "But listen to me.", NARR_37)
	DialogueManager.queue_line("narrator", "I cannot guarantee your syndrome to be fixed.", NARR_38)
	DialogueManager.queue_line("narrator", "That is the truth. It's all up to you.", NARR_39)
	DialogueManager.queue_line("boy", "Wait, what?", BOY_14)

func _hook_win_portal() -> void:
	var portal = get_tree().root.find_child("*portal*", true, false)
	if portal and portal.has_signal("body_entered"):
		portal.body_entered.connect(_on_portal_reached)

func _on_portal_reached(body: Node) -> void:
	if portal_triggered:
		return
	if "Guy" in body.name or body.is_in_group("player"):
		portal_triggered = true
		_play_portal_ending()
