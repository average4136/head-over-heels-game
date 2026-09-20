extends CanvasLayer

@export var next_scene_path: String = "res://Scenes/game.tscn"
@export var bgm_stream: AudioStream

@onready var slide_display: TextureRect = $SlideDisplay
@onready var card_text: Label = $CardText
@onready var voice_audio: AudioStreamPlayer = $VoiceAudio
@onready var ost: AudioStreamPlayer = $OST
@onready var timer: Timer = $Timer
@onready var skip_button: Button = $SkipButton

var slides: Array[Dictionary] = []
var current_idx: int = -1

func _ready() -> void:
	skip_button.pressed.connect(_end_cutscene)
	timer.timeout.connect(_next_slide)
	
	if bgm_stream:
		ost.stream = bgm_stream
		ost.play()
		
	_setup_slides()
	_next_slide()

# Overridden by child cutscenes (opening / ending)
func _setup_slides() -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		_end_cutscene()

func _next_slide() -> void:
	timer.stop()
	voice_audio.stop()
	current_idx += 1
	
	if current_idx >= slides.size():
		_end_cutscene()
		return
		
	var s = slides[current_idx]
	
	# Image display
	if s.get("img") != null:
		slide_display.texture = s["img"]
		slide_display.visible = true
	else:
		slide_display.visible = false
		
	# Text card display
	if s.get("text", "") != "":
		card_text.text = s["text"]
		card_text.visible = true
	else:
		card_text.visible = false
		
	# Voice line audio
	var wait: float = s.get("time", 3.0)
	if s.get("audio") != null:
		voice_audio.stream = s["audio"]
		voice_audio.play()
		wait = max(s["audio"].get_length(), wait)
		
	timer.start(wait)

func _end_cutscene() -> void:
	timer.stop()
	voice_audio.stop()
	ost.stop()
	get_tree().change_scene_to_file(next_scene_path)
