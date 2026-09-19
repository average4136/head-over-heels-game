extends CanvasLayer

var voice_player: AudioStreamPlayer
var subtitle_box: PanelContainer
var subtitle_label: Label

var line_queue: Array[Dictionary] = []
var is_playing: bool = false

func _ready() -> void:
	layer = 100 # Draws on top of all gameplay/cutscenes
	
	voice_player = AudioStreamPlayer.new()
	add_child(voice_player)

	# Container for subtitles
	subtitle_box = PanelContainer.new()
	subtitle_box.set_anchors_preset(Control.PRESET_BOTTOM_WIDE)
	subtitle_box.offset_top = -130.0
	subtitle_box.offset_bottom = -30.0
	subtitle_box.offset_left = 80.0
	subtitle_box.offset_right = -80.0
	subtitle_box.visible = false

	# Text styling
	subtitle_label = Label.new()
	subtitle_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	subtitle_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	subtitle_label.autowrap_mode = TextServer.AUTOWRAP_WORD
	subtitle_box.add_child(subtitle_label)
	add_child(subtitle_box)

func queue_line(speaker: String, text: String, audio: AudioStream = null, duration: float = 3.5) -> void:
	line_queue.append({
		"speaker": speaker,
		"text": text,
		"audio": audio,
		"duration": duration
	})
	if not is_playing:
		_play_next()

func _play_next() -> void:
	if line_queue.is_empty():
		is_playing = false
		subtitle_box.visible = false
		return

	is_playing = true
	var current = line_queue.pop_front()
	
	# Visual formatting per speaker
	if current["speaker"] == "narrator":
		subtitle_label.text = "[Omniscient Being]: " + current["text"]
		subtitle_label.modulate = Color(1.0, 0.85, 0.2) # Gold
	elif current["speaker"] == "girl":
		subtitle_label.text = "[Girl]: " + current["text"]
		subtitle_label.modulate = Color(1.0, 0.6, 0.8) # Pink
	else:
		subtitle_label.text = "[Boy]: " + current["text"]
		subtitle_label.modulate = Color(0.9, 0.9, 1.0) # Light blue/white

	subtitle_box.visible = true

	var wait_time: float = current["duration"]
	if current["audio"] != null:
		voice_player.stream = current["audio"]
		voice_player.play()
		wait_time = max(current["audio"].get_length(), current["duration"])

	await get_tree().create_timer(wait_time).timeout
	_play_next()

func stop_dialogue() -> void:
	voice_player.stop()
	line_queue.clear()
	is_playing = false
	subtitle_box.visible = false
